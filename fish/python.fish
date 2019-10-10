#aliases
function python --wraps python --description 'alias python=python3'
  python3 $argv
end
function pip --wraps pip --description 'alias pip=pip3'
  pip3 $argv
end
