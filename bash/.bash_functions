# Additional bash functions - source this from .bashrc if desired

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick backup of a file
backup() {
    cp "$1" "${1}.backup.$(date +%Y%m%d_%H%M%S)"
}

# Find and replace in files
findreplace() {
    if [ $# -ne 3 ]; then
        echo "Usage: findreplace <directory> <find_string> <replace_string>"
        return 1
    fi
    find "$1" -type f -exec sed -i "s/$2/$3/g" {} +
}

# Get current public IP
myip() {
    curl -s ipecho.net/plain
    echo
}