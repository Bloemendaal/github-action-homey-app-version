#!/bin/sh -l

set -e

cd /github/workspace/

npm install
npm version $1 --git-tag-version false
npx homey app version "$1" --changelog "$2"
npx homey run build
npm run check

echo "version=$(cat app.json | jq --raw-output .version)" >> $GITHUB_OUTPUT
