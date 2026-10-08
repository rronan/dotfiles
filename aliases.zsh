export EDITOR=nvim
export ZVM_VI_EDITOR="nvim"
alias vim=nvim

# zsh-vi-mode initializes lazily (on first prompt) and resets the keymaps,
# so custom bindings must be applied in its after-init hook.
zvm_after_init() {
    bindkey -M vicmd "k" history-substring-search-up
    bindkey -M vicmd "j" history-substring-search-down
    bindkey -s "^F" " fg^M ^M"
    bindkey -s "^@" "^M"
    # bindkey jk vi-cmd-mode
    bindkey -a " " accept-line
}

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# aliases.zsh is sourced after oh-my-zsh loads zsh-vi-mode, so the zvm_config
# hook would fire too late. Set the var directly: zvm_zle-line-init re-reads it
# on every prompt (after a command finishes and after ^C), so this is enough.
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT


setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

sq() {
  local cols=${COLUMNS:-$(tput cols)}
  local namew=$(( cols - 10 - 4 - 4 - 11 - 4 - 6 - 6 - 16 - 11 - 3 ))   # -11 PRIO, -11 TIME, -16 REASON, -3 headers
  (( namew < 10 )) && namew=10
  squeue --me --format="%i|%P|%.5q|%Q|%j|%t|%b|%M|%D|%R" | \
    awk -F'|' -v nw="$namew" '
      NR==1 { $7="GPU" }
      NR==1 { $2="PART" }
      NR==1 { $4="PRIO" }
      NR==1 { $10="REASON" }
      NR>1  { n=$7; sub(/.*:/,"",n); n=(n~/^[0-9]+$/?n:0); $7=n*$9   # per-node gpus * nodes
              if (length($5)>nw) $5=substr($5,1,nw) }
      { print $1"|"$2"|"$3"|"$4"|"$5"|"$6"|"$8"|"$7"|"$10 }' | \
    column -t -s'|'
}
# zsh can't export functions, and `sq` is invisible to a child bash/zsh,
# so inline its definition into the shell that `watch` spawns.
wsq() { command watch -n 5 -x zsh -c "COLUMNS=\$(tput cols); $(functions sq); sq" }

gwa() {
    git worktree add ~/$1 ronan.riochet/$1
}

gwab() {
    git worktree add ~/$1 -b ronan.riochet/$1
}
