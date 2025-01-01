# dotfiles

My personal dotfiles for macOS development environment setup and configuration.

## Components

- **macOS**:
  - `defaults.sh`: System preferences and configurations
  - `Brewfile`: Homebrew packages and apps
- **Git**:
  - `.gitconfig`: Git settings and aliases
  - `.gitignore`: Global ignore patterns
  - `.gitattributes`: File attributes
  - `.gitsecrets`: Git-ignored file for sensitive information (use `.gitsecrets.example` as template)
- **Zsh**:
  - `.zshrc`: Main Zsh and Oh My Zsh configuration
  - `.zprofile`: Login shell configuration
  - `.zshenv`: Environment variables
  - `aliases.zsh`: Command aliases
  - `exports.zsh`: Exports and path modifications
  - `secrets.zsh`: Git-ignored file for sensitive information (use `secrets.zsh.example` as template)
- **Python**:
  - `.vscode/`: VSCode/Cursor workspace settings and extensions template
  - `pyproject.toml`: Template for Python project configuration using `uv` and `ruff`
  - `requirements.md`: Python packages I use
  - `pytorch_test_mps.py`: Availability test of Apple MPS backend for PyTorch
- **VSCode**: VSCode/Cursor global settings and keybindings
- **Scripts**: Utility scripts for various tasks
- **Misc**: Additional configurations and utilities

## Installation

### Option 1: Automated Installation

Run the installation script:

```bash
git clone https://github.com/hmdprs/dotfiles.git
cd dotfiles
/bin/bash install.sh
```

The script will:

1. Setup macOS preferences and install packages
2. Configure Git with your user information
3. Setup Zsh with Oh My Zsh and plugins
4. Configure Python development environment
5. Setup VSCode and Cursor with shared settings
6. Setup configuration for other tools I use (vim, wget, etc.)

### Option 2: Manual Installation

Each module has its own `install.sh` script that handles module-specific configurations. You can install individual modules separately.

## Maintenance

To update the configurations, simply pull the latest changes and run the install script again:

```bash
cd dotfiles
git pull
/bin/bash install.sh
```

## Important Notes

1. Make sure to review the configurations before installing
2. Back up your existing configurations before installation
3. Some changes might require a system restart to take effect
