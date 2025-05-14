# Personnal dotfiles

Main repository to setup PDE.

## Install

### Setup ssh key for GitHub

Follow [this guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac)

### Steps

Clone this repo:

```sh
git clone git@github.com:mlorthiois/dotfiles.git $HOME/dotfiles
```

```sh
bash link.sh

# Install homebrew
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# On macOS
brew bundle --file="$HOME/dotfiles/Brewfile"

# Install zsh plugins
plugins="zsh-users/zsh-autosuggestions zdharma-continuum/fast-syntax-highlighting"
for plugin in $plugins; do
	if [ ! -d "$HOME/.local/share/zsh/$plugin/" ]; then
		echo "Installing $plugin"
		mkdir -p "$HOME/.local/share/zsh"
		git clone --depth 1 "https://github.com/$plugin" "$HOME/.local/share/zsh/$plugin"
	fi
done

# Install Lazy.nvim
git clone --filter=blob:none --branch=stable "https://github.com/folke/lazy.nvim.git" "$HOME/.local/share/nvim/lazy/lazy.nvim"
```

## Main tools

- Ghostty as terminal emulator
- neovim as code editor
- zsh as shell
- JetBrains Mono Nerd Font
- Starship as shell prompt env
