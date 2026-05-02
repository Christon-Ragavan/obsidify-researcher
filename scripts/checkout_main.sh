#!/bin/bash
# ─────────────────────────────────────────────
# Run from: /obsidify-researcher
# ─────────────────────────────────────────────

echo "Switching to main..."
git checkout main || { echo "ERROR: Failed to switch to main"; exit 1; }

echo "Pulling latest main..."
git pull origin main || { echo "ERROR: Failed to pull main"; exit 1; }

echo ""
echo "Done. Now on main."