#!/bin/sh
# Print the GitHub Release notes for a version: a fixed introduction (unofficial
# status, downloads, licences) followed by that version's section of CHANGELOG.md.
#
# Usage: sh scripts/release-notes.sh 1.0.0 > notes.md
# The release workflow uses this script; run it locally to preview the notes.
# SPDX-License-Identifier: MIT
set -eu

if [ "$#" -ne 1 ]; then
  echo "usage: sh scripts/release-notes.sh VERSION" >&2
  exit 2
fi
version=$1

# The CHANGELOG section for this version, without its heading, up to the next one.
section=$(awk -v heading="## [$version] - " '
  index($0, heading) == 1 { found = 1; next }
  found && /^## \[/ { exit }
  found { print }
' CHANGELOG.md)

if [ -z "$(printf '%s' "$section" | tr -d '[:space:]')" ]; then
  echo "release-notes: no CHANGELOG.md section for $version" >&2
  exit 1
fi

cat <<EOF
> **Unofficial, community-maintained LaTeX Beamer template inspired by the Fusion CDT
> visual identity. This is not an official Fusion CDT template and is not endorsed by
> Fusion CDT or its partner institutions.**

A LuaLaTeX Beamer theme with title, section, content and closing slides that match the
look of the Fusion CDT website. It includes a starter presentation to copy and a
demonstration of every feature.

## Which download?

- **Source code (zip)**: start here. It contains the theme, the starter presentation,
  the demonstration and the documentation. Unzip it, open a terminal in the unzipped
  folder and run \`make\`, then copy \`starter/\` for your own talk (README, *Quick start*).
- **fusion-cdt-beamer-unofficial-v$version-demo.pdf**: the compiled demonstration, to
  preview the slides without installing anything.
- *Source code (tar.gz)*: the same files as the zip, as a tarball.

## Licences and branding

The theme code, scripts and documentation are under the MIT licence. The starter and
demonstration are under CC0 1.0, and the bundled Figtree typeface is under the SIL Open
Font License 1.1. The Fusion CDT logo, name and visual identity are not covered by these
licences. The logo is not included in the source download: \`make\` fetches it from the
Fusion CDT GitHub organisation on first use. The demonstration PDF shows the logo as it
appears on the slides. See THIRD_PARTY_NOTICES.md.

## Version $version
$section
EOF
