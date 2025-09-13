# interactive git log viewer with fzf
fzf-git-log() {
  local filter
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  git log \
    --graph --color=always --abbrev=7 --format='%C(auto)%h %an %C(blue)%s %C(yellow)%cr' $@ | \
    fzf \
      --ansi --no-sort --reverse --tiebreak=index \
      --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}" \
      --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF" \
      --preview-window=right:60% \
      --height 80%
}

# fh - repeat history
fzf-history() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# make dir and immediately cd into into it
function mkd {
  local flags=()
  local positional=()
  local cd_flag=0
    
  while (( $# )); do
    case $1 in
      -c)   cd_flag=1 ;;
      -*)   flags+=("${@[@]}") ;;
       *)   positional+=("${@[@]}"); break ;;
    esac
    shift
  done

  local dname="${positional[@]}"

  if [ ! -z "$cd_flag" ]; then
     mkdir ${flags[@]} $dname && z $dname
  else
     mkdir ${flags[@]} $dname 
  fi
}
