---
name: ma-system
description: >
  UI 全体のデザインシステム一貫性を監査し、token drift、spacing scale 崩れ、
  state inconsistency、semantic mismatch、理由のないローカルオーバーライドを見つけて
  既存の正規値へ統合する。Use when ユーザーが「同じボタンなのに見た目が違う」「余白が揃っていない」
  「状態表現がバラバラ」「デザインシステムが崩れている」「トークンを整理したい」
  と言ったときに使うこと。文言品質だけ、作用対象だけ、情報量削減だけの依頼には使わないこと。
license: MIT
metadata:
  author: yyyyyyy0
  version: 1.2.0
  tags:
    - design-system
    - consistency
    - tokens
    - ma
---

`ma` のサブスキル。一貫性は情報の一形態であり、不一致はノイズである。

## When to Use

- token drift が起きているとき
- spacing scale 崩れが見えるとき
- state inconsistency があるとき
- semantic mismatch が起きているとき
- デザインシステムの暗黙ルールを抽出したいとき

## Do Not Use

- 文言の具体性やコントラストだけを見たいとき。`ma-legibility` を使う
- ボタンが何に作用するかだけを見たいとき。`ma-mapping` を使う
- 画面がごちゃついているから減らしたいだけのとき。`ma-reduction` を使う

## Core Principle

**一貫性は情報の一形態だ。**
似たものが違って見えるとき、ユーザーは存在しない違いを探すことになる。
その認知コストは排除しなければならない。

## What to Audit

### Tokens
- spacing scale 崩れがあるか
- 色や radius や typography が正規値から外れていないか
- z-index やサイズがマジックナンバー化していないか
- scale declaration があるか（base unit、token ladder、例外扱いの基準）

### State handling
- hover / focus / active / disabled の state inconsistency がないか
- 同じ役割のコンポーネントで振る舞いが違っていないか

### Semantic alignment
- semantic mismatch がないか
- 同じ意味の UI 要素が別の見た目や別タグになっていないか
- 同じ spacing が同じ relationship を意味しているか
- 意味の違うグループに同じ spacing を使って、関係を誤読させていないか
- 理由のないローカルオーバーライドがないか

## Process

1. 既存 UI から暗黙の正規値を抽出する
2. 逸脱点を見つける
3. 新しい値を増やさず、既存正規値へ統合する
4. 状態表現と semantic role の対応を確認する

## Constraints

- 不一致を直すために新しい値を導入してはならない
- 一貫性はローカルな好みより優先する
- 同じ意味的役割に複数の視覚ルールを持たせない
- equal spacing implies equal relationship を崩すなら、理由を説明できなければならない
- なぜその値が正規値なのかを説明できなければならない

## Negative List

- **token drift**: 同じ役割に別スケールの余白や色が混ざる
- **spacing scale 崩れ**: 4px 系と 6px 系が理由なく混在する
- **spacing semantics mismatch**: scale は揃っていても、意味の違う要素に同じ spacing を使って同格に見せてしまう
- **state inconsistency**: hover / focus / disabled が部品ごとに違う
- **semantic mismatch**: 見た目は同じなのに意味や role が違う
- **理由のないローカルオーバーライド**: システム違反に説明がない
- **undeclared scale**: spacing / typography / radius に使われている値の
  導出元（base, steps, 例外ルール）が宣言されていない。
  正規値が不明な状態では drift の検出も統合もできない

## Output Format

```
### ma-system findings

| Element | Issue | Severity | Action |
|---|---|---|---|
| [要素] | [どの原則に違反し、なぜか] | high / mid / low | fix / defer / accept |

Summary: [発見された問題のパターンについての1-2文]
```

問題が見つからない場合は `No violations found.` と明示する。

## Examples

**Positive example 1**

入力: 「同じ役割のボタンなのに余白・色・角丸・hover が微妙に違う」

期待: token drift と state inconsistency を指摘する。

**Positive example 2**

入力: 「デザインシステムがないUIから暗黙ルールを抽出して揃えたい」

期待: 正規値候補を抽出し、逸脱統合案を返す。

**Negative example**

入力: 「このエラーメッセージの文言が曖昧」

対応: `ma-system` ではなく `ma-legibility` を使う。

哲学が審判。Negative List は判例集。
