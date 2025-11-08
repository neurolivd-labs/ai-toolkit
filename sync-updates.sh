#!/bin/bash

# AI Toolkit Sync Script
# Updates all git submodules to their latest versions

set -e

echo "🔄 Syncing AI Toolkit..."
echo ""

# Navigate to the script's directory
cd "$(dirname "$0")"

echo "📥 Updating git submodules..."
git submodule update --remote --merge

echo ""
echo "✅ All submodules updated successfully!"
echo ""
echo "Updated skills:"
git submodule foreach 'echo "  - $(basename $path): $(git log -1 --format=%s)"'

echo ""
echo "🎉 Sync complete!"
