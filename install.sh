#! /bin/bash

files="vimrc gitconfig"
vim_theme="dark.vim light.vim"
zsh_plugins="zsh-autosuggestions zsh-syntax-highlighting"
zsh_config="minimal zshrc_config aliases"

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
fi
for config in $zsh_config; do
    if ! grep -q "source ~/dotfiles/$config.zsh" $HOME/.zshrc; then
        echo "source ~/dotfiles/$config.zsh" >>$HOME/.zshrc
    fi
done
for plugin in $zsh_plugins; do
    if ! grep -q "source ~/dotfiles/$plugin/$plugin.zsh" $HOME/.zshrc; then
        echo "source ~/dotfiles/$plugin/$plugin.zsh" >>$HOME/.zshrc
    fi
done
echo "Setup completed!"
