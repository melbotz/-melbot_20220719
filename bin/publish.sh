#!/usr/bin/env bash

# git push github
git remote | xargs -L1 git push --all
npm publish

#RELAY="ws://nostr.rocks:1617"
RELAY=$(git config gitmark.relay)
GENESIS="gitmark:9c84a033afd5481f6ea5f56bd3dac1bc0cb944dcb93a2fa6c7117bd2f1be94d0:0"
CREATED=1658181723


git-mark-list $(git config gitmark.secret) --genesis "${GENESIS}" --created "${CREATED}" -g $(cat package.json | jq -r '.repository.url')  | websocat $RELAY
