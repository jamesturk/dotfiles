# eval (python -m virtualfish compat_aliases)
set -g fish_greeting ""

set PATH ~/.poetry/bin/ $PATH
set PATH ~/.bin/ $PATH
set PATH ~/.dotnet/tools $PATH
set HOMEBREW_NO_AUTO_UPDATE 1

source ~/.cargo/env
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
source /usr/local/opt/asdf/asdf.fish
