#! /bin/sh

# Adapted from
# https://stackoverflow.com/questions/4060212/how-to-run-a-shell-script-when-a-file-or-directory-changes

# Run antora initially once
DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr antora site-local.yml --pull --stacktrace

# Begin live regeneration
DIRECTORIES_TO_OBSERVE="."
function look_for_change {
  inotifywait -r \
    -e modify,move,create,delete \
    $DIRECTORIES_TO_OBSERVE
}
while look_for_change; do
  DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr antora site-local.yml --pull --stacktrace
done
