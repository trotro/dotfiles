#!/usr/local/bin/fish
#aliases
set os (uname)

# function vi --wraps nvim --description 'alias vi=nvim'
#   nvim $argv
# end

function difu --wraps diff --description 'alias difu=diff -u --color'
  diff -u --color $argv
end

#function du1 --wraps du --description 'alias du1=du -hd1 $argv | sort -h'
#  switch $os
#  case Linux
#    du -h --max-depth 1 $argv | sort -h
#  case Darwin #macOS style
#    du -hd1 $argv | sort -h
#  end
#end

function ls --wraps lsd --description 'alias ls=lsd'
  lsd $argv
end

function k --wraps kubecolor --description 'alias k=kubecolor'
  kubecolor $argv
end

# function plantuml --description 'execute plantuml $argv (installed on vscode)'
#   java -jar $HOME/.vscode/extensions/jebbs.plantuml-2.13.6/plantuml.jar $argv
# end

function docker --wraps podman --description 'alias docker=podman'
  podman $argv
end

#function dock1 --description 'ssh to dock1 server'
#  ssh trotro@dock1.trauwaen.net -p36210 -i .ssh/id_rsa_croesus
#end
