# ma Contrast Rules

## Contrast

コントラストは polish ではなく structure である。

### 役割

- **Legibility**: すべての状態で文字が背景に対して読めること
- **Hierarchy**: どこから読ませるか、何が主で何が従かを示すこと

### Rules

- 色を決める前に、意味ごとのコントラスト帯を決めること
- 典型的な帯域の目安:
  - Primary text: 12:1+（見出し、主要数値、主要 CTA ラベル）
  - Body text: 7:1-10:1（本文、説明文）
  - Secondary text: 4.5:1-6:1（ラベル、補足、メタデータ）
  - Disabled / decorative: large text で 3:1 を下回らない。読ませる文字には使わない
- 同じ意味レベルの要素は同じコントラスト帯に置くこと
- 実際の背景に対して測ること。gradient、translucent layer、blur は見かけの背景色を変える
- opacity で文字色を作らないこと。`rgba()` の薄め方は知覚上の明度を安定して制御できない
- 状態変化をコントラスト差だけに頼らないこと。構造、ラベル、タイポグラフィの変化も併用すること

### What Good Looks Like

- 見出しが最初に読まれ、本文が次に続き、補足情報は後景に下がる
- WCAG を満たしていても、すべてが同じ見え方なら失敗とみなす
