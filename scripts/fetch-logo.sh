#!/bin/sh
# Download the Fusion CDT logo used by the theme and convert it to PDF.
#
# The logo is not distributed with this repository (see THIRD_PARTY_NOTICES.md).
# This script downloads the white-lettered SVG published in the Fusion CDT
# GitHub organisation at a fixed commit, checks its SHA-256 checksum, and
# converts it, without changing the artwork, to
# theme/logo/fusion-cdt-logo-white.pdf.
#
# Requirements: curl, rsvg-convert (librsvg), and sha256sum or shasum.
# SPDX-License-Identifier: MIT
set -eu

COMMIT=10d8632c7b40d5f75dc04bc34814a8ba4d85fa39
URL="https://raw.githubusercontent.com/Fusion-CDT/community-reading-list/${COMMIT}/docs/images/fusion-cdt-logo-white.svg"
SHA256=9ae67de173b6e507b1948c84c88aabcb18ce7f4c9607b3d96b79f388e2ddbfdf

root=$(cd "$(dirname "$0")/.." && pwd)
dest="$root/theme/logo/fusion-cdt-logo-white.pdf"

for tool in curl rsvg-convert; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "fetch-logo: '$tool' is required but was not found." >&2
    echo "fetch-logo: see 'Troubleshooting' in README.md." >&2
    exit 1
  fi
done

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

echo "fetch-logo: downloading $URL"
curl -fsSL --retry 3 -o "$tmp/logo.svg" "$URL"

if command -v sha256sum >/dev/null 2>&1; then
  actual=$(sha256sum "$tmp/logo.svg" | cut -d ' ' -f 1)
else
  actual=$(shasum -a 256 "$tmp/logo.svg" | cut -d ' ' -f 1)
fi
if [ "$actual" != "$SHA256" ]; then
  echo "fetch-logo: checksum mismatch (expected $SHA256, got $actual)." >&2
  exit 1
fi

rsvg-convert -f pdf -o "$tmp/logo.pdf" "$tmp/logo.svg"
mv "$tmp/logo.pdf" "$dest"
echo "fetch-logo: wrote theme/logo/fusion-cdt-logo-white.pdf"
