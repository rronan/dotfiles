export EDITOR="$HOME"/nvim/bin/nvim
alias vim="nvim"

alias vup="nvim +PlugUpgrade +PlugUpdate"
alias zprezto="$EDITOR ~/.zprezto"
alias zshrc="$EDITOR ~/.zshrc"
alias zsource='source ~/.zshrc'

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -s "^K" "^[[A"
bindkey -s "^J" "^[[B"
bindkey -s "^@" "^M"
bindkey -s "^F" " fg^M ^M"
bindkey -s "^K" "^[[A"
bindkey -s "^J" "^[[B"
bindkey -s "^@" "^M"
bindkey jk vi-cmd-mode
bindkey -a " " accept-line
bindkey -s "^h" " $EDITOR $HOME/notes.txt ^M"

alias outip="curl ifconfig.me"
case "$OSTYPE" in
  linux*)   alias inip="hostname -I | cut -f1 -d ' '" ;;
  darwin*)  alias inip="Ipconfig getifaddr en0" ;;
esac
