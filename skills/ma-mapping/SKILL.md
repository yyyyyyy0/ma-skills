---
name: ma-mapping
description: >
  コントロールがどこに作用するかを監査し、曖昧な delete/apply/save、
  detached validation、target 不明 control、一括操作のスコープ不明を改善する。
  Use when ユーザーが「このDeleteは何を消すの」「Applyがどこに効くか分からない」
  「保存の対象が曖昧」「フォームの対応関係が分かりにくい」「一括操作の範囲が見えない」
  と言ったときに使うこと。可読性だけ、情報量削減だけ、読み順だけの依頼には使わないこと。
license: MIT
metadata:
  author: yyyyyyy0
  version: 1.2.0
  tags:
    - mapping
    - action-scope
    - forms
    - ma
---

`ma` のサブスキル。空間と視覚の構造が、コントロールの真の作用対象を正直に示すかを判定する。

## When to Use

- delete / apply / save の target が曖昧なとき
- ボタンが何に効くか分からないとき
- detached validation でエラー表示が離れているとき
- 一括操作の範囲が分からないとき

## Do Not Use

- 情報量を減らしたいだけのとき。`ma-reduction` を使う
- コントラストや focus の問題だけを見たいとき。`ma-legibility` を使う
- 画面全体の読み順だけを見たいとき。`ma-flow` を使う

## Core Principle

**コントロールの位置・囲み・ラベルは、何に作用するかを正直に伝えなければならない。**
ユーザーが対象を推測しなければならないなら、そのUIは構造について嘘をついている。

## What to Audit

### Proximity
- コントロールは対象の近くにあるか
- 隣の要素に誤作用すると読まれないか
- submit / confirm がそのフォームに属して見えるか

### Grouping
- 視覚的グループがアクションのスコープを正確に表しているか
- カード内アクションがページ全体アクションに見えないか

### Labeling
- 曖昧な action label を使っていないか
- delete / apply / save が action + target になっているか
- 破壊的操作で対象名が省かれていないか

### Multi-target and validation
- 一括操作の範囲が伝わるか
- detached validation が起きていないか
- target 不明 control になっていないか

## Process

1. 各インタラクティブ要素に「これは何に作用するか」と問う
2. 位置と囲みだけで答えられるか確認する
3. 足りなければ、ラベルの具体性を点検する
4. 単一対象、複数対象、一括対象を分けて評価する

## Constraints

- 複数対象があるとき、破壊的アクションは target を明示しなければならない
- コントロールのスコープは、囲みが示す範囲を超えて見えてはならない
- 曖昧なとき、ラベルは action 単独ではなく action + target にする
- detached validation を許してはならない

## Negative List

- **target 不明 control**: 何に効くか分からないボタン
- **曖昧な Apply / Save / Submit**: 対象や範囲が読めない
- **detached validation**: 対象フィールドから離れたエラー表示
- **囲み外の scoped action**: カード外にあるカード専用ボタン
- **一括操作の範囲不明**: 「すべて選択」の “すべて” が不明

## Output Format

```
### ma-mapping findings

| Element | Issue | Severity | Action |
|---|---|---|---|
| [要素] | [どの原則に違反し、なぜか] | high / mid / low | fix / defer / accept |

Summary: [発見された問題のパターンについての1-2文]
```

問題が見つからない場合は `No violations found.` と明示する。

## Examples

**Positive example 1**

入力: 「この Delete がカード削除なのかアカウント削除なのか分からない」

期待: 対象特定とラベル具体性の不足を high で返せる。

**Positive example 2**

入力: 「Apply が現在のフィルタに効くのか全体設定に効くのか曖昧」

期待: 一括操作のスコープ不明を指摘する。

**Negative example**

入力: 「設定項目が多すぎるから整理したい」

対応: `ma-mapping` ではなく `ma-reduction` を使う。

哲学が審判。Negative List は判例集。
