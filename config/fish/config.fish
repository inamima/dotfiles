set -x PATH /opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin/ $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.poetry/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

set -x AWS_SESSION_TOKEN_TTL 12h

set -x BAT_THEME "Solarized (light)"

# for vscode
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

alias d="docker"
alias dc="docker-compose"
alias tf="terraform"

function fish_user_key_bindings
    # peco
    bind \cgr peco_select_history
    # ghq
    bind \cgg ghq_repo_search
    # ssh
    bind \cgs peco_ssh_connect
    # aws sso login
    bind \cga peco_aws_sso_login
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

starship init fish | source
