#!/bin/sh -l

set -e

INPUT_BRANCH=${INPUT_BRANCH:-master}
INPUT_FORCE=${INPUT_FORCE:-false}
INPUT_TAGS=${INPUT_TAGS:-false}
INPUT_DIRECTORY=${INPUT_DIRECTORY:-'.'}
_FORCE_OPTION=''
REPOSITORY=${INPUT_REPOSITORY:-$GITHUB_REPOSITORY}

git config --global user.email "me@ahmadawais.com"
git config --global user.name "Ahmad Awais"

echo "❯ Generate changelog:";
npx auto-changelog

echo "❯ Git commit:";
git add .
git commit -m " 📖 DOC: Changelog"

echo "❯ Configure:";
[ -z "${INPUT_GITHUB_TOKEN}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

if ${INPUT_FORCE}; then
    _FORCE_OPTION='--force'
fi
if ${TAGS}; then
    _TAGS='--tags'
fi
cd ${INPUT_DIRECTORY}
remote_repo="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${REPOSITORY}.git"

echo "❯ Git push:";
git push "${remote_repo}" HEAD:${INPUT_BRANCH} --follow-tags $_FORCE_OPTION $_TAGS;
echo "❯❯ All done!";
