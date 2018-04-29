<<<<<<< HEAD
=======
<<<<<<< HEAD
# dotfiles
=======
>>>>>>> 913ee00... add files
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

#### syntastic

    # python
    $ pip install flake8

#### jedi-vim

    $ cd ~/.vim/bundle/jedi-vim
    $ git submodule update --init
<<<<<<< HEAD
=======
>>>>>>> add files
>>>>>>> 913ee00... add files
