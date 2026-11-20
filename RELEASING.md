# Releasing

Maintainer instructions. There is one release process: push an annotated version tag.
The **Release** workflow then builds that exact commit and creates a **draft** GitHub
Release, and a maintainer reviews and publishes it.

## Versions, tags and releases

- **Version number**: `MAJOR.MINOR.PATCH`, following [Semantic Versioning](https://semver.org/),
  for example `1.0.0`. It is declared in one place, the `\ProvidesPackage` line of
  `theme/beamerthemeFusionCDT.sty`, together with the release date:

  ```latex
  \ProvidesPackage{beamerthemeFusionCDT}[YYYY/MM/DD vX.Y.Z Unofficial Fusion CDT Beamer theme]
  ```

  Users see this line in their `.log` file. `CHANGELOG.md` repeats the version and date
  in its heading for that release (`## [X.Y.Z] - YYYY-MM-DD`).
  `scripts/check-version.sh` fails if the two disagree. It runs in `make check`, in CI on
  every push, and in the release workflow, which also checks the tag.
- **Git tag**: `v` plus the version, for example `v1.0.0`. It is an annotated tag on the
  release commit. A pushed version tag is never moved or deleted.
- **GitHub Release**: the page attached to a tag, with release notes and downloads. It
  offers GitHub's automatic *Source code* archives and the compiled demonstration PDF.

## Public interface

These are what other people's presentations rely on. Changing them is governed by the
version rules below:

- `\usetheme{FusionCDT}` and the file name `beamerthemeFusionCDT.sty`;
- the options `nosectionpages` and `cream`;
- the commands `\fcdttitleframe`, `\fcdtsectionframe`, `\fcdtclosingframe`, `\fcdtlogo`,
  `\fcdtsetstriptext`, `\fcdtsetpartners` and `\fcdtassetdir`, and their arguments;
- the documented colour names (`fcdtBlue` and the others) and the pgfplots cycle list
  `fusioncdt`;
- the files a presentation needs, and how they are found: the `theme/` folder with
  `fonts/` and `logo/fusion-cdt-logo-white.pdf`, the `latexmkrc` convention, and the
  `make` targets `logo`, `starter`, `demo`, `check` and `clean`;
- the supported setup: LuaLaTeX, 16:9 slides, and the tested toolchain in the README;
- the content area of the slides: margins, title and footer heights.

Internal macros containing `@` (such as `\fcdt@titlebg`), the drawing code and the CI
workflows are not part of the interface.

## Choosing the version number

| Change | Version | Examples |
|---|---|---|
| **Breaking**: an existing presentation may stop compiling, behave differently or no longer fit | Major (`2.0.0`) | Removing or renaming a public command, option, colour or the cycle list; changing a command's arguments or an option's meaning; moving or renaming required files; needing a newer TeX Live than the tested one, or dropping a supported engine; shrinking the content area so existing slides may overflow |
| **New and backwards-compatible** | Minor (`1.1.0`) | A new option, command or colour; a new optional feature; a visible refinement backed by new branding evidence that keeps existing slides fitting; updating the default partner list after the website changes |
| **Fixes only**, no interface change | Patch (`1.0.1`) | A bug fix that makes documented behaviour work; documentation or CI fixes; a new logo download URL for the same logo |

Use a **prerelease**, such as `1.1.0-rc.1`, when a substantial change (for example a new
layout option, or support for a newer TeX Live) should be tested by others before it
becomes stable. The workflow marks such releases as prereleases, and GitHub does not show
them as the latest release. Follow up with the stable version, `1.1.0`.

## Release steps

1. Start from an up-to-date `main` with a clean working tree, where the latest **Build**
   run has passed.
2. Choose the new version from the table above.
3. Edit two files with the same version and date:
   - `CHANGELOG.md`: rename `## [Unreleased]` to `## [X.Y.Z] - YYYY-MM-DD`, check that it
     describes the changes for users, and add a new empty `## [Unreleased]` above it;
   - `theme/beamerthemeFusionCDT.sty`: set `YYYY/MM/DD vX.Y.Z` in the `\ProvidesPackage`
     line.
4. Check locally and preview the release notes:

   ```sh
   make check
   make check-version TAG=vX.Y.Z
   sh scripts/release-notes.sh X.Y.Z
   ```

5. Commit with the message `Release vX.Y.Z` and push to `main`. Wait until the **Build**
   workflow has passed for that commit.
6. Create an annotated tag on that commit, check that it is the commit you pushed, and push
   the tag. **Pushing the tag starts the Release workflow.**

   ```sh
   git tag -a vX.Y.Z -m "vX.Y.Z"
   git rev-parse "vX.Y.Z^{commit}" origin/main   # the two hashes must be equal
   git push origin vX.Y.Z
   ```

7. Wait for the **Release** workflow to pass. It creates a draft release.
8. Open the draft on the repository's **Releases** page. Check the notes, open the
   attached PDF, and check the prerelease setting.
9. Publish it, either with **Publish release** on GitHub or with
   `gh release edit vX.Y.Z --draft=false`.

## What the Release workflow does

`.github/workflows/release.yml` runs when a tag such as `v1.2.3` or `v1.2.3-rc.1` is pushed:

1. **build**: runs `.github/workflows/build.yml`, the same build, lint, version and log
   checks as every push, on the tagged commit. It has read-only access.
2. **draft-release**: runs only if the build passed. It checks that the tag matches the
   version declarations and takes the demonstration PDF built in the same run, as
   `fusion-cdt-beamer-unofficial-vX.Y.Z-demo.pdf`. It generates the notes with
   `scripts/release-notes.sh` and creates a draft release, marked as a prerelease if the
   version has a suffix. Only this job can write to the repository, through the
   workflow's own `GITHUB_TOKEN`. No personal access token is needed.

If a draft for the tag already exists, the job updates it instead of creating a second
one. It never changes a release that has already been published.

## When something goes wrong

- **The Release workflow failed for a passing reason** (for example a package mirror,
  the network or the logo download): open the failed run under **Actions** and choose
  **Re-run failed jobs**. The re-run uses the same tag and commit, and updates the draft
  if one exists.
- **The tagged commit itself is wrong** (the build fails, or the version check rejects the
  tag): do not move or re-create the tag. Fix the problem on `main`, then release the next
  patch version, for example `v1.0.1`. If the failed tag left a draft release, delete the
  draft with `gh release delete vX.Y.Z --yes`; the tag stays as a record.
- **A published release has a problem**: leave its assets and tag alone and publish a new
  patch version. The release notes text can still be edited.
- Do not create releases by hand for version tags. The workflow would refuse to update a
  release that is already published.

## Optional repository settings

- **Immutable releases** (repository settings): after publication, a release's assets and
  tag can no longer be changed. The draft-first process is compatible with this setting.
- **Tag rulesets** for `v*`: to stop anyone from deleting or moving version tags.

Releases of a private repository are visible only to people with access to it. They
become public when the repository does.
