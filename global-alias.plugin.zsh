#!/usr/bin/env zsh

# global aliases
globalias() {
  if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}

zle -N globalias
bindkey " " globalias
# control-space to bypass completion
bindkey "^ " magic-space
# normal space during searches
bindkey -M isearch " " magic-space
alias -g G='|& grep -E -i'
alias -g L="| less"
alias -g X='| xargs'
alias -g X0='| xargs -0'
alias -g C='| wc -l'
alias -g A='| awk'
alias -g H='| head -n $(($LINES-5))'
alias -g T='| tail -n $(($LINES-5))'
alias -g S='| sed'
alias -g N='&> /dev/null'
alias -g XC='&> xclip -i -sel c'
# last modified(inode time) file or directory
alias -g NF="./*(oc[1])"

if [[ "$OSTYPE" == darwin* ]]; then
  # display notification
  alias ndone="osascript -e 'display notification \"Done\" with title \"Terminal\"'"
  # say 
  alias lmk="say 'Process complete'"
  # "Done" notification
  alias -g D="; ndone"
  # "Done" notification with sound
  alias -g SD="; ndone; lmk"
fi
