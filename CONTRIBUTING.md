# Contributing

Thank you for helping. This is a small, unofficial, community-maintained template; it is not
an official Fusion CDT template and is not endorsed by Fusion CDT or its partner
institutions. Please keep contributions in that spirit.

## Reporting problems

Open an issue using the bug-report or feature-request template. Reduce the problem to a
minimal example with placeholder content. Please do not attach or paste a private or
unpublished presentation.

## Making changes

1. Fork the repository and create a branch.
2. Make your change, then run:

   ```sh
   make check
   ```

   This downloads the logo if needed, builds `starter/main.pdf` and `demo/demo.pdf`, runs
   ChkTeX, and fails on theme warnings, undefined references, overfull boxes and BibTeX
   warnings.
3. Open `demo/demo.pdf` and look at the slides your change affects. A successful build
   alone is not enough.
4. Open a pull request and fill in the short template.

## Guidelines

- **Keep the look tied to evidence.** The colours and layout follow the Fusion CDT website.
  A change to colours or branding must cite its source in [docs/branding.md](docs/branding.md).
- **Keep public commands stable**: `\usetheme{FusionCDT}`, its options, and the `\fcdt...`
  commands documented in the README. Document any new option or command in the README.
- **Keep LaTeX clean.** ChkTeX must pass (`make lint`). If you add a ChkTeX exception,
  keep it as narrow as possible and explain it in a comment. Write inline mathematics as
  `\( ... \)`.
- **Do not commit** compiled presentation PDFs, the downloaded logo, or third-party files
  without a licence that allows redistribution. Record any new third-party asset in
  [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
- **Keep examples generic.** Content in `starter/` and `demo/` must be placeholder or clearly
  illustrative, with no real results or personal details.

## Updating the preview images

After a visible change, rebuild the demonstration and regenerate both images from the
repository's top folder:

```sh
make demo
pdftoppm -png -singlefile -f 1 -l 1 -scale-to-x 960 -scale-to-y -1 demo/demo.pdf docs/images/title-slide
pdftoppm -png -singlefile -f 8 -l 8 -scale-to-x 960 -scale-to-y -1 demo/demo.pdf docs/images/content-slide
```

Page 8 is the plot slide. If you add or remove slides before it, adjust the number.

## Releases

1. Update the version and date in the `\ProvidesPackage` line of
   `theme/beamerthemeFusionCDT.sty`.
2. Tag the commit, for example `v1.0.0`, and create a GitHub release.
3. Attach `demo/demo.pdf` from the CI run for that commit, as long as the logo question in
   [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) allows it.
4. Start every release description with the notice:

   > Unofficial, community-maintained LaTeX Beamer template inspired by the Fusion CDT
   > visual identity. This is not an official Fusion CDT template and is not endorsed by
   > Fusion CDT or its partner institutions.

By contributing, you agree that your contribution is licensed under the MIT licence, or
CC0 1.0 for files in `starter/` and `demo/`, as described in the README.
