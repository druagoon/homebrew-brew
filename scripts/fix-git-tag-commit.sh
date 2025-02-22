#!/usr/bin/env bash

# `brew pr-pull` command creates a new release for the pull request before
# pushing the changes to the remote repository, so the tag is not point to
# the latest commit.

set -e

# Get the latest tag
LATEST_TAG="$(git describe --tags --abbrev=0)"

# Get the latest commit hash
LATEST_COMMIT="$(git rev-parse HEAD)"

# Ensure the tag and commit hash exist
if [[ -z "${LATEST_TAG}" || -z "${LATEST_COMMIT}" ]]; then
    echo "Error: Could not retrieve the latest tag or commit hash."
    exit 1
fi

echo "Latest tag: ${LATEST_TAG}"
echo "Latest commit: ${LATEST_COMMIT}"

# Update the tag to point to the latest commit
git tag -f "${LATEST_TAG}" "${LATEST_COMMIT}"

# Push the updated tag to the remote repository (force overwrite)
git push origin "${LATEST_TAG}" --force

echo "Tag ${LATEST_TAG} has been updated to commit ${LATEST_COMMIT}."
