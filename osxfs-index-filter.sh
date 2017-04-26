#!/bin/sh

git ls-files -s | \
    egrep v1/\(osxfs\|cmd/com.docker.osxfs\|opam\|ofs\|osx-hyperkit\|osx-daemon\) | \
    GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
                  git update-index --force-remove --index-info

if [ -f "$GIT_INDEX_FILE.new" ]; then
    mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"
else
    rm -f "$GIT_INDEX_FILE"
fi
