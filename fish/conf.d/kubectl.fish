#!/usr/local/bin/fish

# Activate krew plugins
set -gx PATH $PATH $HOME/.krew/bin

# This needs to be added before "function ... --wraps kubectl"
#set k8s (whereis kubectl | cut -d' ' -f2)
#command $k8s completion fish | source
# Dunno why this is not working

# reuse "kubectl" completions on "kubecolor"
function kubecolor --wraps kubectl
    command kubecolor $argv
end

# adds alias for "kubectl" to "kubecolor" with completions
function kubectl --wraps kubectl
    command kubecolor $argv
end

# adds alias for "k" to "kubecolor" with completions --description 'alias k=kubecolor'
function k --wraps kubectl
    command kubecolor $argv
end
