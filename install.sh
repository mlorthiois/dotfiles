#! /bin/bash

files="gitconfig"
dotfiles=$(pwd)

#Création des symlinks vers ~
for file in $files; do
    if [ -e "$HOME/$file" ]; then
        echo "Création du symlink de $file vers ~"
        ln -s $dotfiles/$file ~/.$file
    fi
done

# Neovim
if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Création du symlink de nvim vers ~/.config/nvim"
    ln -s $dotfiles/nvim ~/.config
fi

#Création du fichier .zshrc
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Création du fichier .zshrc et ajout des 'sources'"
    touch ~/.zshrc
fi

if ! grep -q "source ~/dotfiles/zshrc_config.zsh" $HOME/.zshrc; then
    echo "Add zshrc_config.zsh in .zshrc"
    echo "source ~/dotfiles/zshrc_config.zsh" >>$HOME/.zshrc
fi

echo "Setup completed!"
