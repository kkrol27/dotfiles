
# Enable colors
autoload -Uz colors && colors

# Configure the history files
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$ZDOTDIR/history"

# Update zsh completions
#fpath=(path/to/zsh-completions/src $fpath) 

# Basic auto/tab completion (including hidden files)
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Control key bindings
function kkrol::to_vim() {
  BUFFER=""
  zle accept-line
}
zle -N kkrol::to_vim
bindkey "^v" kkrol::to_vim

# VI mode
bindkey -v
export KEYTIMEOUT=1

# Adjust cursor depending on mode
# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52#file-zshrc-L30
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt

# Aliases and prompt
source "$ZDOTDIR/aliasesrc"
source "$ZDOTDIR/promptrc"

# Enable autosuggestions and syntax highlighting
bindkey '^x' autosuggest-accept
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

