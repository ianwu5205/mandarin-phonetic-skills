---
name: zhuyin-tailwindcss
description: 用 Tailwind CSS 製作或調整中文注音 HTML，將直排注音與聲調置於中文字右側。適用於注音字卡、識字教材、注音對照排版與編輯器的文字呈現。
---

# 中文注音排版（Tailwind CSS）

產生可選取的 HTML 文字，以 Google Noto 字型呈現「中文字＋右側直排注音」，參照 [assets/example.html](assets/example.html)。預覽以 Tailwind CSS v4 Play CDN 載入，可直接開啟查看 40、48、64、112、180px。整合到已有 Tailwind 的網站時，沿用網站的建置設定，讓掃描器能找到完整的 utility class 名稱。保留範例中的 Noto 字型載入方式，或沿用網站已載入的相同字型。

讀音轉換、句子整合與驗收見 [references/shared.md](references/shared.md)；拼音轉注音見 [references/zhuyin-conversion.md](references/zhuyin-conversion.md)。

## 字卡規格

- 排版只用 Tailwind utility classes，包含任意值 utilities。字級請選用完整類別，例如 `text-[112px]`，不要拼接類別名稱或使用 inline style。手動換行可用 `basis-full`。

- 每個字是一個 inline-grid，兩欄為 `1em .46em`，一列為 `1.12em`。字卡 font-size 為主字級，建議預設 112px；內部尺寸用 em 隨字級等比縮放。
- 中文字位於第一欄，字級 `1em`、行高 `1.12`，用 Noto Sans TC，字重 400。
- 注音位於第二欄，垂直置中；字級 `.23em`、左內距 `.08em`，用 Noto Sans TC。每個注音符號獨立一行，flex column，行高 `1.2`。用符號文字「ㄧ」，不要旋轉整個字串。
- 注音區另設兩欄 `1em .65em`、欄距 `.12em`，第二欄放聲調。聲調字級是注音的 `.8em`，行高 1，垂直置中。保留聲調空間，避免碰到注音或下一字；不要用負 right 偏移把聲調壓進注音。
- 一聲不顯示符號；二、三、四聲為 `ˊ ˇ ˋ`。輕聲 `˙` 放在注音柱上方，使用 `absolute -top-[.85em] left-[.1em] w-[1.25em]`。
- 主字黑色，右側注音 `text-stone-600`。

## HTML 與讀音資料

一張字卡的文字資料包含 `char`、不含聲調的注音 `symbols`、獨立的 `tone` 與 `neutral`。例如：

```js
{ char: '去', symbols: 'ㄑㄩ', tone: 'ˋ', neutral: false }
{ char: '宣', symbols: 'ㄒㄩㄢ', tone: '', neutral: false }
{ char: '嗎', symbols: 'ㄇㄚ', tone: '˙', neutral: true }
```

對應 HTML 字卡（完整頁面見 [assets/example.html](assets/example.html)）：

```html
<div class="flex flex-wrap items-start gap-x-[6px] gap-y-[10px] font-['Noto_Sans_TC',sans-serif] text-[112px]">
  <span class="inline-grid grid-cols-[1em_.46em] grid-rows-[1.12em] text-black break-inside-avoid" role="img" aria-label="去，ㄑㄩˋ">
    <span class="font-normal leading-[1.12] col-start-1 row-start-1" aria-hidden="true">去</span>
    <span class="relative col-start-2 row-start-1 grid grid-cols-[1em_.65em] items-center self-center gap-x-[.12em] pl-[.08em] text-[.23em] text-stone-600" aria-hidden="true">
      <span class="flex flex-col leading-[1.2]"><span>ㄑ</span><span>ㄩ</span></span>
      <span class="text-center text-[.8em]/none">ˋ</span>
    </span>
  </span>
  <span class="inline-grid grid-cols-[1em_.46em] grid-rows-[1.12em] text-black break-inside-avoid" role="img" aria-label="宣，ㄒㄩㄢ">
    <span class="font-normal leading-[1.12] col-start-1 row-start-1" aria-hidden="true">宣</span>
    <span class="relative col-start-2 row-start-1 grid grid-cols-[1em_.65em] items-center self-center gap-x-[.12em] pl-[.08em] text-[.23em] text-stone-600" aria-hidden="true">
      <span class="flex flex-col leading-[1.2]"><span>ㄒ</span><span>ㄩ</span><span>ㄢ</span></span>
      <span class="text-center text-[.8em]/none"></span>
    </span>
  </span>
  <span class="inline-grid grid-cols-[1em_.46em] grid-rows-[1.12em] text-black break-inside-avoid" role="img" aria-label="嗎，˙ㄇㄚ">
    <span class="font-normal leading-[1.12] col-start-1 row-start-1" aria-hidden="true">嗎</span>
    <span class="relative col-start-2 row-start-1 grid grid-cols-[1em_.65em] items-center self-center gap-x-[.12em] pl-[.08em] text-[.23em] text-stone-600" aria-hidden="true">
      <span class="flex flex-col leading-[1.2]"><span>ㄇ</span><span>ㄚ</span></span>
      <span class="text-center text-[.8em]/none absolute -top-[.85em] left-[.1em] w-[1.25em]">˙</span>
    </span>
  </span>
</div>
```

## 本 skill 驗收重點

檢查「去」的 ㄑㄩ 與右側四聲、「宣」的三符號與無一聲標記、「嗎」的上方輕聲。其餘見 [references/shared.md](references/shared.md)。
