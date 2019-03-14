set -x PATH $HOME/.cargo/bin $PATH

#peco
function fish_user_key_bindings
    bind \cr peco_select_history
    bind \cg\cb peco_select_git_branch
end

# tig
function tiga
    tig --all
end

# tmux
function tmux
    command tmux -2 $argv
end
