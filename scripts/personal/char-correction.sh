#!/bin/bash

# After each update execute the following
# sudo cp char-correction.sh /usr/local/bin
# sudo chmod +x /usr/local/bin/char-correction.sh

FILE="$1"
cp "$FILE" "$FILE.bak"
TMP=$(mktemp)

declare -a REPLACEMENTS=(
  's/→/->/g'
  's/–/-/g'
  's/—/ - /g'
  's/↔/\$\\leftrightarrow\$/g'
  's/↑/\$\\uparrow\$/g'
  's/↓/\$\\downarrow\$/g'
  's/≠/\$\\neq\$/g'
)

cp "$FILE" "$TMP"

for rule in "${REPLACEMENTS[@]}"; do
  sed -i "$rule" "$TMP"
done

mv "$TMP" "$FILE"
