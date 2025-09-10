# ~/.bash_profile: executed by bash(1) for login shells.

# Source .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Add user's private bin to PATH if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Set default editor
export EDITOR=vim
export VISUAL=vim

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8