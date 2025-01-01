#!/bin/bash

echo "📦 Setting up VSCode and Cursor..."

# create directories if they don't exist
mkdir -p "$HOME/Library/Application Support/Code/User"
mkdir -p "$HOME/Library/Application Support/Cursor/User"

# create symbolic links for settings
ln -sf "$PWD/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$PWD/vscode/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"

# create symbolic links for keybindings
ln -sf "$PWD/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf "$PWD/vscode/keybindings.json" "$HOME/Library/Application Support/Cursor/User/keybindings.json"

echo "✅ Settings and keybindings configured for VSCode and Cursor"
