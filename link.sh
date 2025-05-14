#! /bin/bash

set -eu

DOTFILES=$(pwd)

HOME_CONFIG=(
    "zshrc"
    "gitconfig"
    "gitignore"
)

LOCAL_CONFIG=(
    "nvim"
    "lazygit"
    "k9s"
    "zsh"
    "ghostty"
    "starship.toml"
)

BIN_FILES=(
    "extract"
    "tfdoc"
    "tfstate"
)

for file in "${HOME_CONFIG[@]}"; do
  	if [ ! -e "$HOME/.$file" ]; then
        echo "Symlink of $file to ~"
        ln -s "$DOTFILES/$file" "$HOME/.$file"
    fi
done

mkdir -p "$HOME/.config"
for config in "${LOCAL_CONFIG[@]}"; do
	if [ ! -d "$HOME/.config/$config" ] && [ ! -f "$HOME/.config/$config" ]; then
		echo "Symlink of $config config to ~/.config/$config"
		ln -s "$DOTFILES/$config" "$HOME/.config/"
	fi
done

mkdir -p "$HOME/.local/bin"
for bin in "${BIN_FILES[@]}"; do
    if [ ! -e "$HOME/.local/bin/$bin" ]; then
        echo "Symlink of $bin config to ~/.local/bin/$bin"
        chmod +x "bin/$bin"
        ln -s "$DOTFILES/bin/$bin" "$HOME/.local/bin/$bin"
    fi
done
