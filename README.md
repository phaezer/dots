# Personal Dotfiles

My personal configuration files for various applications and tools.

## Overview

This repository contains my dotfiles and configuration files for:
- Shell environments (Bash)
- Git
- Vim/text editors
- Terminal multiplexer (tmux)
- And other development tools

## Installation

Clone this repository and run the installation script:

```bash
git clone https://github.com/phaezer/dots.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Structure

```
├── bash/          # Bash configuration files
├── git/           # Git configuration
├── vim/           # Vim configuration
├── tmux/          # Tmux configuration
├── install.sh     # Installation script
└── README.md      # This file
```

## Usage

The `install.sh` script will create symbolic links from your home directory to the files in this repository. This allows you to keep your dotfiles in version control while having them in the expected locations.

## Customization

Feel free to fork this repository and customize the configurations to your preferences. Each directory contains configuration files specific to that application.

## Backup

Before installation, the script will backup any existing dotfiles to `~/.dotfiles_backup/` with timestamps.

## License

Feel free to use and modify these configurations for your own setup.
