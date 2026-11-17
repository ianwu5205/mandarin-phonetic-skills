# Mandarin Phonetic Skills

中文標音排版技能。先選讀者需要的標音方式，再選符合專案的 HTML 實作。

## 標音方式

| 方式 | 版面 | 優點 | 缺點 |
|---|---|---|---|
| 拼音 | 漢語拼音放在漢字上方，例如「裝」標 `zhuāng` | 熟悉拉丁字母的讀者容易入門，聲調可直接標在母音上。 | 讀者仍需學習拼音的字母讀法。長音節容易撐寬字距，等距排版時需要縮小標音。 |
| 注音 | 字卡在漢字右側直排注音及聲調，Ruby 版在上方橫排 | 適合已學注音符號的讀者。右側直排符合台灣教材常見版式。 | 初學者需要先認識注音符號。右側版面會增加字寬，還要分別處理聲調和輕聲點的位置。 |
| 雙標音（雙拼） | 拼音在上、注音在右，同時顯示兩套標音 | 方便對照兩套讀音系統，同一份教材可給使用拼音或注音的讀者。 | 占用較多版面，小字級較難閱讀。製作時要確認兩套標音指向同一個讀音。 |

這裡的「雙拼」指 **拼音＋注音的雙標音排版**。雙拼輸入法是另一種用途。

## 實作方式

| 實作 | 支援版面 | 優點 | 缺點 |
|---|---|---|---|
| HTML + CSS | 上方拼音、右側直排注音、雙標音 | 用 Flexbox／Grid 控制字卡比例、對齊及聲調位置。可直接離線開啟，方便用在教材字卡。 | 每字需要額外的標記與樣式。句子會按字卡換行，標點和空白要跟著字卡版面處理。 |
| HTML Ruby + CSS | 漢字上方單一標音，可選拼音或橫排注音 | 原生 `<ruby>` 和 `<rt>` 表達漢字與讀音的關係，標音可跟隨正文流動與換行。範例可直接離線開啟。 | 此實作只提供上方標音。等距設定會縮小長讀音，範例的 16px 漢字配約 4.5px 標音，聲調較難辨認。 |
| HTML + Tailwind CSS | 上方拼音、右側直排注音、雙標音 | 可在既有 Tailwind 專案中用 utility classes 調整字級、間距和版面，沿用相同的字卡比例。 | 標記中的類別較長，專案需要 Tailwind CSS。此 repo 的預覽透過 Play CDN 載入樣式，需要網路。 |

## Skills 與預覽

| Skill | 版面 | 預覽 |
|-------|------|------|
| [`pinyin`](pinyin/) | 拼音置於中文字上方 | [本機預覽](pinyin/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/pinyin/assets/example.html) |
| [`zhuyin`](zhuyin/) | 直排注音與聲調置於右側 | [本機預覽](zhuyin/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/zhuyin/assets/example.html) |
| [`double-phonetic`](double-phonetic/) | 上方拼音、右側注音 | [本機預覽](double-phonetic/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/double-phonetic/assets/example.html) |
| [`phonetic-html-ruby`](phonetic-html-ruby/) | 原生 Ruby，拼音或橫排注音置於中文字上方 | [本機預覽](phonetic-html-ruby/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/phonetic-html-ruby/assets/example.html) |
| [`pinyin-tailwindcss`](pinyin-tailwindcss/) | 拼音置於中文字上方（Tailwind CSS） | [本機預覽](pinyin-tailwindcss/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/pinyin-tailwindcss/assets/example.html) |
| [`zhuyin-tailwindcss`](zhuyin-tailwindcss/) | 直排注音與聲調置於右側（Tailwind CSS） | [本機預覽](zhuyin-tailwindcss/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/zhuyin-tailwindcss/assets/example.html) |
| [`double-phonetic-tailwindcss`](double-phonetic-tailwindcss/) | 上方拼音、右側注音（Tailwind CSS） | [本機預覽](double-phonetic-tailwindcss/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/double-phonetic-tailwindcss/assets/example.html) |

每個 skill 自成一套，可單獨發佈或安裝。預覽透過 GitHub Pages 提供（`main` 根目錄），也可本機開啟 `*/assets/example.html`。Tailwind CSS 版預覽透過 Play CDN 載入 Tailwind CSS v4，需要網路連線。

## 目錄結構

```
mandarin-skills/
├── common/                 # 共用文件（維護用來源；不單獨安裝）
├── scripts/sync-shared.sh  # 將 common/ 複製到各 skill 的 references/
├── pinyin/
├── zhuyin/
├── double-phonetic/
├── phonetic-html-ruby/
├── pinyin-tailwindcss/
├── zhuyin-tailwindcss/
└── double-phonetic-tailwindcss/
```

每個可發佈的 skill 包含：

- `SKILL.md` — 使用說明與版面規格
- `assets/example.html` — 可直接開啟的範例（字卡版示範 40–180px，Ruby 版示範 16–64px）
- `references/` — 共用規範的副本，確保單獨安裝仍可用

## 維護共用文件

先改 `common/` 內的檔案，再同步：

```bash
./scripts/sync-shared.sh
```

- `common/shared.md` → 所有 skill
- `common/zhuyin-conversion.md` → `zhuyin`、`double-phonetic` 及其 Tailwind CSS 版本，以及 `phonetic-html-ruby`

不要在 skill 內依賴 `../common/`；安裝時只會帶上該 skill 資料夾。
