#!/bin/bash

# Dotfiles installation script
# This script creates symbolic links from the home directory to dotfiles in this repository

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo -e "${GREEN}Installing dotfiles from $DOTFILES_DIR${NC}"

# Function to create backup
backup_file() {
    local file=$1
    if [ -e "$file" ]; then
        echo -e "${YELLOW}Backing up existing $file to $BACKUP_DIR${NC}"
        mkdir -p "$BACKUP_DIR"
        mv "$file" "$BACKUP_DIR/"
    fi
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2
    
    echo -e "Creating symlink: ${GREEN}$target${NC} -> ${GREEN}$source${NC}"
    
    # Backup existing file if it exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        backup_file "$target"
    elif [ -L "$target" ]; then
        # Remove existing symlink
        rm "$target"
    fi
    
    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Create symlink
    ln -sf "$source" "$target"
}

echo -e "${GREEN}Creating symbolic links...${NC}"

# Bash configurations
create_symlink "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
create_symlink "$DOTFILES_DIR/bash/.bash_profile" "$HOME/.bash_profile"

# Git configurations
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

# Vim configuration
create_symlink "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

# Tmux configuration
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo -e "${GREEN}Installation completed!${NC}"
echo -e "${YELLOW}Note: Remember to update the git configuration with your name and email:${NC}"
echo -e "  git config --global user.name \"Your Name\""
echo -e "  git config --global user.email \"your.email@example.com\""
echo -e "${YELLOW}Restart your shell or run 'source ~/.bashrc' to apply bash changes.${NC}"

if [ -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Your original files have been backed up to: $BACKUP_DIR${NC}"
fi