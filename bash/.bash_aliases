# Additional bash aliases - source this from .bashrc if desired

# System information
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias top='top -o %CPU'

# File operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'

# Network
alias ping='ping -c 5'
alias ports='netstat -tulanp'

# Development shortcuts
alias py='python3'
alias serve='python3 -m http.server'
alias json='python3 -m json.tool'

# Archive operations
alias tarls='tar -tvf'
alias untar='tar -xf'

# Find shortcuts
alias ff='find . -type f -name'
alias fd='find . -type d -name'

# History
alias h='history'
alias hgrep='history | grep'

# Process management
alias psg='ps aux | grep'
alias killall='killall -v'