#!/bin/bash
set -e
set -o pipefail

(
# find all executables and run `shellcheck`
#for f in $(find . -type f -not -path '*.git*' | sort -u); do
#	shellcheck $f && echo -e "---\nSucessfully linted $f\n---"
#done
#) || true
find . -type f -not -path '*.git*' -exec shellcheck "{}" \; -exec echo "[OK]: sucessfully linted $f" \;
