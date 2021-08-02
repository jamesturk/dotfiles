# eval (python -m virtualfish compat_aliases)
set -g fish_greeting ""

set PATH ~/.poetry/bin/ $PATH
set PATH ~/.bin/ $PATH
set HOMEBREW_NO_AUTO_UPDATE 1
pyenv init - | source

source ~/.cargo/env
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

source /usr/local/opt/asdf/asdf.fish
