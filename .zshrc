sxhkd -c $HOME/.config/sxhkd/sxhkdrc &

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
   	#alias vdir='vdir --color=auto'

   	#alias grep='grep --color=auto'
   	#alias fgrep='fgrep --color=auto'
   	#alias egrep='egrep --color=auto'
fi

PROMPT='%B%F{226}%~%f ->%b '

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

#add vim keybinding
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
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

export EDITOR=nvim
export TERM=st
export PATH="/home/adetabrani/.cargo/bin:$PATH"
export PATH="/home/adetabrani/.local/bin:$PATH"

# list alias
alias vim="nvim"
alias ls="lsd"
alias mpv="umpv"
alias lf="lfub"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"


