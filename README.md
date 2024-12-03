Install:
```
zsh
oh-my-zsh
miniconda
neovim
tmux
```

Clone repository:
```
git clone git@github.com:rronan/dotfiles.git
ln -s ~/dotfiles/config/* ~/.config
pip install -r neovim
```

Add to `~/.zshrc`:
```
plugins=(
  git
  bundler
  macos
  zsh-history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source ~/dotfiles/aliases.zsh
```

Optional: 
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

