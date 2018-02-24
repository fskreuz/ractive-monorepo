#!/usr/bin/env bash
# Read the top-level package.json version and apply it to everyone.

set -e

RACTIVE_VERSION=$(< package.json sed -n 's/.*"version":\s*"\([^"]\+\)".*/\1/p')

find packages -mindepth 4 -maxdepth 4 -type f -name package.json -exec sed -i "s/\"version\":\s*\"\([^\"]\+\)\"/\"version\": \"${RACTIVE_VERSION}\"/" {} \;
