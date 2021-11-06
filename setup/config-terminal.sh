#!/usr/bin/env bash

set -euxo pipefail
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

brew install exa wget httpie adr-tools bat jq

ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
ln -s "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" /usr/local/bin/smerge

brew install antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen theme romkatv/powerlevel10k
p10k configure
