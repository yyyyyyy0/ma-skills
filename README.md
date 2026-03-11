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

Recommended: install from GitHub with `npx skills`.

```bash
npx skills add yyyyyyy0/ma-skills -g -a codex --skill '*'
```

List available skills without installing:

```bash
npx skills add yyyyyyy0/ma-skills --list
```

You can still install a direct GitHub URL if you prefer:

```bash
npx skills add https://github.com/yyyyyyy0/ma-skills -g -a codex --skill '*'
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
