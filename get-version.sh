#!/bin/bash
# Get short Git hash
GIT_HASH=$(git rev-parse --short HEAD 2>/dev/null || echo "no-git")
echo "$GIT_HASH"
