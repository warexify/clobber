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

# Generate the "packrd" files
$GOBIN/packr2

## FIXME: This is a temporary fix
# Fix generated files
sed -i '' -e 's/dids/Dids/g' cmd/cmd-packr.go

# Build the application
go build -ldflags "-X main.Version=${VERSION}" -o ${OUTPUT} .

# Clean the intermediate files
$GOBIN/packr2 clean
