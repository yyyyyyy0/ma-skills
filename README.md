# ma-skills

`ma-skills` is a reusable bundle of `ma` skills for designing and reviewing UI through the philosophy of "間".

The bundle is versioned as a public package, not just a local snapshot. Use the repository changelog, Git tags, and GitHub Releases as the canonical references for what changed and which version to pin.

## Included skills

- `ma`: parent skill for UI design and implementation
- `ma-review`: orchestration skill for full UI review
- `ma-system`: consistency and design system audit
- `ma-legibility`: readability and accessibility audit
- `ma-mapping`: control-to-target clarity audit
- `ma-flow`: visual flow and reading order audit
- `ma-reduction`: complexity and noise reduction audit

## Layout

```text
skills/
  ma/
    references/
  ma-flow/
  ma-legibility/
  ma-mapping/
  ma-reduction/
  ma-review/
    assets/
    references/
  ma-system/
```

Each skill directory contains its own `SKILL.md`, and some skills also ship companion files in `references/` or `assets/`.

`ma` と `ma-review` は軽量な本文から companion files を参照する設計です。`ma-flow` などの単一論点 subskill は比較的 self-contained です。

## Install

The bundle can be installed with any skill manager or copied into a local skill directory.
One example is installing from GitHub with `npx skills`:

```bash
npx skills add yyyyyyy0/ma-skills -g --skill '*'
```

To inspect the bundle without installing:

```bash
npx skills add yyyyyyy0/ma-skills --list
```

You can also install from a direct GitHub URL:

```bash
npx skills add https://github.com/yyyyyyy0/ma-skills -g --skill '*'
```

Manual copy also works if you manage skills as local directories:

```bash
cp -R skills/* /path/to/your/skills/
```

When copying manually, copy the full skill directories. Do not copy only `SKILL.md`, because `ma` and `ma-review` include companion files that are part of the bundle.

## Versioning and Releases

- Skill metadata versions are expected to match the corresponding Git tag for a published bundle.
- Use [CHANGELOG.md](CHANGELOG.md) to see user-facing changes between releases.
- Prefer pinning a Git tag or GitHub Release when you need a stable reference point.
- If you install from the moving default branch, check the changelog before updating local copies.

## Bundle Maintenance

This repository includes a helper script to rebuild the bundle from local source skills while preserving companion files and checking version consistency:

```bash
./scripts/sync-from-local.sh
```

The script reads source skills from `MA_SKILLS_SOURCE_ROOT`. If the variable is not set, it defaults to `~/.local/share/skills`.

```bash
MA_SKILLS_SOURCE_ROOT=/path/to/local/skills ./scripts/sync-from-local.sh
```

The script copies the source skill directories, verifies required companion files, and reports metadata version drift across bundled skills. Recommended maintainer flow:

1. Sync the bundle from local source skills.
2. Review the diff and update `CHANGELOG.md`.
3. Tag the release with the same version that appears in skill metadata.
4. Publish a GitHub Release using that tag.

## Source

This repository can be reproduced from local skill definitions stored under `MA_SKILLS_SOURCE_ROOT`, such as:

- `/path/to/local/skills/ma`
- `/path/to/local/skills/ma-*`

The `scripts/sync-from-local.sh` helper keeps the bundle reproducible as those local source skills evolve.

## License

See `LICENSE.txt`.
