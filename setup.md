Install zsh:
```bash
sudo apt-get update
sudo apt -u install tmux
sudo apt-get install zsh
sh -s /bin/zsh
```

```zsh```

Setup prezto:
```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```


Install miniconda:
```bash
wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
-O ~/miniconda.sh && \
zsh ~/miniconda.sh -b -p ~/conda && \
rm ~/miniconda.sh && \
echo ". ~/conda/etc/profile.d/conda.sh" >> ~/.zshrc && \
echo "conda activate base" >> ~/.zshrc && \
source .zshrc && \
conda update --all -y
conda create -n py36 python=3.6
conda activate py36
```



Install neovim:
```bash
sudo apt-get install neovim
git clone git@github.com:rronan/dotfiles.git
pip install -r dotfiles/requirements.txt
ln -s ~/dotfiles/config/* ~/.config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


```bash
echo "
alias vim=/usr/bin/nvim
conda activate py36
" >> /home/ronan/.zshrc
```


