#! /bin/bash

dotfiles=~/dotfiles
files="vimrc gitconfig" #Liste de tous les fichiers à déplacer
vim_theme="dark.vim light.vim"

# Vim
echo "Création du dossier vim"
mkdir ~/.vim
mkdir ~/.vim/colors

echo "Déplacement vers le dossier $dotfiles"
cd $dotfiles

#Création des symlinks vers ~
for file in $files; do
    echo "Création du symlink de $file vers ~"
    ln -s $dotfiles/$file ~/.$file
done

#Création fichier colors
echo "Déplacement vers le dossier .vim"
cd ~/.vim

#Retour dans le dossier dotfiles et création des symlinks vers .vim/colors
cd $dotfiles
for theme in $vim_theme; do
    echo "Création du symlink de $vim_theme vers ~/.vim/colors"
    ln -s $dotfiles/$theme ~/.vim/colors/$theme
done

#Création du fichier .zshrc
touch ~/.zshrc
echo "source ~/dotfiles/aliases" >> ~/.zshrc
echo "source ~/dotfiles/minimal.zsh-theme" >> ~/.zshrc
echo "source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source ~/dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

