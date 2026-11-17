---
name: phonetic-html-ruby
description: 用原生 HTML ruby 與 CSS 將漢語拼音或橫排注音放在漢字上方。適用於正文、教材或要求使用 ruby 的單一標音版面。
---

# 漢字上方標音

每個漢字使用一組 `<ruby>` 和 `<rt>`，依需求選用拼音或注音。用標準 HTML 與 CSS。以 [可直接開啟的範例](assets/example.html) 為版面基準。

```html
<ruby><span class="hanzi">裝</span><rp>（</rp><rt lang="zh-Latn-pinyin">zhuāng</rt><rp>）</rp></ruby>
<ruby><span class="hanzi">裝</span><rp>（</rp><rt lang="zh-Bopo">ㄓㄨㄤ</rt><rp>）</rp></ruby>
```

- 在橫排正文設定 `ruby-position: over` 和 `ruby-align: center`。範例用 `.hanzi`（`display: inline-block; inline-size: 1em; text-align: center`）統一漢字基底寬度，標音設為 `.28em`、字重 400，使「zhuāng」等較長的讀音也能放進字寬。漢字基底用 `line-height: 1.15`，標音用 `line-height: 1`，讓標音貼近漢字。正文維持 `line-height: 2.2`，為多行留出空間。
- 注音在上方橫排。二、三、四聲接在音節後，如「ㄑㄩˋ」，輕聲點放在音節前，如「˙ㄇㄚ」，一聲省略調號。正文用 `lang="zh-Hant"`（繁體）。
- 遵循 [共用讀音規範](references/shared.md)。用原生行內 ruby 隨正文換行，保留原有標點與空白。
- 需要從拼音產生注音時，參考 [注音換算表](references/zhuyin-conversion.md)，再將符號和聲調合成一個橫排 `rt`。
- 範例以 16、24、32、48、64px 示範漢字大小，每種字級各有一行拼音與一行注音。16px 的標音約 4.5px，可用來檢查極小字級的排版。驗收時在瀏覽器檢查長拼音與多行間距，確認兩種讀音都在漢字上方、沒有重疊，且相鄰漢字維持等距。若更換字型，檢查最長標音是否超出字寬。
