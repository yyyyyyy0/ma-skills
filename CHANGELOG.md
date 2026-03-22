# Changelog

All notable changes to this bundle should be documented in this file.

The format is based on Keep a Changelog, and versions are intended to map to Git tags and GitHub Releases.

## [Unreleased]

### Added

- Output Tier scaling for `ma` skill: Full / Focused / Minimal tiers based on request scope (v1.2.0).
- Evals for Focused Tier (eval 5), Minimal Tier (eval 6), and ambiguous Tier fallback (eval 7).

### Changed

- Reframed the README to describe `ma-skills` as a general-purpose skill bundle instead of a Codex-specific bundle.
- Generalized installation and maintenance documentation to use tool-agnostic skill directory examples and `MA_SKILLS_SOURCE_ROOT`.

## [1.1.0] - 2026-03-12

### Changed

- Reframed `ma` high-risk visual patterns as explanation-first heuristics instead of blanket prohibitions.
- Added exception-handling examples for brand-driven, data-viz, and interaction-driven visual treatments.
- Extended `ma-review` with an `Other observed risks` appendix for cross-cutting issues that do not belong to a core axis.
- Upgraded `ma`, `ma-review`, and `ma-system` evals to artifact-backed fixtures using bundled files.
- Added a bundle sync helper script and documented version/tag/release expectations in the README.
