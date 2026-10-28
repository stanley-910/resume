#!/bin/sh
# Publish the resume to https://stanleywang.dev/resume.
#
# Compiles SRC and pushes the PDF to the website's main branch as a commit on
# top of origin/main, built with plumbing in a throwaway index, so the website
# checkout, its branch and its working tree are never touched. Vercel deploys
# the push.
#
#   scripts/publish-resume.sh                  publish now
#   scripts/publish-resume.sh --if-changed     publish only if HEAD changed SRC (the post-commit hook)
#   DRY_RUN=1 scripts/publish-resume.sh        do everything but push
set -eu

# The resume that is the real one. Change this line to publish a different file.
SRC=stripe/stanley-wang-stripe-resume.typ
SITE="$HOME/Developer/portfolios/stanley-wang"
DEST=public/pdfs/stanley-wang-resume.pdf

# A hook runs with git's variables pointed at this repository; clear them so
# the commands below act on the repository they're run in.
unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_PREFIX

cd "$(git rev-parse --show-toplevel)"

if [ "${1:-}" = "--if-changed" ]; then
  git diff-tree --root --no-commit-id --name-only -r HEAD | grep -qxF "$SRC" || exit 0
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Stamp the PDF with the source's last commit time, so the same source always
# compiles to the same bytes and an unchanged resume publishes nothing.
stamp=$(git log -1 --format=%ct -- "$SRC")
[ -n "$stamp" ] || stamp=$(date +%s)
typst compile --creation-timestamp "$stamp" "$SRC" "$tmp/resume.pdf"

pages=$(pdfinfo "$tmp/resume.pdf" | awk '/^Pages:/ { print $2 }')
if [ "$pages" != 1 ]; then
  echo "publish-resume: $SRC compiles to $pages pages; not publishing" >&2
  exit 1
fi

source_ref="$(git rev-parse --short HEAD)"
git diff --quiet HEAD -- "$SRC" || source_ref="$source_ref+uncommitted"

cd "$SITE"
git fetch -q origin main
blob=$(git hash-object -w "$tmp/resume.pdf")
if [ "$blob" = "$(git rev-parse -q --verify "origin/main:$DEST" || true)" ]; then
  echo "publish-resume: stanleywang.dev already has this resume"
  exit 0
fi

GIT_INDEX_FILE="$tmp/index" git read-tree origin/main
GIT_INDEX_FILE="$tmp/index" git update-index --add --cacheinfo "100644,$blob,$DEST"
tree=$(GIT_INDEX_FILE="$tmp/index" git write-tree)
commit=$(git commit-tree "$tree" -p origin/main \
  -m "chore(resume): publish resume from resume@$source_ref")

if [ -n "${DRY_RUN:-}" ]; then
  echo "publish-resume: dry run; would push $commit to origin/main:"
  git diff --stat origin/main "$commit"
  exit 0
fi

git push -q origin "$commit:refs/heads/main"
echo "publish-resume: pushed $(git rev-parse --short "$commit"); live at https://stanleywang.dev/resume after Vercel deploys"
