Install zsh:
```bash
sudo apt-get update
sudo apt -u install tmux
sudo apt-get install neovim
sudo apt-get install zsh
sh -s /bin/zsh
```

Install miniconda

Install neovim:
```bash
git clone git@github.com:rronan/dotfiles.git
pip install -r dotfiles/requirements.txt
ln -s ~/dotfiles/config/* ~/.config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
