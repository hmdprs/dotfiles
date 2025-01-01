#!/bin/bash

echo "📦 Setting up vim, wget, etc."

# install vim-plug if not already installed
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "📦 Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# create directories if they don't exist
mkdir -p "$HOME/.continue"
mkdir -p "$HOME/.config/tvnamer"

# create symbolic links for
ln -sf "$PWD/misc/.vimrc" "$HOME/.vimrc"
ln -sf "$PWD/misc/.wgetrc" "$HOME/.wgetrc"
ln -sf "$PWD/misc/continue.json" "$HOME/.continue/config.json"
ln -sf "$PWD/misc/tvnamer.json" "$HOME/.config/tvnamer/tvnamer.json"

echo "✅ Settings configured"
