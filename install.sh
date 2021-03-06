#! /bin/bash

files="vim/vimrc gitconfig"
vim_theme="dark.vim light.vim"
dotfiles=$(pwd)

#Création des symlinks vers ~
for file in $files; do
    if [ -e "$HOME/$file" ]; then
        echo "Création du symlink de $file vers ~"
        ln -s $dotfiles/$file ~/.$file
    fi
done

# Vim
if [ ! -e "$HOME/.vimrc" ]; then
    echo "Création du symlink de vim/vimrc vers ~/.vimrc"
    ln -s $dotfiles/vim/vimrc ~/.vimrc
fi
if [ ! -d "$HOME/.vim/colors" ]; then
    echo "Création du dossier vim et vim/colors"
    mkdir -p ~/.vim/colors
fi
for theme in $vim_theme; do
    if [ ! -e "$HOME/.vim/colors/$theme" ]; then
        echo "Création du symlink de $theme vers ~/.vim/colors"
        ln -s $dotfiles/vim/$theme ~/.vim/colors/$theme
    fi
done

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