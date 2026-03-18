#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
stage_root="$(mktemp -d)"

skills=(
  "ma"
  "ma-review"
  "ma-system"
  "ma-legibility"
  "ma-mapping"
  "ma-flow"
  "ma-reduction"
)

require_path() {
  local path="$1"
  if [[ ! -e "$path" ]]; then
    echo "missing required path: $path" >&2
    exit 1
  fi
}

is_valid_source_root() {
  local root="$1"

  [[ -f "$root/ma/SKILL.md" ]] || return 1
  [[ -f "$root/ma/references/examples.md" ]] || return 1
  [[ -f "$root/ma-review/SKILL.md" ]] || return 1
  [[ -f "$root/ma-review/assets/report-template.md" ]] || return 1
  [[ -f "$root/ma-review/references/review-rubric.md" ]]
}

detect_source_root() {
  local candidate
  local candidates=(
    "$HOME/.codex/skills"
    "$HOME/.claude/skills"
    "$HOME/.local/share/skills"
  )

  if [[ -n "${MA_SKILLS_SOURCE_ROOT:-}" ]]; then
    printf '%s\n' "$MA_SKILLS_SOURCE_ROOT"
    return 0
  fi

  for candidate in "${candidates[@]}"; do
    if [[ -d "$candidate" ]] && is_valid_source_root "$candidate"; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  printf '%s\n' "${candidates[0]}"
}

check_version() {
  local skill_dir="$1"
  local version

  version="$(sed -n 's/^  version: //p' "$skill_dir/SKILL.md" | head -n 1 | tr -d '"' | xargs)"
  if [[ -z "$version" ]]; then
    echo "missing metadata.version in $skill_dir/SKILL.md" >&2
    exit 1
  fi

  printf '%s\n' "$version"
}

cleanup() {
  rm -rf "$stage_root"
}

trap cleanup EXIT

source_root="$(detect_source_root)"

command -v rsync >/dev/null 2>&1 || {
  echo "rsync is required" >&2
  exit 1
}

mkdir -p "$stage_root/skills"

echo "preflight checks:"
echo "source root: $source_root"
expected_version=""
for skill in "${skills[@]}"; do
  require_path "$source_root/$skill"
  require_path "$source_root/$skill/SKILL.md"
  version="$(check_version "$source_root/$skill")"
  echo "$skill source version: $version"
  if [[ -z "$expected_version" ]]; then
    expected_version="$version"
  elif [[ "$version" != "$expected_version" ]]; then
    echo "version drift detected: expected $expected_version but found $version in $skill" >&2
    exit 1
  fi
done

require_path "$source_root/ma/references/examples.md"
require_path "$source_root/ma-review/assets/report-template.md"
require_path "$source_root/ma-review/references/review-rubric.md"

for skill in "${skills[@]}"; do
  rsync -a --delete "$source_root/$skill/" "$stage_root/skills/$skill/"
done

require_path "$stage_root/skills/ma/references/examples.md"
require_path "$stage_root/skills/ma-review/assets/report-template.md"
require_path "$stage_root/skills/ma-review/references/review-rubric.md"

mkdir -p "$repo_root/skills"
rsync -a --delete "$stage_root/skills/" "$repo_root/skills/"

echo "bundle sync complete"
