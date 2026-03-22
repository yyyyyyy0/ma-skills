# ma Optical Correction Rules

## Principle

数学的等価は知覚的等価を保証しない。
意図した視覚関係を正確に伝えるには、値を知覚に合わせて補正する必要がある。
これは美観の調整ではなく、情報精度の問題である。

## Known Patterns

| 現象 | 原因 | 補正方向 |
|---|---|---|
| コンテナ上部の余白過多 | line-height の half-leading が上にも入る | 上 padding から half-leading 分を減じる |
| アイコン付きボタンの片側偏り | アイコンの視覚的塊が padding を侵食して見える | アイコン側 padding をスケール1段縮小 |
| アイコンのテキスト対比での上ズレ | geometric center と optical center (x-height 中央) の差 | 小さな負の margin-top |
| border-radius の不釣合い | 固定値が内容サイズとの比率を無視 | semantic role（tap target / group boundary / container state）確定後、内容の最大 font-size を比率の参照点にする |
| 大見出しの letter-spacing 過多 | font-size 増大で既定 tracking が間延び | font-size に反比例する negative letter-spacing |

カタログは初期セット。新しいパターンが発見されたら追加する。

## Negative List

- **geometric-only alignment**: 数学的等値だけで知覚的ズレを放置している
- **fixed radius regardless of content**: 丸みが内容サイズと無関係に固定
