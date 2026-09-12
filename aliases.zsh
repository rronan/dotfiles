export EDITOR=nvim
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

sq() {
  local cols=${COLUMNS:-$(tput cols)}
  local namew=$(( cols - 10 - 4 - 4 - 11 - 4 - 6 - 6 - 11 - 3 ))   # -11 PRIO, -11 TIME, -3 headers
  (( namew < 10 )) && namew=10
  squeue --me --format="%i|%P|%.5q|%Q|%j|%t|%b|%M" | \
    awk -F'|' -v nw="$namew" '
      NR==1 { $7="GPU" }
      NR==1 { $2="PART" }
      NR==1 { $4="PRIO" }
      NR>1  { n=$7; sub(/.*:/,"",n); $7=(n~/^[0-9]+$/?n:0)
              if (length($5)>nw) $5=substr($5,1,nw) }
      { print $1"|"$2"|"$3"|"$4"|"$5"|"$6"|"$8"|"$7 }' | \
    column -t -s'|'
}
# zsh can't export functions, and `sq` is invisible to a child bash/zsh,
# so inline its definition into the shell that `watch` spawns.
wsq() { command watch -n 5 -x zsh -c "COLUMNS=\$(tput cols); $(functions sq); sq" }
