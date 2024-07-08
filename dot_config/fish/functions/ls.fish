function ls --wraps='eza --git --total-size' --description 'alias ls eza --git --total-size'
  eza --git --total-size $argv; 
end
