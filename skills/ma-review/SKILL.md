---
name: ma-review
description: >
  完成したUIや既存画面を総合監査し、`ma-system` `ma-legibility` `ma-mapping`
  `ma-flow` `ma-reduction` の5軸で所見をまとめ、SHIP / SHIP WITH NOTES / REVISE を判定する。
  Use when ユーザーが「このUIをレビューして」「品質チェックして」「出荷前に監査して」
  「high / mid / low で問題を出して」「ハンドオフ前に確認したい」「改善優先度をつけて」
  と頼んだときに使うこと。単一論点だけの依頼には使わず、対応する ma-* サブスキルへ寄せること。
license: MIT
metadata:
  author: yyyyyyy0
  version: 1.1.0
  tags:
    - ui-review
    - audit
    - design-qa
    - ma
---

`ma-review` は `ma` の総合監査役である。
レビューとは、UI と哲学の構造化された対話であり、見た目の感想ではなく原則違反の記録である。

## When to Use

- 完成UIを出荷前に監査したいとき
- 問題を severity 付きで整理したいとき
- handoff 前にレビュー結果を残したいとき
- 単なる感想ではなく、構造化された QA レポートが必要なとき

## Do Not Use

- 可読性だけを点検したいとき。`ma-legibility` を使う
- 作用対象の曖昧さだけを点検したいとき。`ma-mapping` を使う
- レイアウトの流れだけを点検したいとき。`ma-flow` を使う
- 不要要素の削減だけを点検したいとき。`ma-reduction` を使う
- 一貫性や token drift だけを点検したいとき。`ma-system` を使う

## Workflow

1. `ma-system` を実行する
2. `ma-legibility` を実行する
3. `ma-mapping` を実行する
4. `ma-flow` を実行する
5. `ma-reduction` を実行する
6. 問題がない軸も `No violations found.` を明示して残す
7. 新しいカテゴリを勝手に足さず、5軸の結果だけを集約する
8. verdict は件数ではなく最大 severity で決める

### 実行ルール

- サブスキルを飛ばしてはならない
- 「見た目がいい」は所見として無効
- 所見は必ず、どの原則に違反しているかを書く
- Priority actions は、抽象論ではなく実行可能な修正案にする

## Protocol

各サブスキルについて、標準の Output Format で所見を出す。
「問題なし」も所見であるため、省略しない。

実行順:
1. `ma-system`
2. `ma-legibility`
3. `ma-mapping`
4. `ma-flow`
5. `ma-reduction`

## Output Format

`assets/report-template.md` の骨子に従い、次の構造を維持すること。

```markdown
# ma-review — [コンポーネントまたは画面名]

---

## 1. System (ma-system)
[所見テーブル または "No violations found."]

## 2. Legibility (ma-legibility)
[所見テーブル または "No violations found."]

## 3. Mapping (ma-mapping)
[所見テーブル または "No violations found."]

## 4. Flow (ma-flow)
[所見テーブル または "No violations found."]

## 5. Reduction (ma-reduction)
[所見テーブル または "No violations found."]

---

## Summary

Total issues: [N] — high: [N] / mid: [N] / low: [N]

Priority actions:
1. [最も重大な問題 → 推奨される修正]
2. [次]
3. [次]

Verdict: [SHIP / SHIP WITH NOTES / REVISE]
```

## Verdict Rules

- `SHIP`: 問題なし、または `No violations found.` のみ
- `SHIP WITH NOTES`: high はないが、mid または low がある
- `REVISE`: high が1件でもある

件数で薄めてはならない。
high が1件なら、それだけで `REVISE` である。

## Constraints

- すべての所見は、原則違反に紐づいていなければならない
- Severity は感情ではなく、理解または操作への影響で決める
- Summary で新しい論点カテゴリを作らない
- Priority actions は、誰かがそのまま直せる粒度にする

## Worked Examples

**Worked example 1: SHIP WITH NOTES**

状況:
- 主要CTAは明確
- 読み順も自然
- ただし補助テキストのコントラストがやや弱い
- セカンダリカード間の余白がわずかに不揃い

期待:
- `ma-legibility` と `ma-system` に low / mid を出す
- high は出さない
- Verdict は `SHIP WITH NOTES`

**Worked example 2: REVISE**

状況:
- 設定カード内の `削除` ボタンが、カード削除なのかアカウント削除なのか不明
- 破壊的アクションなのに target 表示がない

期待:
- `ma-mapping` に high を出す
- 他軸に low がなくても Verdict は `REVISE`

## Examples

**Positive example 1**

入力: 「このUIをレビューして、high / mid / low で問題を出して」

期待: 5 軸の結果を揃えた構造化レポートを返す。

**Positive example 2**

入力: 「ハンドオフ前にこの設定画面の品質チェックをしたい」

期待: 各軸の所見と verdict を含む監査結果を返す。

**Negative example**

入力: 「文字が読みづらいところだけ見て」

対応: `ma-review` ではなく `ma-legibility` を使う。

5 軸を飛ばさず、原則違反を severity ベースで集約し、判定を一意に返すこと。
