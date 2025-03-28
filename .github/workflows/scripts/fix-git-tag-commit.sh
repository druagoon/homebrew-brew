#!/usr/bin/env bash

# `brew pr-pull` command creates a new release for the pull request before
# pushing the changes to the remote repository, so the tag is not point to
# the latest commit.

set -e

error() {
    printf "\033[31mError: $1\033[0m\n"
}

# Checkout to master branch
git checkout master

# Pull the latest changes including tags from the remote repository
git fetch --tags origin

# Get the latest tag
LATEST_TAG="$(curl -fsSL https://api.github.com/repos/druagoon/homebrew-brew/releases/latest | jq -r '.tag_name // ""')"

if [[ -z "${LATEST_TAG}" ]]; then
    error "Could not retrieve the latest tag name"
    exit 1
fi

# Get the latest commit hash
LATEST_COMMIT="$(git rev-parse HEAD)"

# Ensure the latest commit hash exist
if [[ -z "${LATEST_COMMIT}" ]]; then
    error "Could not retrieve the latest commit hash"
    exit 1
fi

# Get the latest tag commit hash
LATEST_TAG_COMMIT="$(git rev-parse "${LATEST_TAG}")"

echo "Latest tag: ${LATEST_TAG}"
echo "Latest tag commit: ${LATEST_TAG_COMMIT}"
echo "Latest commit: ${LATEST_COMMIT}"

if [[ "${LATEST_TAG_COMMIT}" == "${LATEST_COMMIT}" ]]; then
    echo "Tag ${LATEST_TAG} is already pointing to the latest commit"
    exit 0
fi

# Update the tag to point to the latest commit
git tag -f "${LATEST_TAG}" "${LATEST_COMMIT}"

# Push the updated tag to the remote repository (force overwrite)
git push origin "${LATEST_TAG}" --force

echo "Tag ${LATEST_TAG} has been updated to commit ${LATEST_COMMIT}."
