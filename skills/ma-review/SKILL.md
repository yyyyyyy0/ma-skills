---
name: ma-review
description: >
  既存UIの総合監査を行い、統一されたレポートを生成する。すべてのmaサブスキルを
  順に実行して高さ・中・低の重大度で問題をランク付けし、SHIP/REVISE の判定を出す。
  "このUI確認して" "レビューして" "問題ないか見て" "品質チェックして"
  "ハンドオフ前に確認したい" "何か改善点ある？" と言われたらこのスキルを使うこと。
  単一の問題（読みにくい・ボタンが分かりにくい等）には対応するサブスキルを直接使う。
license: Complete terms in LICENSE.txt
---

`ma` のサブスキル。`ma` の哲学を継承: 情報の明瞭性と目的ある装飾。

## Core Principle

**レビューとはUIと哲学の構造化された対話だ。**
各サブスキルはひとつの問いを立てる。このスキルはそのすべてを一緒に問う。
出力は、インターフェースが何を伝え——何を伝えられていないかの追跡可能な記録だ。

---

## Protocol

各サブスキルを順番に実行する。各スキルについて、標準のOutput Formatで所見を出す。
「おそらく問題ない」という理由でサブスキルをスキップしてはならない——所見がないこと自体が所見だ。

実行順:
1. `ma-system` — デザインシステムは一貫しているか？
2. `ma-legibility` — テキストは読みやすく、具体的で、アクセシブルか？
3. `ma-mapping` — コントロールはそのターゲットに明確に対応しているか？
4. `ma-flow` — 視線のパスは論理的な順序と一致しているか？
5. `ma-reduction` — 意味を失わずに除去できるものは何か？

---

## Output Format

```
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

**Verdict 基準:**
- **SHIP**: high重大度の問題なし、mid/low も軽微
- **SHIP WITH NOTES**: high重大度の問題なし；mid/lowは次イテレーションのために文書化
- **REVISE**: 1つ以上のhigh重大度の問題があり、shipの前に解決が必要

**REVISE が出たとき**: Priority actionsの修正を適用してから、更新されたコンポーネントに対して再度 ma-review を実行することを提案する。

---

## Constraints

- すべての所見は、何が見た目として悪いかではなく、どの原則が違反されたかを引用しなければならない。
- 判定は数ではなく重大度によって決まる。
  1つのhigh重大度の問題 = 何個のlow問題があっても REVISE。
- "見た目は良い" は有効な所見ではない。サブスキルが何も見つけなければ、明示的にそう述べる。
- Priority actionsは具体的かつ実行可能でなければならない。一般的なアドバイスは不可。

---

哲学が審判。Negative Listは判例集。
このエージェントは卓越したクリエイティブワークができる。この哲学を完全な信念をもって適用せよ。
