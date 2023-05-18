fpath+=${ZDOTDIR:-~}/.zsh_functions

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.histfile

setopt HIST_IGNORE_ALL_DUPS

# Basic auto/tab complete:
autoload -U compinit; 
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# add vim keybinding
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^R' history-incremental-search-backward

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


lfcd () {
    tmp="$(mktemp -uq)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -a '^[[3~' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Ctrl+R to search history with dmenu
dmenu-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  # selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' | awk '{$1=""}1' |
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    dmenu -i) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
[ -n "$DISPLAY" ] &&
  zle     -N   dmenu-history-widget &&
  bindkey '^R' dmenu-history-widget


export EDITOR="nvim"
# export TERM="st-256color"
export COLORTERM="truecolor"
export PATH="/home/adetabrani/.cargo/bin:$PATH"
export PATH="/home/adetabrani/go/bin:$PATH"
export PATH="/home/adetabrani/.local/bin:$PATH"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --preview-window=up,70%
    --layout=reverse
    --padding=0.5%'
    # --color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1
    # --color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1
    # --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    # --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
    # --color=border:#81a1c1
    # --margin=0.5%
    # --border
export BAT_CONFIG_PATH="/home/adetabrani/.config/bat/bat.conf"
export OPENCV_LOG_LEVEL=OFF

alias vim="nvim"
alias lf="lfub"
alias ls="lsd -l"
alias mpv="umpv"
alias fzf="fd --type f --hidden --exclude .git | fzf --preview 'bat {}'"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse --preview 'bat {}' | xargs nvim"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"

# Make zsh zsh-syntax-highlighting work well with pywal
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=250'

(cat ~/.cache/wal/sequences &)
