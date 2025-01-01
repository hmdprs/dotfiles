#!/usr/bin/bash

echo "📦 Setting up macOS and installing packages..."

# configure macOS settings
/bin/bash "$PWD/macos/defaults.sh"

# install Xcode Command Line Tools if not installed
if ! xcode-select -p &> /dev/null; then
    echo "📦 Installing Xcode Command Line Tools..."
    xcode-select --install
else
    echo "✅ Xcode Command Line Tools already installed"
fi

# install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

brew update

# install packages from Brewfile
echo "📦 Installing packages from Brewfile..."
brew bundle --file="$PWD/macos/Brewfile"

echo "✅ macOS settings and packages installed"
