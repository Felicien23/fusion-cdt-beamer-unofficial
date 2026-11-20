# Third-party notices

This project's own licences are the MIT licence for the theme code, scripts and
documentation ([LICENSE](LICENSE)) and CC0 1.0 for the starter and demonstration
presentations. **Neither licence covers the items below**, which belong to others. Nothing
in this repository grants any right to use the Fusion CDT name, logo or visual identity.

This is an unofficial, community-maintained template. It is not an official Fusion CDT
template and is not endorsed by Fusion CDT or its partner institutions.

## Figtree typeface: included

| | |
|---|---|
| Files | `theme/fonts/Figtree-Medium.otf`, `Figtree-MediumItalic.otf`, `Figtree-Bold.otf`, `Figtree-BoldItalic.otf` |
| Source | <https://github.com/erikdkennedy/figtree>, folder `fonts/otf/`, commit `032dfa7fe219ef3a02890d6d3add84eacc9aebfe`. The files are unmodified. |
| Copyright | Copyright 2022 The Figtree Project Authors |
| Licence | SIL Open Font License 1.1; the full text is in `theme/fonts/OFL.txt`. No Reserved Font Name is declared. |
| Conditions | The fonts may be bundled and redistributed with this project as long as the licence text accompanies them. They may not be sold on their own. |

## Fusion CDT logo: not included

| | |
|---|---|
| Asset | Fusion CDT logo, version with white lettering (a lime sunburst square and the words "FUSION CDT") |
| Provenance | Published as `docs/images/fusion-cdt-logo-white.svg` in the Fusion CDT GitHub organisation's repository `Fusion-CDT/community-reading-list`, commit `10d8632c7b40d5f75dc04bc34814a8ba4d85fa39`: <https://raw.githubusercontent.com/Fusion-CDT/community-reading-list/10d8632c7b40d5f75dc04bc34814a8ba4d85fa39/docs/images/fusion-cdt-logo-white.svg>. SHA-256: `9ae67de173b6e507b1948c84c88aabcb18ce7f4c9607b3d96b79f388e2ddbfdf`. The same artwork is used in the header of fusion-cdt.ac.uk. |
| Copyright holder | Not established. The logo identifies the EPSRC Centre for Doctoral Training in Fusion Power. |
| Licence | None found. The source repository publishes no licence, and no permission to redistribute the logo has been found. |
| How this project handles it | The logo is **not stored in this repository** and is excluded by `.gitignore`. `scripts/fetch-logo.sh` downloads it from the source above when a user builds, checks the checksum and converts it to PDF without altering the artwork. |

**Open questions** for the maintainers to resolve with Fusion CDT:

1. Whether the logo may be redistributed in this repository or its releases. Until there
   is permission, it stays out.
2. Whether Fusion CDT is content for its logo and visual identity to be used in an
   unofficial template, even with the disclaimer. The disclaimer does not settle any rights
   question.
3. The preview images in `docs/images/`, and compiled demonstration PDFs (the CI build
   artifacts and the PDF attached to each GitHub Release), show the logo as it appears on
   the slides. If the rights holder objects, remove those images and stop publishing
   compiled PDFs.

## Fusion CDT name, colours and layout

The theme uses colour values observed on the Fusion CDT website, the name "EPSRC Centre
for Doctoral Training in Fusion Power", the names of the partner universities, and a
stripe motif seen on a Fusion CDT social-media card. They are used to describe and match
the website's appearance. [docs/branding.md](docs/branding.md) gives the sources. These
names and the visual identity belong to their owners. Their use here does not imply
approval, sponsorship or ownership by Fusion CDT, UKRI/EPSRC or any partner institution.

## Software used but not distributed

Building the slides needs TeX Live packages, including Beamer, PGF/TikZ, pgfplots,
fontspec and luaotfload, and the tools latexmk, ChkTeX, curl and librsvg. None of them is
included in this repository; each is used under its own licence.
