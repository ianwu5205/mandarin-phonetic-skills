# Mandarin Phonetic Skills

中文音標 HTML 排版技能：拼音在上、注音在右，或兩者並存。

| Skill | 版面 | 預覽 |
|-------|------|------|
| [`pinyin`](pinyin/) | 拼音置於中文字上方 | [本機預覽](pinyin/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/pinyin/assets/example.html) |
| [`zhuyin`](zhuyin/) | 直排注音與聲調置於右側 | [本機預覽](zhuyin/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/zhuyin/assets/example.html) |
| [`double-phonetic`](double-phonetic/) | 上方拼音、右側注音 | [本機預覽](double-phonetic/assets/example.html) · [線上預覽](https://ianwu5205.github.io/mandarin-phonetic-skills/double-phonetic/assets/example.html) |
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
├── pinyin-tailwindcss/
├── zhuyin-tailwindcss/
└── double-phonetic-tailwindcss/
```

每個可發佈的 skill 包含：

- `SKILL.md` — 使用說明與版面規格
- `assets/example.html` — 可直接開啟的範例（字級 40–180px）
- `references/` — 共用規範的副本，確保單獨安裝仍可用

## 維護共用文件

先改 `common/` 內的檔案，再同步：

```bash
./scripts/sync-shared.sh
```

- `common/shared.md` → 六個 skill
- `common/zhuyin-conversion.md` → `zhuyin`、`double-phonetic` 及其 Tailwind CSS 版本

不要在 skill 內依賴 `../common/`；安裝時只會帶上該 skill 資料夾。
