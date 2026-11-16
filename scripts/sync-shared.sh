#!/usr/bin/env bash
# Copy common references into each publishable skill so installs stay self-contained.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"

for skill in pinyin zhuyin double-phonetic; do
  mkdir -p "$root/$skill/references"
  cp "$root/common/shared.md" "$root/$skill/references/shared.md"
done

for skill in zhuyin double-phonetic; do
  cp "$root/common/zhuyin-conversion.md" "$root/$skill/references/zhuyin-conversion.md"
done

echo "Synced common/ → */references/"
