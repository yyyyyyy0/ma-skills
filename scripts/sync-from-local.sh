#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_root="${MA_SKILLS_SOURCE_ROOT:-$HOME/.codex/skills}"

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

command -v rsync >/dev/null 2>&1 || {
  echo "rsync is required" >&2
  exit 1
}

for skill in "${skills[@]}"; do
  require_path "$source_root/$skill"
  require_path "$source_root/$skill/SKILL.md"

  rm -rf "$repo_root/skills/$skill"
  mkdir -p "$repo_root/skills"
  rsync -a --delete "$source_root/$skill/" "$repo_root/skills/$skill/"
done

require_path "$repo_root/skills/ma/references/examples.md"
require_path "$repo_root/skills/ma-review/assets/report-template.md"
require_path "$repo_root/skills/ma-review/references/review-rubric.md"

echo "version summary:"
expected_version=""
for skill in "${skills[@]}"; do
  version="$(check_version "$repo_root/skills/$skill")"
  echo "$skill version: $version"
  if [[ -z "$expected_version" ]]; then
    expected_version="$version"
  elif [[ "$version" != "$expected_version" ]]; then
    echo "version drift detected: expected $expected_version but found $version in $skill" >&2
    exit 1
  fi
done

echo "bundle sync complete"
