# 讀音、整合與驗收

各音標 skill 共用規範。版面尺寸與 HTML 結構仍以該 skill 的 `SKILL.md` 與 `assets/example.html` 為準。

## 讀音資料

- 字型只提供外觀，不提供漢字讀音。使用者已給讀音時直接排版，不為靜態字卡強加字庫。
- 需要自動轉換時，可用 pinyin-pro 對整句查音。不要逐字獨立查音，會失去多音字上下文。
- 繁體詞語需有繁體字資料支援；使用 pinyin-pro 的 `addTraditionalDict` 搭配 `@pinyin-pro/data/traditional`，並啟用 `traditional: true`。特殊姓名及地名仍可能需人工校正。
- 有建置工具時，把字庫當依賴打包。無建置工具而使用 CDN 時固定版本，等待字庫 script 完成載入後初始化，並處理載入錯誤；不要讓 inline 初始化跑在 defer 字庫之前。
- 依 Unicode 字元處理文字，例如 `Array.from(text)`；保留標點、空格與換行的位置，非漢字不要強加音標。對不支援的讀音保留原文，不憑空填音。
- 動態輸入使用 textContent 或框架文字插值，不把輸入直接組成 innerHTML。

## 句子與整合

- 字卡容器用 flex wrap，建議字間距 6px、行距 10px。換行可用 `flex-basis:100%` 的空節點；標點獨立呈現，不產生音標。保留原文字序。
- 原生 HTML/CSS 是基準，不要求 Vue、Nuxt 或 Tailwind。若使用 Tailwind，把相同尺寸改為 utility classes；動態主字級以 style 綁定。避免用圖片或 canvas 代替文字。
- 整張字卡可用 aria-label 給出字與音標，內部重複呈現的節點用 aria-hidden 隱藏，避免重複朗讀。列印時字卡設 `break-inside: avoid`。

## 驗收

- 以範例字「去、宣、嗎」與字級 64、112、180px 檢查對齊與間距，確認無重疊、無裁切。
- 若包含自動轉換，再檢查繁體「銀行／行走」、標點、空格、換行與空輸入。
- 能使用瀏覽器時檢查畫面；僅通過語法或建置不能宣稱已完成視覺驗證。
