# Bayesian Statistics — course website

Spring 2027: classes start Tue 2027-01-19, meeting Tue/Thu 2:30–3:50. Local repo: `~/Developer/bayes27`. GitHub: josh-jackson/bayes27. Site: Netlify (publish directory `_site`, no build command).

Quarto website for a graduate Bayesian statistics course (psychology). Lectures are revealjs slide decks with live R code that the instructor walks through in class; homework are Quarto docs. Audience: psych grad students who know regression/`lm` but are new to Bayes.

## Layout
- `_quarto.yml` — website config (navbar: Home, Lectures, Homework, Syllabus; cosmo theme, `styles.css`).
- `index.qmd` — announcements (newest at top). `lectures.qmd` / `homeworks.qmd` — numbered link lists; update when adding files.
- Lectures: `<topic>-<n>.qmd` (e.g. `glm-7.qmd`), `format: revealjs`, `slide-number: true`, `execute: echo: true`. Slides split on `##`.
- Homework: `hw-<n>.qmd`.
- Cached model fits: `*.rds` (e.g. `glm.8d.rds`) loaded with `readRDS()` so slides render fast. They are **gitignored** (kept only on this Mac; 2025 originals also in Box `Bayesian Statistics/BayesSpring25`). Never delete them; refit only when a model changes.
- `_site/` — rendered output, **committed**; Netlify serves it directly (no build step on Netlify).

## Conventions
- Models in **brms**; summaries/plots with **tidybayes** and **marginaleffects** (preferred over brms helper functions), **tidyverse**, **patchwork**. Avoid deprecated functions.
- Write models in likelihood notation (e.g. `y_i ~ Normal(mu_i, sigma)`, `mu_i = b0 + b1 x_i`) alongside code.
- Readings reference Statistical Rethinking 2e (SR), Kurz's brms translation, Model to Meaning (M2M), Heiss blog posts (AH).
- Tone: conversational, a bit irreverent; code walked through step by step.
- Homework: applied computations, students' own data where possible, group work allowed. Each new homework should come with a separate solution key that is **not** committed to this public repo (save it outside the repo or in the vault).

## Workflow
- Instructor's planning notes live in the Obsidian vault at `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Pmad lab/Teaching/Bayesian Statistics/` — read `Bayes Revision Notes.md` before revising a lecture, and tick items off there when done (with the instructor's OK).
- Render a single file: `quarto render <file>.qmd`; full site: `quarto render`. Preview: `quarto preview`.
- After fitting or refitting any model, run `./backup-fits.sh` (copies new/changed `.rds` files to Box `Bayesian Statistics/BayesSpring27/fits`; never deletes).
- Never refit a long model or delete `.rds` fits without asking.
- **Never push without asking** — pushing publishes to students via Netlify. Commit in small, described steps.
- This repo is public: never commit grades, student names/work, exam answer keys, or private submission links.
