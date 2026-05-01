#!/bin/bash

# ─────────────────────────────────────────────
# Run from: /obsidify-researcher
# ─────────────────────────────────────────────

BRANCH="cn_notes/obsidian_session"

echo "Fetching latest from origin..."
git fetch origin

echo "Switching to main..."
git checkout main || { echo "ERROR: Failed to switch to main"; exit 1; }

echo "Pulling latest main..."
git pull origin main || { echo "ERROR: Failed to pull main"; exit 1; }

echo "Deleting remote branch $BRANCH..."
git push origin --delete "$BRANCH" 2>/dev/null && echo "Remote branch deleted" || echo "WARNING: Remote branch did not exist, skipping"

echo "Deleting local branch $BRANCH..."
git branch -D "$BRANCH" 2>/dev/null && echo "Local branch deleted" || echo "WARNING: Local branch did not exist, skipping"

echo "Recreating $BRANCH from main..."
git checkout -b "$BRANCH" || { echo "ERROR: Failed to create branch"; exit 1; }

echo "Pushing $BRANCH to origin..."
git push origin "$BRANCH" || { echo "ERROR: Failed to push branch"; exit 1; }

echo ""
echo "Done. $BRANCH is reset to latest main."