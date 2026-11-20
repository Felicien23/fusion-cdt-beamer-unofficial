# Branding sources

This theme is an unofficial, community-maintained template inspired by the Fusion CDT
visual identity. It is not an official Fusion CDT template and is not endorsed by Fusion
CDT or its partner institutions. This page records where its colours, typeface and layout
come from, so that changes can be checked against evidence.

No official Fusion CDT brand guidelines or presentation template were found. Nothing
below is an officially prescribed presentation palette.

## Website colours

These values are recorded as "taken from fusion-cdt.ac.uk" in the Fusion CDT GitHub
organisation:

- `Fusion-CDT/fusion-cdt.github.io`, `index.html`, commit `ea00e659d00079e75841270aa2a0ed452dc02b97`
- `Fusion-CDT/community-reading-list`, `docs/stylesheets/theme.css`, added in commit
  `10d8632c7b40d5f75dc04bc34814a8ba4d85fa39`

| Theme name | Hex | Role on the website | Use in the theme |
|---|---|---|---|
| `fcdtBlue` | `#277CB3` | Header bar with the logo, footer | Blue slides, footer, block titles, bullets |
| `fcdtDarkBlue` | `#1D6394` | Body text, links, top strip | Frame titles, structure, top strip, example-block titles |
| `fcdtPaleBlue` | `#D3DBE6` | Text on the dark-blue top strip | Top-strip text, plot grid, block-body tint |
| `fcdtCream` | `#EEEEE6` | Page background | Example-block body, `cream` option |
| `fcdtMagenta` | `#DC2099` | Round arrow, hover and focus accent | Title rule, stripe, plot series, alert tint |
| `fcdtLime` | `#C5D300` | Lime accent | Title rule and stripe only, never text |

## Logo colours

The logo's lettering is white `#FFFFFF`. Its sunburst square is `#CCCC00` in the vector
SVG (`rgb(80%, 80%, 0%)`) and `#C5D301` in an earlier raster PNG of the same artwork in
the same repository. That raster value matches the website lime `#C5D300`. The theme
uses the vector logo unaltered.

## Colours introduced for legibility

These are neutrals, or shades derived from the colours above. They are not branding.

| Theme name | Value | Why |
|---|---|---|
| `fcdtInk` | `#1B2631` | Body text, 15:1 contrast on white |
| `fcdtMagentaText` | 88 % `fcdtMagenta` + black | Alert text and alert-block titles. Pure magenta reaches 4.46:1 on white, just under the WCAG AA level of 4.5:1. |
| `fcdtLimeDark` | 55 % `fcdtLime` + black | Plot lines. Pure lime reaches only 1.65:1 on white. |
| `fcdtGrey` | `#5F6B76` | Frame subtitles, fifth plot series |
| `fcdtBlueTint`, `fcdtMagentaTint` | Tints of pale blue and magenta | Block bodies |

Measured contrast: white on `fcdtBlue` is 4.55:1, and `fcdtDarkBlue` on white is 6.43:1.
Pale blue appears only on dark blue, where it reaches 4.61:1.

## Typeface

The same repositories record Figtree as the typeface of fusion-cdt.ac.uk, with weight 500
for body text and 700 for headings. The theme bundles Figtree Medium (500) and Bold
(700), with their italics, from the official Figtree repository
(see [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md)).

## Layout

| Element | Basis |
|---|---|
| Blue slides with the white-lettered logo | The website's blue header bar with the logo |
| Dark-blue top strip with pale-blue centred text | The website's top strip |
| Magenta and lime stripe (62 % and 38 % of the width) | The Fusion CDT community reading list's social preview card (`design/social-card/social-card.svg` in `Fusion-CDT/community-reading-list`) |
| Dark-blue frame titles, blue footer | The website's dark-blue text and blue footer |

## Partner universities

Durham, Liverpool, Manchester, Oxford, Sheffield and York, as listed on the
fusion-cdt.ac.uk homepage in November 2026. Change them with `\fcdtsetpartners{...}`.
