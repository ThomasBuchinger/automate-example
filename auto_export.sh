#!/bin/bash
EXPORT_ID=$1
rm -rf my-awsome-project

git clone https://gitlab.eb.lan.at/s92va/my-awsome-project
cd my-awsome-project
git fetch --all
git branch --track develop origin/develop
git checkout develop

echo "=== Exporting Cloudforms ==="
echo "line $EXPORT_ID" >> develop
git add --all
git commit -m "auto export $EXPORT_ID"
echo "=== Rebase Exports onto master (i.e. pick up git changes) ==="
git rebase master
git checkout master
echo "=== Merge Export (i.e. THE TRUTH) into master"
git merge develop
echo "import running"

git push --all
