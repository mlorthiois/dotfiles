UNAME := $(shell uname)
DOTFILES_PATH := $(CURDIR)

##################################
# FINAL
##################################
.PHONY: all dotfiles home xdg_config macos_settings brew-install
all: dotfiles macos_settings zsh-plugins lazy.nvim homebrew

# Copy dotfiles to right location
dotfiles: home xdg_config

##################################
# SIMPLE DOT FILES
##################################
$(HOME)/.%: $(DOTFILES_PATH)/%
	ln -sf $< $@

git: $(HOME)/.gitconfig $(HOME)/.gitignore
zsh: $(HOME)/.zshrc

home: git zsh

##################################
# XDG_CONFIG_HOME
##################################
$(HOME)/.config/%: $(DOTFILES_PATH)/%
	@mkdir -p $(HOME)/.config
	ln -sf $< $@

nvim: $(HOME)/.config/nvim
lazygit: $(HOME)/.config/lazygit
k9s: $(HOME)/.config/k9s
zsh: $(HOME)/.config/zsh
ghostty: $(HOME)/.config/ghostty
starship: $(HOME)/.config/starship.toml

xdg_config: nvim lazygit k9s zsh ghostty starship


##################################
# BIN
##################################
$(HOME)/.local/bin/%: $(DOTFILES_PATH)/bin/%
	@mkdir -p $(HOME)/.local/bin
	@chmod +x $<
	ln -sf $< $@

bin: $(HOME)/.local/bin/extract $(HOME)/.local/bin/tfdoc $(HOME)/.local/bin/tfstate

##################################
# ZSH Plugins
##################################
$(HOME)/.local/share/zsh/%:
	mkdir -p "$HOME/.local/share/zsh"
	git clone --depth 1 "https://github.com/$*" $@


zsh-autosuggestions: $(HOME)/.local/share/zsh/zsh-users/zsh-autosuggestions
zsh-syntax-highlighting: $(HOME)/.local/share/zsh/zdharma-continuum/fast-syntax-highlighting

zsh-plugins: zsh-autosuggestions zsh-syntax-highlighting

##################################
# Misc.
##################################
$(HOME)/.local/share/nvim/lazy/lazy.nvim:
	mkdir -p $(HOME)/.local/share/nvim/lazy
	git clone --filter=blob:none --branch=stable "https://github.com/folke/lazy.nvim.git" $@

lazy.nvim: $(HOME)/.local/share/nvim/lazy/lazy.nvim

##################################
# Homebrew
##################################
/opt/homebrew/bin/brew:
	@echo "Installing Homebrew..."
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew-install: Brewfile
	@$$(/opt/homebrew/bin/brew shellenv)
	brew bundle --file=$<

ifeq ($(UNAME),Darwin)
homebrew: /opt/homebrew/bin/brew brew-install
else
homebrew:
	@echo "Cette commande ne s'exécute que sur macOS."
endif

##################################
# MacOS Settings
##################################
ifeq ($(UNAME),Darwin)
macos_settings:
	@# Répétition des touches
	defaults write -g KeyRepeat -int 2
	defaults write -g InitialKeyRepeat -int 12

	@# Désactive la correction auto et substitutions
	defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
	defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
	defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

	@# Affiche extensions dans Finder + fichiers cachés
	defaults write -g AppleShowAllExtensions -bool true
	defaults write com.apple.finder AppleShowAllFiles -bool true

	@# Permet de clicker en touchant
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

	@# Hide dock, speedup show/hide and decrease icon size
	defaults write com.apple.dock "autohide" -bool "true"
	defaults write com.apple.dock "autohide-time-modifier" -float "0.3"
	defaults write com.apple.dock "autohide-delay" -float "0.1"
	defaults write com.apple.dock "tilesize" -int "40"

	@# Empty bin after 30 days
	defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"

	@killall Finder
	@killall Dock
	@/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
else
macos_settings:
	@echo "Cette commande ne s'exécute que sur macOS."
endif
