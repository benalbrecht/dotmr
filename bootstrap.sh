#!/bin/sh
ln -sf ~/.homesick/repos/dotmr/home/.mrconfig ~/.mrconfig
# change git remote url to ssh
cd ~/.homesick/repos/dotmr
REMOTE=$(git remote -v|head -n 1|awk '{print $2}')
test  "${REMOTE#*@}" != "$REMOTE" || \
  git remote set-url origin $(echo $REMOTE|sed -e 's#.*://\([^/]*\)/#git@\1:#')

