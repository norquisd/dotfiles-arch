#!/bin/bash

DOTFILES="/home/quinn/.dotfiles"

# neovim
ln -s $DOTFILES/nvim ~/.config/nvim

# zsh
ln $DOTFILES/.zshrc ~/.zshrc
ln $DOTFILES/.zprofile ~/.zprofile

#X11
ln $DOTFILES/.xinitrc ~/.xinitrc

#bspwm
ln -s $DOTFILES/bspwm ~/.config/bspwm
ln -s $DOTFILES/sxhkd ~/.config/sxhkd

#i3
ln -s $DOTFILES/i3 ~/.config/i3

#dunst
ln -s $DOTFILES/dunst ~/.config/dunst

#polybar
ln -s $DOTFILES/polybar ~/.config/polybar

#ranger
ln -s $DOTFILES/ranger ~/.config/ranger

#zathura
ln -s $DOTFILES/zathura ~/.config/zathura

#picom
ln $DOTFILES/picom.conf ~/.config/picom.conf

#alacritty
ln $DOTFILES/alacritty.yml ~/.config/alacritty.yml
