# Répétition des touches
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 12

# Désactive la correction auto et substitutions
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# Affiche extensions dans Finder + fichiers cachés
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true

# Permet de clicker en touchant
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Hide dock, speedup show/hide and decrease icon size
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.3"
defaults write com.apple.dock "autohide-delay" -float "0.1"
defaults write com.apple.dock "tilesize" -int "40"

# Empty bin after 30 days
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"

killall Finder
killall Dock
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
