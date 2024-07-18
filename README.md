# Personnal dotfiles

Main repository to setup PDE.

## Install

Clone this repo:

```sh
git clone git@github.com:mlorthiois/dotfiles.git $HOME/dotfiles
```

Ensure stow is available and run.

```sh
stow .
```



To install zsh extensions:

```sh
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.local/share/zsh/zdharma-continuum/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.local/share/zsh/zsh-users/zsh-autosuggestions
```

To install lazy.nvim:

```sh
git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git $HOME/.local/share/nvim/lazy/lazy.nvim
```

## Main tools

- Kitty as terminal emulator
- neovim as code editor
- zsh as shell
- JetBrains Mono Nerd Font
