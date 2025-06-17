if status is-interactive
    # Commands to run in interactive sessions can go here
    /opt/homebrew/bin/brew shellenv | source
    mise activate fish | source
    direnv hook fish | source
    starship init fish | source
    macchina
else
    mise activate fish --shims | source
end
