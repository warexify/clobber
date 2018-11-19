#!/usr/bin/env bash

# Setup error handling
set -o errexit   # Exit when a command fails (set -e)
set -o nounset   # Exit when using undeclared variables (set -u)
set -o pipefail  # Exit when piping fails
set -o xtrace    # Enable debugging (set -x)

# Setup overrideable arguments
VERSION=${1:-0.0.1}
OUTPUT=${2:-clobber}

# Define necessary paths
GOBIN=$GOPATH/bin

# Make sure Packr is installed
go get -u github.com/gobuffalo/packr/v2/packr2

# Clean the intermediate files
$GOBIN/packr2 clean

## FIXME: We're using the --legacy flag because packr2 has an issue with the "vendor/" directory
# Build the application
$GOBIN/packr2 --legacy build -ldflags "-X main.Version=${VERSION}" -o ${OUTPUT} .

# Clean the intermediate files
$GOBIN/packr2 clean
