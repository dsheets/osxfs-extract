#!/bin/bash

sed -E -e 's/(^|[[:space:]])#([0-9]+)/\1docker\/pinata#\2/g' | \
    cat - <(printf "\n\nExtracted from docker/pinata@%s" $GIT_COMMIT)
