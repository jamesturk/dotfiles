# eval (python -m virtualfish compat_aliases)
set -g fish_greeting ""

#set PATH ~/.poetry/bin/ $PATH
set PATH ~/.bin/ $PATH
set PATH ~/.dotnet/tools $PATH
set PATH "/opt/homebrew/opt/sqlite/bin" $PATH
set PATH ~/.pyenv/shims $PATH
set PATH "/opt/homebrew/Cellar/openjdk/21.0.2/bin/" $PATH
set HOMEBREW_NO_AUTO_UPDATE 1

#source ~/.cargo/env
#source /usr/local/opt/asdf/asdf.fish
if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

# Created by `pipx` on 2022-09-13 17:47:04
set PATH $PATH /Users/jamesturk/.local/bin
set PATH $PATH ~/.cargo/bin
