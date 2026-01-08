#Enhance man pages
set -gx PAGER most
#PATH
#set -gx PATH $HOME/.local/bin $PATH
fish_add_path $HOME/.local/bin
#Enable rust and his friends
#set -gx PATH $HOME/.cargo/bin $PATH
fish_add_path $HOME/.cargo/bin
#Add openjdk
# fish_add_path /usr/local/opt/openjdk/bin

