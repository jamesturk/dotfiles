function ts-local --wraps='sudo tailscale set --exit-node=' --description 'alias ts-local=sudo tailscale set --exit-node='
  sudo tailscale set --exit-node= $argv
        
end
