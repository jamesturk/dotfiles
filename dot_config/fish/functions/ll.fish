function ll --wraps='eza -l --git --total-size' --description 'alias ls eza --git --total-size -l'
    eza --git --total-size -l $argv
end
