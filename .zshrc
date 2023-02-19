#sxhkd -c $HOME/.config/sxhkd/sxhkdrc &

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


export EDITOR=nvim
export TERM=st
export COLORTERM="truecolor"
export PATH="/home/adetabrani/.cargo/bin:$PATH"
export PATH="/home/adetabrani/.local/bin:$PATH"
export PATH="/home/adetabrani/go/bin:$PATH"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
    --color=border:#81a1c1
    --preview-window=up,70%
    --layout=reverse
    --border
    --padding=0.5%
    --margin=0.5%'
export BAT_CONFIG_PATH="/home/adetabrani/.config/bat/bat.conf"

# list alias
alias vim="nvim"
alias ls="lsd"
alias mpv="umpv"
alias lf="lfub"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"
