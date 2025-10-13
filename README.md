Install:
```
zsh
oh-my-zsh
neovim
```

Install `zsh` plugins:
```
for PLUGIN in zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting; do
    git clone https://github.com/zsh-users/"$PLUGIN".git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/"$PLUGIN"
done
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
```

Install `vim-plug`:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Clone repository:
```
git clone git@github.com:rronan/dotfiles.git
ln -s ~/dotfiles/config/* ~/.config
```

Source `aliases.zsh` in `~/.zshrc`:
```
echo "source ~/dotfiles/aliases.zsh" >> .zshrc
```
