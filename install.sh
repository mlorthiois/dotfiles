#! /bin/bash

dotfiles=$(pwd)

# Symlinks for file/dir placed in $HOME/
files="gitconfig tmux.conf"
for file in $files; do
	if [ -e "$HOME/$file" ]; then
		echo "Symlink of $file to ~"
		ln -s "$dotfiles/$file" "$HOME/.$file"
	fi
done

# Symlinks for file/dir placed in $HOME/.config
configs="nvim kitty black"
for config in $configs; do
	if [ ! -d "$HOME/.config/$config" ] && [ ! -f "$HOME/.config/$config" ]; then
		echo "Symlink of $config config to ~/.config/$config"
		ln -s "$dotfiles/$config" "$HOME/.config"
	fi
done

# Dependencies for .zshrc
if [ ! -f "$HOME/.zshrc" ]; then
	echo "Creating .zshrc file"
	touch ~/.zshrc
fi
if ! grep -q "source ~/dotfiles/zsh/zshrc_config.zsh" "$HOME/.zshrc"; then
	echo "Add zshrc_config.zsh in .zshrc"
	echo "source ~/dotfiles/zsh/zshrc_config.zsh" >>"$HOME/.zshrc"
fi

# Install zsh plugins
plugins="zsh-users/zsh-autosuggestions zdharma-continuum/fast-syntax-highlighting"
for plugin in $plugins; do
	if [ ! -d "$HOME/.zsh/$plugin/" ]; then
		echo "Installing $plugin"
		mkdir -p "$HOME/.zsh"
		cd "$HOME/.zsh" || exit
		git clone --depth 1 "https://github.com/$plugin" "$plugin"
	fi
done

echo "Setup completed!"
