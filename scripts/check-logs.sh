#!/bin/sh
# Fail if LaTeX or BibTeX logs report problems that do not stop the build:
# theme warnings (such as a missing logo or font), undefined references or
# citations, overfull boxes, font substitutions and BibTeX warnings.
#
# Usage: sh scripts/check-logs.sh file.log [file.log ...]
# SPDX-License-Identifier: MIT
set -u

pattern='Package beamerthemeFusionCDT Warning|LaTeX Warning: (Reference|Citation)|There were undefined references|Overfull \\[hv]box|LaTeX Font Warning'
status=0

for log in "$@"; do
  if [ ! -f "$log" ]; then
    echo "check-logs: $log not found (build first)." >&2
    status=1
    continue
  fi
  if grep -nE "$pattern" "$log"; then
    echo "check-logs: problems reported in $log" >&2
    status=1
  fi
  blg="${log%.log}.blg"
  if [ -f "$blg" ] && grep -n 'Warning--' "$blg"; then
    echo "check-logs: BibTeX warnings in $blg" >&2
    status=1
  fi
done

if [ "$status" -eq 0 ]; then
  echo "check-logs: no problems found in $*"
fi
exit "$status"
