#! /bin/bash

files="gitconfig tmux.conf"
dotfiles=$(pwd)

# Symlink of files into ~
for file in $files; do
  if [ -e "$HOME/$file" ]; then
      echo "Symlink of $file to ~"
      ln -s $dotfiles/$file ~/.$file
  fi
done

# Symlinks for dir in ~/.config
config_dirs="nvim kitty"
for dir in $config_dirs; do
  if [ ! -d "$HOME/.config/$dir" ]; then
    echo "Symlink of $dir config to ~/.config/$dir"
    ln -s $dotfiles/$dir ~/.config
  fi
done

# Add dependencies for .zshrc
if [ ! -f "$HOME/.zshrc" ]; then
  echo "Creating .zshrc file"
  touch ~/.zshrc
fi
if ! grep -q "source ~/dotfiles/zsh/zshrc_config.zsh" $HOME/.zshrc; then
  echo "Add zshrc_config.zsh in .zshrc"
  echo "source ~/dotfiles/zsh/zshrc_config.zsh" >>$HOME/.zshrc
fi

# Install zsh plugins
plugins="zsh-syntax-highlighting zsh-autosuggestions"
for plugin in $plugins; do
  if [ ! -d "$HOME/.zsh/$plugin/" ]; then
    echo "Installing $plugin"
    mkdir -p $HOME/.zsh
    cd $HOME/.zsh
    git clone https://github.com/zsh-users/$plugin.git
  fi
done
cd $dotfiles
echo "Setup completed!"
