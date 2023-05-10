Install oh-my-zsh

Install miniconda



```bash
git clone git@github.com:rronan/dotfiles.git
pip install -r dotfiles/requirements.txt
ln -s ~/dotfiles/config/* ~/.config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
