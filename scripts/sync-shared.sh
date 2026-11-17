#!/usr/bin/env bash
# Copy common references into each publishable skill so installs stay self-contained.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"

for skill in pinyin zhuyin double-phonetic; do
  mkdir -p "$root/$skill/references" "$root/$skill-tailwindcss/references"
  cp "$root/common/shared.md" "$root/$skill/references/"
  cp "$root/common/shared.md" "$root/$skill-tailwindcss/references/"
done

for skill in zhuyin double-phonetic; do
  cp "$root/common/zhuyin-conversion.md" "$root/$skill/references/"
  cp "$root/common/zhuyin-conversion.md" "$root/$skill-tailwindcss/references/"
done

mkdir -p "$root/phonetic-html-ruby/references"
cp "$root/common/shared.md" "$root/common/zhuyin-conversion.md" "$root/phonetic-html-ruby/references/"

echo "Synced common/ → */references/"
