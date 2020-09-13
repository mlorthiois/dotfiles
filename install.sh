#! /bin/bash

dotfiles=~/dotfiles
files="vimrc gitconfig" 
vim_theme="dark.vim light.vim"

#Création des symlinks vers ~
for file in $files; do
    if [ -e "$HOME/$file" ]; then
    echo "Création du symlink de $file vers ~"
    ln -s $dotfiles/$file ~/.$file
    fi
done

# Vim
if [ ! -d "$HOME/.vim/colors" ]; then
    echo "Création du dossier vim et vim/colors"
    mkdir -p ~/.vim/colors
fi
for theme in $vim_theme; do
    if [ ! -e "$HOME/.vim/colors/$theme" ]; then
        echo "Création du symlink de $theme vers ~/.vim/colors"
        ln -s $dotfiles/$theme ~/.vim/colors/$theme
    fi
done

#Création du fichier .zshrc
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Création du fichier .zshrc et ajout des 'sources'"
    touch ~/.zshrc
    echo "source ~/dotfiles/zshrc_config.zsh" >> ~/.zshrc
    echo "source ~/dotfiles/aliases" >> ~/.zshrc
    echo "source ~/dotfiles/minimal.zsh-theme" >> ~/.zshrc
    echo "source ~/dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
    echo "source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi

echo "Setup completed!"