#Trick to open vim a the line of bug (python)
function File {
    FILE="$1"
    LINE="$3"
    nvim "${FILE:0:-1}" +"${LINE:0:-1}"
}

export EDITOR="nvim"

alias vup="nvim +PlugUpgrade +PlugUpdate"
alias zprezto="$EDITOR ~/.zprezto"
alias zshrc="$EDITOR ~/.zshrc"
alias zsource='source ~/.zshrc'


#RIP ptpb
#alias ptpb="curl -F c=@- https://ptpb.pw/ | sed '/^url:/ s/$/.jpeg/'"

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -s "^K" "^[[A"
bindkey -s "^J" "^[[B"
bindkey -s "^@" "^M"
#bindkey -s "^F" " fg^M ^M"
bindkey -s '^[z' ' ^u fg\n'

alias vim='nvim'
alias imgcat='/usr/local/bin/imgcat imgcat'

zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==1;34=1;36'

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
