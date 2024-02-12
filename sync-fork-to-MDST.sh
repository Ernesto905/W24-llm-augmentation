#!/bin/bash

# The branch you want to sync with upstream
TARGET_BRANCH="main"

# The URL of the original repository
UPSTREAM_REPO_URL="https://github.com/MichiganDataScienceTeam/W24-llm-augmentation.git"

# Ensure the working directory is clean
if [[ -n $(git status -s) ]]; then
  echo "You have uncommitted changes. Please commit or stash them."
  exit 1
fi

# Add upstream remote if it doesn't exist
git remote add upstream $UPSTREAM_REPO_URL 2> /dev/null || true

# Fetch the latest changes from upstream
git fetch upstream

# Check out to your target branch
git checkout $TARGET_BRANCH

# Merge the changes from upstream/target branch into your target branch
git merge upstream/$TARGET_BRANCH

# Optionally, if you prefer rebasing, comment out the merge command above and uncomment the next line
# git rebase upstream/$TARGET_BRANCH

# Push the changes to your fork on GitHub
git push origin $TARGET_BRANCH
