if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -x (brew --prefix 2>/dev/null)/bin/brew
        eval ((brew --prefix)/bin/brew shellenv)
    end
    mise activate fish | source
    if command -q tirith
        tirith init | source
    end
    starship init fish | source
    source ~/.credentials
else
    mise activate fish --shims | source
    if command -q tirith
        tirith init | source
    end
end
