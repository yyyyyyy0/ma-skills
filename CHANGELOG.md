# Changelog

All notable changes to this bundle should be documented in this file.

The format is based on Keep a Changelog, and versions are intended to map to Git tags and GitHub Releases.

## [Unreleased]

## [1.2.0] - 2026-03-23

### Added

- Output Tier scaling for `ma` skill: Full / Focused / Minimal tiers based on request scope.
- Evals for Focused Tier (eval 5), Minimal Tier (eval 6), and ambiguous Tier fallback (eval 7).
- `references/optical.md` for `ma`: optical correction rules covering half-leading, icon padding, geometric vs optical center, border-radius proportionality, and large-heading letter-spacing.
- Undeclared scale finding to `ma-system` Negative List: detects missing base/steps/exception declarations with mid/high severity classification.
- Optical correction eval (ma, id 8) and undeclared scale eval (ma-system, id 4).
- CHANGELOG version warning in `scripts/sync-from-local.sh` (non-blocking, reminds to promote before tagging).

### Changed

- Reframed the README to describe `ma-skills` as a general-purpose skill bundle instead of a Codex-specific bundle.
- Generalized installation and maintenance documentation to use tool-agnostic skill directory examples and `MA_SKILLS_SOURCE_ROOT`.
- `ma` Workflow Step 0: explicit instruction to proceed with stated assumptions rather than blocking on ambiguous input.
- `ma` Workflow Step 5: listed optional implementation-plan sub-items scoped to the output context.
- `ma` Output Contract: added optical rationale as an explicit デザイン根拠 sub-item.
- `ma` Tier routing: clarified Minimal Tier vs subskill boundary using design/audit context distinction.

## [1.1.0] - 2026-03-12

### Changed

- Reframed `ma` high-risk visual patterns as explanation-first heuristics instead of blanket prohibitions.
- Added exception-handling examples for brand-driven, data-viz, and interaction-driven visual treatments.
- Extended `ma-review` with an `Other observed risks` appendix for cross-cutting issues that do not belong to a core axis.
- Upgraded `ma`, `ma-review`, and `ma-system` evals to artifact-backed fixtures using bundled files.
- Added a bundle sync helper script and documented version/tag/release expectations in the README.
