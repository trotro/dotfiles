#!/usr/local/bin/fish

function vi --wraps nvim --description 'alias vi=nvim'
  nvim $argv
end

function difu --wraps diff --description 'alias difu=diff -u --color'
    diff -u --color $argv
end

function ls --wraps lsd --description 'alias ls=lsd'
    lsd $argv
end

function lt --wraps lsd --description 'alias lt=lsd --tree'
  lsd --tree $argv
end

function docker --wraps podman --description 'alias docker=podman'
    podman $argv
end

function hf --wraps 'uvx hf' --description 'alias hf=uvx hf'
    uvx hf $argv
end
