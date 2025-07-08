# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages development environment configurations across multiple tools and shells. The repository uses thoughtbot's `rcm` (dotfile manager) for installation and management.

## Key Components

### Configuration Structure
- `config/` - Application-specific configuration files
  - `fish/` - Fish shell configuration and functions
  - `nvim/` - Neovim configuration
  - `alacritty/` - Terminal emulator configuration
  - `karabiner/` - Keyboard remapping configuration
  - `memo/` - Note-taking configuration
  - `peco/` - Interactive filtering configuration
  - `pip/` - Python package manager configuration

### Core Files
- `vimrc` - Vim configuration with extensive plugin setup using vim-plug
- `tmux.conf` - Tmux configuration with vim-style key bindings
- `gitconfig` - Git configuration with aliases, colors, and git-secrets integration
- `bashrc` - Bash shell configuration
- `README.md` - Setup and installation instructions

## Setup and Installation

### Initial Setup
The repository uses `rcm` for managing dotfiles:

```sh
# Install rcm
brew tap thoughtbot/formulae
brew install rcm

# Clone and setup
cd ~
git clone git@github.com:inamima/dotfiles.git .dotfiles
rcup
```

### Editor Setup

#### Vim/Neovim Plugin Installation
```sh
# For Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim
:PlugInstall
```

#### Vimproc Compilation
```sh
cd ~/.vim/bundle/vimproc
make -f make_unix.mak
```

## Key Features

### Fish Shell Configuration
- Custom PATH setup for Cargo, Poetry, and local binaries
- AWS session token TTL configuration
- Docker, Docker Compose, and Terraform aliases
- Peco integration for history and repository search
- Starship prompt integration
- Custom functions for tmux, tig, and aws-vault

### Git Configuration
- Enhanced logging with `lg` and `lga` aliases
- Git secrets integration with AWS pattern detection
- Diff highlighting with custom pager setup
- Neovim as default editor

### Vim Configuration
- Extensive plugin ecosystem using vim-plug
- Solarized color scheme
- Unite.vim for file/buffer navigation
- Syntastic for syntax checking
- Fugitive for Git integration
- TypeScript and Python development support

### Tmux Configuration
- Prefix key remapped to Ctrl-a
- Vim-style pane navigation and resizing
- 256-color terminal support
- Window numbering starts at 1

## Development Environment

### Shell Environment
- Fish shell with custom functions and key bindings
- Starship prompt for enhanced shell experience
- Peco for interactive filtering and selection
- AWS-vault integration for AWS credential management

### Editor Environment
- Neovim/Vim with comprehensive plugin setup
- Syntax highlighting and completion
- Git integration and file navigation
- TypeScript and Python language support

### Terminal Environment
- Tmux for session management
- Alacritty terminal emulator
- Custom key bindings and color schemes

## Security Features

- Git secrets integration prevents committing AWS credentials
- Configured patterns for detecting AWS access keys and account IDs
- Template directory setup for automatic git-secrets initialization