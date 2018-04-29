dotfiles
========

setup
-----

    $ git clone git@github.com:inamima/dotfiles.git ~/
    $ cd dotfiles
    $ ./install.sh

#### vim-plug

    $curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ vim
    $ PlugInstall

#### vimproc

    $ cd ~/.vim/bundle/vimproc
    $ make -f make_unix.mak
