#!/bin/sh
# Check that the version declarations agree.
#
# The single source of truth is the \ProvidesPackage line of
# theme/beamerthemeFusionCDT.sty:
#   \ProvidesPackage{beamerthemeFusionCDT}[YYYY/MM/DD vX.Y.Z Unofficial ...]
# CHANGELOG.md must contain a matching heading "## [X.Y.Z] - YYYY-MM-DD".
# If a tag is given, it must be "v" followed by the same version.
#
# Usage: sh scripts/check-version.sh [tag]
# On success, prints version=..., date=... and prerelease=true|false, one per
# line, in the format GitHub Actions step outputs expect.
# SPDX-License-Identifier: MIT
set -eu

sty=theme/beamerthemeFusionCDT.sty
changelog=CHANGELOG.md

fail() {
  echo "check-version: $*" >&2
  exit 1
}

line=$(grep -F '\ProvidesPackage{beamerthemeFusionCDT}' "$sty") ||
  fail "no \\ProvidesPackage line found in $sty"

# [YYYY/MM/DD vVERSION description]
date=$(printf '%s\n' "$line" | sed -n 's|.*\[\([0-9]\{4\}\)/\([0-9]\{2\}\)/\([0-9]\{2\}\) v[^ ]* .*|\1-\2-\3|p')
version=$(printf '%s\n' "$line" | sed -n 's|.*\[[0-9/]* v\([^ ]*\) .*|\1|p')
[ -n "$date" ] && [ -n "$version" ] ||
  fail "cannot read date and version from: $line"

# Semantic version: MAJOR.MINOR.PATCH, optionally -PRERELEASE (e.g. -rc.1).
printf '%s\n' "$version" | grep -Eq '^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-[0-9A-Za-z.-]+)?$' ||
  fail "'$version' in $sty is not a semantic version such as 1.2.3 or 1.2.3-rc.1"

grep -qxF "## [$version] - $date" "$changelog" ||
  fail "$changelog has no heading '## [$version] - $date' matching $sty"

if [ "$#" -ge 1 ] && [ "$1" != "v$version" ]; then
  fail "tag '$1' does not match version v$version declared in $sty"
fi

case "$version" in
  *-*) prerelease=true ;;
  *) prerelease=false ;;
esac

echo "check-version: $sty, $changelog${1:+ and tag $1} agree on $version ($date)" >&2
echo "version=$version"
echo "date=$date"
echo "prerelease=$prerelease"
