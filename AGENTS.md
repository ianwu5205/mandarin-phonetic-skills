# Agent notes — Mandarin Phonetic Skills

This repo holds independently publishable skills for Mandarin phonetic HTML.

## Skills

| Directory | Use when |
|-----------|----------|
| `pinyin/` | Pinyin above the character only |
| `zhuyin/` | Vertical zhuyin + tone on the right only |
| `double-phonetic/` | Both pinyin above and zhuyin on the right (not 雙拼 IME) |
| `phonetic-html-ruby/` | Pinyin or horizontal zhuyin above the character using native HTML ruby |

Prefer the matching skill.

## Hard constraints

1. **Solo install** — Each skill must work alone. Never make a skill depend on `../common/` or a sibling skill at runtime. Shared text lives in that skill’s `references/` (copies).
2. **Edit shared once** — Change `common/*.md`, then run `./scripts/sync-shared.sh`. Do not hand-edit only one copy of `references/shared.md` or `zhuyin-conversion.md`.
3. **Example is source of truth for CSS** — Keep `SKILL.md` specs aligned with `assets/example.html`. After layout changes, update the example and the skill’s HTML/data snippets together.
4. **Native HTML/CSS baseline** — No required Vue/Nuxt/Tailwind. Framework ports must keep the same em-based proportions.
5. **Selectable text** — Prefer real text nodes; no image/canvas substitutes for characters or phonetics.
6. **Visual check** — When a browser is available, open the example and verify; build/lint alone is not enough.

## Shared vs skill-specific

| Put in `common/` (+ sync) | Keep in each `SKILL.md` / example |
|---------------------------|-----------------------------------|
| Reading/conversion policy, sentence wrap, a11y, acceptance baseline | Grid/flex structure, sizes, colors, sample HTML |
| Pinyin→zhuyin conversion rules | Character data shape for that skill |

## Card layout conventions (do not drift casually)

The native ruby skill uses inline text flow.

- Container: `flex` + `wrap`, `gap: 10px 6px` (row / column).
- Default card size ~`112px`; examples also show `40, 48, 64, 112, 180`.
- Fonts: Noto Sans TC (hanzi/zhuyin), Noto Sans (pinyin); weight 400.
- Practical minimum for double-phonetic readability ≈ 40–48px.
- Longest common pinyin syllable: 6 letters (`zhuāng` / 裝) — keep in pinyin and double-phonetic examples.

## When changing phonetics or samples

- Static cards: use provided readings; do not force a dictionary.
- Auto convert: whole-sentence via pinyin-pro (+ traditional dict when needed); never char-by-char lookups.
- Preserve punctuation/spaces; no phonetics on non-hanzi; no `innerHTML` from raw input.
