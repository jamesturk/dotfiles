function ghweb --wraps='gh repo view --web' --description 'alias ghweb gh repo view --web'
  gh repo view --web $argv; 
end
