#! /bin/bash

dotfiles=~/dotfiles
files="vimrc zshrc" #Liste de tous les fichiers à déplacer

# cd vers le dossier dotfiles
echo "Déplacement vers le dossier $dotfiles"
cd $dotfiles

#Création des symlinks vers ~
for file in $files; do
    echo "Création du symlink de $file vers ~"
    ln -s $dotfiles/$file ~/.$file
done


