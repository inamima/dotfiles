# dotfiles

## setup rcm

```sh
brew tap thoughtbot/formulae
brew install rcm
```

## setup

```fish
# For Fish shell
cd ~
git clone git@github.com:inamima/dotfiles.git .dotfiles
set RCRC dotfiles/rcrc
rcup
```

```bash
# For Bash/Zsh
cd ~
git clone git@github.com:inamima/dotfiles.git .dotfiles
export RCRC="$HOME/dotfiles/rcrc"
rcup
```

## setup neovim

### vim-plug

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim
:PlugInstall
```

## setup vim

### vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim
:PlugInstall
```

### vimproc

```
cd ~/.vim/bundle/vimproc
make -f make_unix.mak
```

