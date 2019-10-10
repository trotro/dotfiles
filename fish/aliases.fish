#aliases
function difu --wraps diff --description 'alias difu=diff -u --color'
  diff -u --color $argv
end
function du1 --wraps du --description 'alias du1=du -h --max-depth 1 $argv | sort -h'
  du -h --max-depth 1 $argv | sort -h
end
function plantuml --description 'execute plantuml $argv (installed on vscode)'
  java -jar ~/.var/app/com.visualstudio.code/data/vscode/extensions/jebbs.plantuml-2.12.1/plantuml.jar $argv
end
