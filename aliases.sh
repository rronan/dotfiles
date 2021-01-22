export EDITOR="$HOME"/nvim/bin/nvim
alias vim="$HOME"/nvim/bin/nvim
alias nvim="$HOME"/nvim/bin/nvim

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
bindkey -s "^l" " pybp ^m"
bindkey -s "^h" " $EDITOR $HOME/notes.txt ^M"

alias python='python $@ 2> >(tee >(cat | grep "^ *File" | sed "s/ *File/vim/g" | sed "s/, line / +/g" | sed "s/, in .*//g" | sed -E  "s: \"([^/]): \"$PWD/\1:g" 1>! /tmp/python.breakpoints))'


