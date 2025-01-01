#!/bin/bash

echo "📦  Configuring Git..."

# create symbolic links for Git configurations
ln -sf "$PWD/git/.gitattributes" "$HOME/.gitattributes"
ln -sf "$PWD/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$PWD/git/.gitignore" "$HOME/.gitignore"

# set up .gitsecrets if not already present
if [ ! -f "$HOME/.gitsecrets" ]; then
    echo "📦 Setting up Git user information..."

    # first, copy the example file to home directory
    cp "$PWD/git/.gitsecrets.example" "$HOME/.gitsecrets"

    # prompt for Git user information
    read -p "Enter your Git name: " git_name
    read -p "Enter your Git email: " git_email
    read -p "Enter your SSH signing key path (e.g., ~/.ssh/id_ed25519.pub): " ssh_key

    # update .gitsecrets with user information
    cat > "$HOME/.gitsecrets" << EOF
[user]
	name = $git_name
	email = $git_email
	signingkey = $ssh_key
EOF

    echo "✅ Git user information configured in ~/.gitsecrets"
else
    echo "ℹ️  ~/.gitsecrets already exists, skipping configuration"
fi

echo "✅ Git configured"
