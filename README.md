Install zsh:
```bash
sudo apt-get update
sudo apt -u install tmux
sudo apt-get install zsh
sh -s /bin/zsh
```

```zsh```

Install miniconda:
```bash
wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
-O ~/miniconda.sh && \
zsh ~/miniconda.sh -b -p ~/conda && \
rm ~/miniconda.sh && \
echo ". ~/conda/etc/profile.d/conda.sh" >> ~/.zshrc && \
echo "conda activate base" >> ~/.zshrc
```

OR

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
```


Install neovim:
```bash
sudo apt-get install neovim
git clone git@github.com:rronan/dotfiles.git
pip install -r dotfiles/requirements.txt
ln -s ~/dotfiles/config/* ~/.config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
