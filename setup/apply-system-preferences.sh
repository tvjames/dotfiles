#!/usr/bin/env bash

set -euxo pipefail

## Thanks to: 
## https://github.com/mathiasbynens/dotfiles/blob/master/.macos
## https://gist.github.com/tylerwalts/9375263

osascript -e 'tell application "System Preferences" to quit'


# Sharing
## Computer Name (prompt)

# General 
## Highlight color - orange
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.874510 0.701961"
## Sidebar - medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2


# Dock
## Small
## Min using Scale
## Double Click Zoom
## Dock - min into app icon
## Dock - animate off
## Dock - open indicators
## Dock - show recent off
# Mission Control
## Auto arrange off
## Switch to space with open windows
## Group by applicaitonoff
## Dispalys ahev separate spaces
## Dashboard off
## Keyboard Mission control: ^Up
## Keyboard Application windows: ^Down
## Keybaord all others off
## Hot Corners 
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
## App Windows                     Desktop
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tr-corner -int 4
## Start Screen Saver (Lock)       Mission Control
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-br-corner -int 2


# Keyboard
## Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Trackpad
## lookup: force click one finger
## sec click: two fingers
## tap to click off
## scroll dir natural: off
defaults write -g com.apple.swipescrolldirection -bool NO
## zoom: off
## smart zoom: on
## rotate: on
## swipe pages: off
## swipe full screen: off
## notif centre: on
## mission: off
## app expose: off
## launchpad: off
## desktop: off



# Finder
echo " Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo " Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo " Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo " Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: icnv, clmv, Flwv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
