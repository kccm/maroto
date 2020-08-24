#!/usr/bin/env bash
set -e
echo "" > coverage.txt
for d in $(go list ./... | grep -v vendor); do
    go test -coverprofile=profile.out -coverpkg=github.com/kccm/maroto/pkg/pdf,github.com/kccm/maroto/pkg/props,github.com/kccm/maroto/internal $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.txt
        rm profile.out
    fi
done