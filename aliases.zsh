export EDITOR=nvim
alias vim=nvim

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
