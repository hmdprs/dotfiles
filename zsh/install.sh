#!/bin/bash
# see: https://htr3n.github.io/2018/07/faster-zsh/

echo "📦 Setting up Zsh and Oh My Zsh..."

# install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ oh-my-zsh already installed"
fi

# install oh-my-zsh plugins
echo "📦 Installing oh-my-zsh plugins..."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi


# create symbolic links for zsh
echo "🔗 Creating symbolic links for zsh..."
ln -sf "$PWD/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$PWD/zsh/.zprofile" "$HOME/.zprofile"
ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/zsh/aliases.zsh" "$ZSH_CUSTOM/aliases.zsh"
ln -sf "$PWD/zsh/exports.zsh" "$ZSH_CUSTOM/exports.zsh"

# create secrets.zsh from example if it doesn't exist
if [ ! -f "$ZSH_CUSTOM/secrets.zsh" ]; then
    echo "📝 Creating secrets.zsh from example..."
    cp "$PWD/zsh/secrets.zsh.example" "$ZSH_CUSTOM/secrets.zsh"
    echo "🔑 Don't forget to update $ZSH_CUSTOM/secrets.zsh with your sensitive information"
fi

echo "✅ Zsh and Oh My Zsh configured"
