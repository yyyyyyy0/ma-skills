# Visual Verification Protocol

ライブブラウザで実際の描画結果を確認し、コードや説明文だけでは検出できない
視覚的問題を発見するための共有手順。

## 前提

- URL または localhost アドレスが提供されていること
- 提供されていない場合は「視覚検証スキップ — ライブ URL なし」と記録し、このプロトコルを飛ばす
- browser-use MCP ツールを使用する

## 手順

### PROC:ENTRY — 基本撮影

最小限の視覚的証拠を確保する。すべてのスキルの基本手順。

1. `browser_navigate` で対象 URL へ遷移する
2. `browser_screenshot` で viewport を撮影する（above-fold の第一印象）
3. `browser_screenshot` を `full_page: true` で実行し、ページ全体を撮影する
4. 観測メモを即座に記録する（後回しにしない）
5. 完了後 `browser_close_session` でセッションを閉じる

### PROC:FOLD — スクロール検証

below-fold に埋もれた CTA や情報の密度を確認する。

1. `browser_navigate` で対象 URL へ遷移する
2. `browser_screenshot` で viewport を撮影する（above-fold の第一印象）
3. `browser_scroll` でページ下部まで移動する
4. `browser_screenshot` でスクロール後の状態を撮影する
5. above-fold と below-fold の情報密度差を記録する
6. 主要 CTA がスクロールなしで到達可能かを記録する
7. `browser_screenshot` を `full_page: true` で実行する
8. 観測メモを記録する
9. `browser_close_session` でセッションを閉じる

### PROC:RESPONSIVE — レスポンシブ検証

ブレイクポイント間のレイアウト崩壊と token 逸脱を確認する。

3つのブレイクポイントで撮影する:

| ブレイクポイント | 幅 | 代表デバイス |
|---|---|---|
| mobile | 375px | iPhone SE / 標準スマートフォン |
| tablet | 768px | iPad mini / 標準タブレット |
| desktop | 1280px | 標準ノート PC |

各ブレイクポイントで:
1. `browser_navigate` で対象 URL へ遷移する
2. `browser_get_state` でページ状態を取得する
3. `browser_screenshot` で viewport を撮影する
4. 前のブレイクポイントとの差分を記録する（レイアウト崩壊、要素の消失、spacing scale の変化）

viewport 幅の変更方法はブラウザ環境に依存する。
DevTools のデバイスエミュレーション、`browser_navigate` の device パラメータ、
またはブラウザウィンドウのリサイズを使うこと。
使用可能な手段がない場合は desktop 幅のみで撮影し、
「レスポンシブ検証は desktop のみ — viewport リサイズ手段なし」と記録する。

最後に `browser_close_session` でセッションを閉じる。

### PROC:STATES — インタラクティブ状態検証

focus、hover、error、disabled など、静的コードからは見えない状態を確認する。

1. `browser_navigate` で対象 URL へ遷移する
2. 監査対象のインタラクティブ要素ごとに:
   a. `browser_click` で要素をアクティブにし、`browser_screenshot` で状態を撮影する
   b. キーボードフォーカスの確認: Tab キーで要素へ移動し、`browser_screenshot` で `:focus-visible` の状態を撮影する。
      ポインタクリックでは `:focus-visible` が発火しないブラウザがあるため、キーボード操作での確認が必要。
   c. 対象要素名と確認した状態（click / focus-visible / hover）を記録する
3. error 状態がある場合はフォームに不正値を入力して `browser_screenshot` する
4. 観測メモを記録する
5. `browser_close_session` でセッションを閉じる

## 観測メモのフォーマット

各撮影後に以下を即座に記録する。撮影を全部終えてからまとめて書くのではなく、
撮影のたびに書くこと。

```
Visual observation [手順名] @ [URL] [ブレイクポイント（該当時）]
- 最初の焦点: [目が最初に行く要素]
- above-fold CTA 可視: yes / no / partially
- コントラスト問題: [具体的要素 または "none observed"]
- レイアウト健全性: intact / broken at [要素]
- スキル固有の注記: [当該スキルの監査ドメインに関連する観測]
```

## 手順の選択ガイド

| スキル | 推奨手順 | 理由 |
|---|---|---|
| ma | PROC:ENTRY | 実装方針の視覚的根拠を確保 |
| ma-review | PROC:ENTRY | 5軸共通の視覚基準を確立 |
| ma-flow | PROC:FOLD | 視線の流れとスクロール下の CTA を確認 |
| ma-legibility | PROC:STATES | focus ring・コントラスト・error 状態を確認 |
| ma-mapping | PROC:ENTRY | 囲みとグループの視覚的帰属を確認 |
| ma-system | PROC:RESPONSIVE | breakpoint 間の token 逸脱を確認 |
| ma-reduction | PROC:FOLD | below-fold の情報密度と初期表示を確認 |
