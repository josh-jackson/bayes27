#!/bin/zsh
# Back up the cached model fits (*.rds), which are not in git, to Box.
# Run from RStudio's Terminal tab:  ./backup-fits.sh
# Copies only new or changed files; never deletes anything in Box.
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/Library/CloudStorage/Box-Box/Bayesian Statistics/BayesSpring27/fits"
mkdir -p "$DEST"
setopt null_glob
files=("$SRC"/**/*.rds(.))
if (( ${#files} == 0 )); then echo "No .rds files found."; exit 0; fi
cd "$SRC"
rsync -a --relative --itemize-changes --out-format='  copied %n' ./**/*.rds(.) "$DEST/"
echo "Done: ${#files} fit files backed up to Box › Bayesian Statistics › BayesSpring27 › fits ($(du -sh "$DEST" | cut -f1))."
date '+%Y-%m-%d %H:%M' > "$DEST/LAST_BACKUP.txt"
