#! /bin/bash

# Install homebrew
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing softwares..."
brew install --cask brave-browser kitty spotify discord raycast rectangle
# beekeeper-studio firefox vlc

brew install bat black fd fzf neovim ripgrep tree zsh stylua pyright lua-language-server
# wget shellcheck gh go htop jq node pandoc shfmt tmux

if ! command -v conda &>/dev/null; then
	echo "Installing miniconda3"
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
	bash ~/miniconda.sh -b -p miniconda
	echo "miniconda3 installed successfully"
fi

echo "Setup for macOS completed!"
