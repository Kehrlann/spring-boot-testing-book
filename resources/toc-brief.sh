#!/usr/bin/env bash
# Extracts the chapter/appendix titles from manuscript/ch*.adoc and manuscript/app*.adoc
# and prints them formatted like resources/toc_brief_garniermoiroux_spring_boot_testing.adoc.

set -euo pipefail
cd "$(dirname "$0")/.."

title() {
	awk '/^= / { c++; if (c == 2) { sub(/^= /, ""); print; exit } }' "$1"
}

echo "[horizontal]"
for f in manuscript/ch*.adoc; do
	echo "{counter:list-counter}.:: $(title "$f")"
done

echo
echo "Appendixes"
echo
echo "[horizontal]"
for f in manuscript/app*.adoc; do
	letter=$(basename "$f" | sed -E 's/^app([a-z]).*/\1/' | tr '[:lower:]' '[:upper:]')
	echo "$letter:: $(title "$f")"
done
