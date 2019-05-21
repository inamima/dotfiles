# dotfiles

## setup rcm

```sh
brew tap thoughtbot/formulae
brew install rcm
```

## setup

```sh
cd ~
git clone git@github.com:inamima/dotfiles.git .dotfiles
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

