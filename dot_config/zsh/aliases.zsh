# helper functions used by downstream scripts

# --- clipboard
alias x="xsel --clipboard"
alias xa="xsel --append --clipboard"

# --- common
alias header="curl -I"

# zoxide instead of cd
alias cd="z"
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias c="clear"
alias tree="tre -e"
alias grep="grep --color=auto"
alias v="nvim"

# eza instead of ls
alias l="eza --icons"
alias la="eza --icons -a"
alias lg="eza --icons --git"
alias ll="eza --icons -l"
alias ls="eza --icons"

# --- docker
alias d="docker"
alias dl="docker ps -a"
alias dli="docker images"

# --- kubernetes
alias h="helm"
alias kn="kubens"
alias kx="kubectx"

# --- cryptography
alias md5="openssl md5"
alias sha1="openssl sha1"
alias sha256="openssl sha -sha256"
alias sha512="openssl sha -sha512"

# --- IaC
alias tf="terraform"
alias tg="terragrunt"

# --- fuzzy finder
alias fkill="fzf-kill"
alias fgc="fzf-git-checkout"
alias fbr="fzf-git-branch"
alias fpods="fzf-browse-pods"
alias fgl="fzf-git-log"
alias fh="fzf-history"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "${method}"="lwp-request -m '${method}'"
done
