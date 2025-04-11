#Enhance man pages
# set -gx PAGER most
#PATH
set -gx PATH $HOME/.local/bin $PATH
#Enable rust and his friends
fish_add_path $HOME/.cargo/bin
#Add openjdk
# fish_add_path /usr/local/opt/openjdk/bin
#Enable gcloud
source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
