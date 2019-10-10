#GOP vpm
function gopvpn --description 'GOP vpn'
  sudo openvpn ~/Documents/n_trauwaen@fgopsafe.groupeonepoint.com.ovpn
end

#pier39 aliases and functions
function pier39dev --description 'pier39 dev'
  cd ~/pier39
  . ./bin/activate.fish
  virsh start centos701
  virsh start centos702
end
function pier39tools --description 'pier39 tools'
  if tmux has-session -t "pier39_tools"; then
    exec tmux attach-session -t "pier39_tools"
  else
    tmux new-session -s "pier39_tools"
  end
end
