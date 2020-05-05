#! /bin/bash

dotfiles=~/dotfiles
files="vimrc gitconfig" #Liste de tous les fichiers à déplacer
vim_theme="dark.vim light.vim"
# cd vers le dossier dotfiles
echo "Déplacement vers le dossier $dotfiles"
cd $dotfiles

#Création des symlinks vers ~
for file in $files; do
    echo "Création du symlink de $file vers ~"
    ln -s $dotfiles/$file ~/.$file
done

#Création du symlink zshrc
ln -s ~/dotfiles/linux-zshrc ~/.zshrc

#Création fichier colors
echo "Déplacement vers le dossier .vim"
cd ~/.vim
echo "Création du dossier colors"
mkdir colors

#Retour dans le dossier dotfiles et création des symlinks vers .vim/colors
cd $dotfiles
for theme in $vim_theme; do
    echo "Création du symlink de $vim_theme vers ~/.vim/colors"
    ln -s $dotfiles/$theme ~/.vim/colors/$theme
done
