# Changelog

All notable changes to this project are recorded here. The project uses
[Semantic Versioning](https://semver.org/). [RELEASING.md](RELEASING.md) explains what
counts as a breaking change for this theme and how releases are made.

This is an unofficial, community-maintained LaTeX Beamer template inspired by the Fusion
CDT visual identity. It is not an official Fusion CDT template and is not endorsed by
Fusion CDT or its partner institutions.

## [Unreleased]

## [1.0.0] - 2026-11-20

First public release.

### Included

- The Beamer theme `FusionCDT` (`theme/beamerthemeFusionCDT.sty`), with title,
  section-divider, content and closing slides based on the colours, typeface and layout
  of the Fusion CDT website.
- Theme options `nosectionpages` and `cream`.
- Commands `\fcdttitleframe`, `\fcdtsectionframe`, `\fcdtclosingframe`, `\fcdtlogo`,
  `\fcdtsetstriptext`, `\fcdtsetpartners` and `\fcdtassetdir`.
- The colour names `fcdtBlue`, `fcdtDarkBlue`, `fcdtPaleBlue`, `fcdtCream`, `fcdtMagenta`,
  `fcdtLime`, `fcdtInk`, `fcdtGrey`, `fcdtLimeDark` and `fcdtMagentaText`, and a pgfplots
  cycle list `fusioncdt` that is applied automatically.
- The Figtree typeface (SIL Open Font License 1.1), bundled in `theme/fonts/`.
- `scripts/fetch-logo.sh`. It downloads the Fusion CDT logo from the Fusion CDT GitHub
  organisation at a fixed commit, checks its SHA-256 checksum and converts it unchanged to
  PDF. The logo itself is not distributed.
- A starter presentation (`starter/`) and a demonstration of all features (`demo/`), both
  under CC0 1.0.
- The commands `make`, `make check` and `make clean`, a GitHub Actions workflow that builds
  and checks every push, and one that drafts a GitHub Release when a version tag is pushed.

### Supported usage

- LuaLaTeX run through `latexmk`, with 16:9 slides (`aspectratio=169`).
- Tested on Ubuntu 24.04 with its TeX Live 2023 packages (LuaHBTeX 1.17.0), latexmk 4.83,
  ChkTeX 1.7.8 and rsvg-convert 2.58.0. The GitHub Actions workflows use the same toolchain.

### Known limitations

- Figtree is used only with LuaLaTeX. pdfLaTeX and XeLaTeX compile the slides in Latin
  Modern Sans and print a warning.
- The logo is not included, because no licence to redistribute it has been found. It needs
  a one-time download with `curl` and `rsvg-convert`, or the manual steps in the README.
- Other aspect ratios, other TeX distributions (MiKTeX, newer TeX Live releases) and
  Overleaf have not been tested.
- No official Fusion CDT brand guidelines were found. The colours are those used on the
  website, and the partner universities are those it listed in November 2026.
