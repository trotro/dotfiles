#Enhance man pages
set -gx PAGER most
#PATH
set -gx PATH ~/.local/bin $PATH
#Enable rust and his friends
fish_add_path $HOME/.cargo/bin
