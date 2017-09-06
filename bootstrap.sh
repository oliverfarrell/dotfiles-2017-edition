#!/usr/bin/env bash

function setup() {
  rsync --exclude ".git/" \
    --exclude ".macos" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    -avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  setup;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    setup;
  fi;
fi;
unset setup;
