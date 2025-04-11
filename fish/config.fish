if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
    eval "$(/Users/n.trauwaen/.local/bin/mise activate fish)"
    starship init fish | source
end
