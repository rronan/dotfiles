export EDITOR="$HOME"/nvim.appimage
alias vim="$HOME"/nvim.appimage
alias nvim="$HOME"/nvim.appimage

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
bindkey -s "^F" " fg^M ^M"
bindkey -s "^g" " nvim $HOME/notes.txt ^M"
bindkey -s "^K" "^[[A"
bindkey -s "^J" "^[[B"
bindkey -s "^@" "^M"
bindkey jk vi-cmd-mode
bindkey -a " " accept-line

#Trick to open vim a the line of bug (python)
function File {
    FILE="$1"
    LINE="$3"
    "$EDITOR" "${FILE:0:-1}" +"${LINE:0:-1}"
}
alias imgcat='/usr/local/bin/imgcat imgcat'

# Git related
gg() {
    if [ -n "$1" ]
    then
        git --no-pager log -"$1" --graph --all --pretty=format:'%C(red)%h%Creset -%C(yellow)%d%Creset %C(blue)%an%Creset %s %C(green)(%cr)%Creset' --abbrev-commit --date=relative
    else
        git --no-pager log --graph --all --pretty=format:'%C(red)%h%Creset -%C(yellow)%d%Creset %C(blue)%an%Creset %s %C(green)(%cr)%Creset' --abbrev-commit --date=relative
    fi
}
gp() {
    if [ -n "$1" ] 
    then
        MESSAGE="$1"
    else
        MESSAGE="WIP"
    fi
    git commit -m "$MESSAGE"
    git pull --all --prune
}
gpp() {
    if [ -n "$1" ] 
    then
        MESSAGE="$1"
    else
        MESSAGE="WIP"
    fi
    git commit -m "$MESSAGE"
    git pull --all --prune --rebase
    git push
}



