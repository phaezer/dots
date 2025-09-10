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

# git
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gdca="git diff --cached"
alias gdct="git describe --tags $\(git rev-list --tags --max-count=1\)"
alias gdcw="git diff --cached --word-diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gft="git fetch --tags"
alias gl="git log"
alias glb="git log --graph --oneline --decorate --all"
alias glc="git log --graph --oneline --decorate --all --color"
alias glcb="git log --graph --oneline --decorate --all --color --branches"
alias glcp="git log --graph --oneline --decorate --all --color --patch"
alias glcpb="git log --graph --oneline --decorate --all --color --patch --branches"
alias glcpr="git log --graph --oneline --decorate --all --color --patch --remotes"
alias glcprb="git log --graph --oneline --decorate --all --color --patch --remotes --branches"
alias glg="git log --graph --oneline --decorate"
alias glo="git log --oneline"
alias glog="git log --oneline --graph"
alias gloga="git log --oneline --graph --all"
alias glp="git log --graph --oneline --decorate --patch"
alias gm="git merge"
alias gp="git push"
alias gpd="git push --dry-run"
alias gpf="git push --force"
alias gpl="git pull"
alias gpt="git push --tags"
alias gr="git rebase"
alias gs="git status"
alias gup="git pull --rebase"

# --- kubernetes
alias h="helm"
alias k="kubectl"
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
