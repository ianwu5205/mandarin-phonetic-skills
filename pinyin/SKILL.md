---
name: pinyin
description: 製作或調整華語拼音 HTML，將華語拼音置於文字上方。適用於拼音字卡、識字教材、拼音對照排版與編輯器的文字呈現。
---

# 華語拼音排版

產生可選取的 HTML 文字，以 Google Noto 字型呈現「上方華語拼音、下方文字」，參照 [assets/example.html](assets/example.html)。此範例可直接開啟，含「去、宣、嗎、裝」及不同字級，沒有框架或拼音字庫依賴。新增版面時複用其中字卡結構與 CSS；整合現有網站時保留其框架與主題。

讀音轉換、句子整合與驗收見 [references/shared.md](references/shared.md)。

## 字卡規格

- 每個字是一個 inline-flex column，主字級建議預設 112px；內部尺寸用 em 隨字級等比縮放。
- 拼音置中於文字上方；字級 `.255em`、行高 `1.2`，用 Noto Sans，保留 `qù` 等 Unicode 調號。
- 主字級 `1em`、行高 `1.12`，用 Noto Sans TC，字重 400。
- 主字黑色，上方拼音 `#567b5b`；若網站已有主題，可對應調整顏色，但保留視覺層級。

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
<div class="text">
  <span class="character" role="img" aria-label="去，qù">
    <span class="pinyin" aria-hidden="true">qù</span>
    <span class="hanzi" aria-hidden="true">去</span>
  </span>
  <span class="character" role="img" aria-label="宣，xuān">
    <span class="pinyin" aria-hidden="true">xuān</span>
    <span class="hanzi" aria-hidden="true">宣</span>
  </span>
  <span class="character" role="img" aria-label="嗎，ma">
    <span class="pinyin" aria-hidden="true">ma</span>
    <span class="hanzi" aria-hidden="true">嗎</span>
  </span>
  <span class="character" role="img" aria-label="裝，zhuāng">
    <span class="pinyin" aria-hidden="true">zhuāng</span>
    <span class="hanzi" aria-hidden="true">裝</span>
  </span>
</div>
```

自動轉換時對整句產生帶調拼音即可。

## 本 skill 驗收重點

檢查「去／宣／嗎」的拼音調號與置中對齊，以及最長六字母「裝／zhuāng」是否溢出或裁切。其餘見 [references/shared.md](references/shared.md)。
