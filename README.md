# ma-skills

`ma-skills` is a bundled repository for the `ma` Codex skill family used to design and review UI through the philosophy of "間".

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
  ma-flow/
  ma-legibility/
  ma-mapping/
  ma-reduction/
  ma-review/
  ma-system/
```

Each skill directory contains its own `SKILL.md`.

## Install

Recommended: install from GitHub with the Codex skill installer helper.

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo yyyyyyy0/ma-skills \
  --path skills/ma skills/ma-flow skills/ma-legibility skills/ma-mapping \
         skills/ma-reduction skills/ma-review skills/ma-system
```

You can also install by URL:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --url https://github.com/yyyyyyy0/ma-skills/tree/main/skills/ma
```

Manual copy still works if you prefer local file management:

```bash
cp -R skills/* ~/.codex/skills/
```

## Source

This repository was assembled from the local skill definitions under:

- `~/.codex/skills/ma`
- `~/.codex/skills/ma-*`

## License

See `LICENSE.txt`.
