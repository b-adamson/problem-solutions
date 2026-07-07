# Problem Set Solutions

Math and physics problem set solutions, written in LaTeX.

**Browse compiled PDFs:** https://\<your-github-username\>.github.io/\<repo-name\>/
*(enable once, see "Setup" below)*

## Structure

Each problem set lives in its own top-level folder, named
`<subject>-<topic>-ps<n>` (e.g. `example-classical-mechanics-ps1/`), containing
a single `main.tex`. On every push to `main`, GitHub Actions compiles every
`main.tex` to PDF and publishes them all to GitHub Pages with an auto-generated
index — nothing to build or commit locally.

```
example-classical-mechanics-ps1/
  main.tex
another-topic-ps2/
  main.tex
```

## Adding a new problem set

```bash
cp -r _template my-subject-topic-ps1
$EDITOR my-subject-topic-ps1/main.tex
git add my-subject-topic-ps1
git commit -m "Add my-subject-topic ps1"
git push
```

The Pages site updates automatically after the push.

## Compiling locally (WSL)

```bash
cd my-subject-topic-ps1
latexmk -pdf main.tex
```

## Setup (one-time)

1. Push this repo to GitHub.
2. In the repo settings, go to **Settings → Pages** and set **Source** to
   **GitHub Actions**.
3. Push to `main` (or run the workflow manually from the **Actions** tab) —
   the site will be live at `https://<username>.github.io/<repo>/`.
