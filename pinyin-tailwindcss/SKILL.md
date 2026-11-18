---
name: pinyin-tailwindcss
description: 用 Tailwind CSS 製作或調整華語拼音 HTML，將華語拼音置於文字上方。適用於拼音字卡、識字教材、拼音對照排版與編輯器的文字呈現。
---

# 華語拼音排版（Tailwind CSS）

產生可選取的 HTML 文字，以 Google Noto 字型呈現「上方華語拼音、下方文字」，參照 [assets/example.html](assets/example.html)。預覽以 Tailwind CSS v4 Play CDN 載入，可直接開啟查看 40、48、64、112、180px。整合到已有 Tailwind 的網站時，沿用網站的建置設定，讓掃描器能找到完整的 utility class 名稱。保留範例中的 Noto 字型載入方式，或沿用網站已載入的相同字型。

讀音轉換、句子整合與驗收見 [references/shared.md](references/shared.md)。

## 字卡規格

- 排版只用 Tailwind utility classes，包含任意值 utilities。字級請選用完整類別，例如 `text-[112px]`，不要拼接類別名稱或使用 inline style。手動換行可用 `basis-full`。

- 每個字是一個 inline-flex column，主字級建議預設 112px；內部尺寸用 em 隨字級等比縮放。
- 拼音置中於文字上方；字級 `.255em`、行高 `1.2`，用 Noto Sans，保留 `qù` 等 Unicode 調號。
- 主字級 `1em`、行高 `1.12`，用 Noto Sans TC，字重 400。
- 主字黑色，上方拼音 `text-green-800`。

## HTML 與讀音資料

一張字卡的文字資料包含 `char` 與帶調 `pinyin`。例如：

```js
{ char: '去', pinyin: 'qù' }
{ char: '宣', pinyin: 'xuān' }
{ char: '嗎', pinyin: 'ma' }
{ char: '裝', pinyin: 'zhuāng' }
```

對應 HTML 字卡（完整頁面見 [assets/example.html](assets/example.html)）：

```html
<div class="flex flex-wrap items-start gap-x-[6px] gap-y-[10px] font-['Noto_Sans_TC',sans-serif] text-[112px]">
  <span class="inline-flex flex-col items-center text-black break-inside-avoid" role="img" aria-label="去，qù">
    <span class="font-['Noto_Sans',sans-serif] text-[.255em]/[1.2] whitespace-nowrap text-green-800" aria-hidden="true">qù</span>
    <span class="font-normal leading-[1.12]" aria-hidden="true">去</span>
  </span>
  <span class="inline-flex flex-col items-center text-black break-inside-avoid" role="img" aria-label="宣，xuān">
    <span class="font-['Noto_Sans',sans-serif] text-[.255em]/[1.2] whitespace-nowrap text-green-800" aria-hidden="true">xuān</span>
    <span class="font-normal leading-[1.12]" aria-hidden="true">宣</span>
  </span>
  <span class="inline-flex flex-col items-center text-black break-inside-avoid" role="img" aria-label="嗎，ma">
    <span class="font-['Noto_Sans',sans-serif] text-[.255em]/[1.2] whitespace-nowrap text-green-800" aria-hidden="true">ma</span>
    <span class="font-normal leading-[1.12]" aria-hidden="true">嗎</span>
  </span>
  <span class="inline-flex flex-col items-center text-black break-inside-avoid" role="img" aria-label="裝，zhuāng">
    <span class="font-['Noto_Sans',sans-serif] text-[.255em]/[1.2] whitespace-nowrap text-green-800" aria-hidden="true">zhuāng</span>
    <span class="font-normal leading-[1.12]" aria-hidden="true">裝</span>
  </span>
</div>
```

自動轉換時對整句產生帶調拼音即可。

## 本 skill 驗收重點

檢查「去／宣／嗎」的拼音調號與置中對齊，以及最長六字母「裝／zhuāng」是否溢出或裁切。其餘見 [references/shared.md](references/shared.md)。
