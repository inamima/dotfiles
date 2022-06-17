set -x PATH /usr/local/bin/ $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.poetry/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

alias d="docker"
alias dc="docker-compose"

function fish_user_key_bindings
    # peco
    bind \cr peco_select_history
    # ghq
    bind \cg ghq_repo_search
end

# tig
function tiga
    tig --all
end

# tmux
function tmux
    command tmux -2 $argv
end

# aws-vault
function avt
    aws-vault exec $USER -- $argv
end
