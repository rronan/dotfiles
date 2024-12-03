export EDITOR=/usr/local/bin/nvim
alias vim=nvim

bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down
bindkey -s "^F" " fg^M ^M"
bindkey -s "^@" "^M"
bindkey jk vi-cmd-mode
bindkey -a " " accept-line

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
