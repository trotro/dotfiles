#GOP vpn with openvpn
function gopvpn --description 'GOP vpn with openvpn'
  sudo openvpn ~/Documents/n_trauwaen@fgopsafe.groupeonepoint.com.ovpn
end

#pier39 aliases and functions
#bastion connections
function bastionp39fr --description 'connection to bastion.pier39.fr'
  ssh -i ~/.ssh/id_ecdsa_gop n.trauwaen@bastion.pier39.fr
end

function bastionp39tools --description 'connection to bastion.pier39.tools'
  ssh -i ~/.ssh/id_ecdsa_gop root@bastion.pier39.tools
end

#local test env
function pier39dev --description 'pier39 dev'
  cd ~/pier39
  . ./bin/activate.fish
  virsh start centos701
  virsh start centos702
end
