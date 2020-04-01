#!/usr/local/bin/fish
#aliases
set os (uname)

function vi --wraps nvim --description 'alias vi=nvim'
  nvim $argv
end

function difu --wraps diff --description 'alias difu=diff -u --color'
  diff -u --color $argv
end

function du1 --wraps du --description 'alias du1=du -hd1 $argv | sort -h'
  switch $os
  case Linux
    du -h --max-depth 1 $argv | sort -h
  case Darwin #macOS style
    du -hd1 $argv | sort -h
  end
end

function plantuml --description 'execute plantuml $argv (installed on vscode)'
  java -jar $HOME/.vscode/extensions/jebbs.plantuml-2.13.6/plantuml.jar $argv
end
