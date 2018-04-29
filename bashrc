# bashrc

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# golang
export PATH=$HOME/go/bin:$PATH


#インタラクティブシェルのときだけ exec fish
case $- in
    *i*) exec fish;;
      *) return;;
esac
