# Changelog

All notable changes to this bundle should be documented in this file.

The format is based on Keep a Changelog, and versions are intended to map to Git tags and GitHub Releases.

## [Unreleased]

## [1.3.0] - 2026-03-29

### Added

- Visual Verification Protocol (`references/visual.md`): browser-use MCP によるライブブラウザ視覚検証の共有手順（PROC:ENTRY / PROC:FOLD / PROC:RESPONSIVE / PROC:STATES）。
- `ma-review` Workflow Step 0: 5軸監査の前に PROC:ENTRY で視覚基準を確立する。
- `ma-review` レポートテンプレートに Visual Reference セクションを追加。
- `ma-flow` Process Step 3: PROC:FOLD による視覚的読み経路の確認。
- `ma-legibility` Process Step 3: PROC:STATES による focus / contrast / error 状態の視覚検証。
- `ma` Workflow Step 5: PROC:ENTRY による実装方針の視覚的根拠確保。
- `ma-mapping` Process Step 2: PROC:ENTRY による囲みとグループの視覚的帰属確認。
- `ma-system` Process Step 2: PROC:RESPONSIVE による breakpoint 間の token 逸脱確認。
- `ma-reduction` Process Step 1: PROC:FOLD による below-fold 情報密度の確認。

### Changed

- `ma-review` 実行ルール: 「コードから推測される問題」と「画面で確認された問題」の区別を必須化。

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
