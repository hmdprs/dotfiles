#!/bin/bash

# exit on error
set -e

echo "🚀 Starting dotfiles installation..."

# run module-specific installation scripts
modules=(
    "macos"
    "git"
    "zsh"
    "python"
    "vscode"
    "misc"
)

for module in "${modules[@]}"; do
    if [ -f "$module/install.sh" ]; then
        echo "🟢 Setting up $module..."
        /bin/bash "$module/install.sh"
    else
        echo "🔴 No installation script found for $module"
    fi
done

echo "✅ Installation complete!"
echo "Please restart your terminal and computer for all changes to take effect."
