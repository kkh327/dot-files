if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Environment
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux TERM xterm-256color
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# Aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias python="python3"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias cat="batcat"

# zoxide
zoxide init fish | source

# Homebrew
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source

# oh-my-posh
oh-my-posh init fish --config "/mnt/c/Program Files (x86)/oh-my-posh/themes/avit.omp.json" | source

