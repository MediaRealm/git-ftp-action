#!/bin/sh -l

git config --global --add safe.directory /github/workspace

git-ftp push \
  --syncroot $INPUT_SYNCROOT \
  --user $INPUT_USER \
  --passwd $INPUT_PASSWORD \
  $INPUT_OPTIONS \
  $INPUT_URL
