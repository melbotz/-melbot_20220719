#!/usr/bin/env bash

DEFAULT_MESSAGE="commit"
MESSAGE="${1:-$DEFAULT_MESSAGE}"


git add .
git commit -m "${MESSAGE}"
npm version patch 

git mark --exodus --send --tags --commit

./bin/publish.sh