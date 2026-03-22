# ma Spacing Rules

## Spacing

余白は decoration ではなく structure である。

### 役割

- **Grouping**: 近さで関係を示し、距離で分離を示す
- **Rhythm**: 繰り返される間隔で読み進めるペースをつくる
- **Silence**: 密度を下げ、重要な要素を孤立させて焦点化する

### Rules

- レイアウト前に spacing scale を決めること。恣意的な数値は恣意的な関係を生む
- 4px または 8px grid は目安であり、目的は一貫性である
- 等しい余白は等しい関係を意味する。意味が違う階層に同じ余白を使わない
- ラベルと値のような1ユニット内の余白は、そのユニットと次のグループの間より必ず狭くすること
- intra-group spacing を inter-group spacing より小さく保つこと
- 画面全体で spacing relationship を意味的に一貫させること
- リズムを破るなら、その破れ自体が境界、焦点、セクション転換、状態変化を伝えていなければならない
- 大きな空白は hierarchy、pacing、focus、density reduction のいずれかを説明できなければならない
- negative space は内容がない部分ではなく、内容の読み方を制御する要素として扱うこと
- 値が数学的に等しくても知覚的に等しいとは限らない。補正の原則は `references/optical.md` を参照

### Negative List

- **Uniform spacing throughout**: equal spacing everywhere implies equal relationship. If everything is equidistant, nothing is grouped.
- **Arbitrary spacing values**: ad hoc numbers create accidental hierarchy and unstable structure.
- **Near-identical spacing variants**: tiny differences without semantic distinction create noise, not nuance.
- **Spacing as decoration**: gaps added only to make the layout feel "clean."
- **Empty space without function**: blank areas that do not isolate, pace, separate, or reduce density.
- **Collapsed hierarchy**: identical spacing across different semantic levels.

### Spacing Example

Bad:
- Title, subtitle, body, CTA, and next section all use the same spacing.

Why it fails:
- Equal spacing implies equal relationship.
- The layout loses grouping, rhythm, and focus.

Better:
- Keep title and subtitle close.
- Separate the content block from the CTA more clearly.
- Add larger space before the next section.
- Use isolation only where emphasis is intentional.

### What Good Looks Like

- タイトルとサブタイトルは近く、セクション間は明確に離れている
- CTA は本文の続きであることが分かる距離か、独立した意思決定点であることが分かる距離になっている
- 情報量が多い場面でも、余白の階層で読む順序が保たれている
