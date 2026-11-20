---
name: Bug report
about: Something in the theme, starter or demonstration does not work as documented
labels: bug
---

<!--
Please do not attach or paste a private or unpublished presentation.
Reduce the problem to a small example that uses only placeholder content.
-->

**What happened?**


**What did you expect to happen?**


**Minimal example**

```latex
\documentclass[aspectratio=169]{beamer}
\usetheme{FusionCDT}
\title{Presentation title}
\author{Author Name}
\begin{document}
\fcdttitleframe
\begin{frame}{Frame title}
  Shortest content that shows the problem.
\end{frame}
\end{document}
```

**How did you build it?**

<!-- For example: `make`, `latexmk` in the starter folder, or your editor's build button. -->

**Environment**

- Engine and version (first line of `lualatex --version`):
- TeX distribution and year (for example TeX Live 2025, MiKTeX):
- Operating system:
- Theme version (from the `\ProvidesPackage` line) or commit:

**Log excerpt**

<!-- From the .log file: the first error or the warning in question, with a few lines around it. -->

```text

```
