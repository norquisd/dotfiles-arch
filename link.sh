#!/bin/bash

DOTFILES="/home/quinn/.dotfiles"

# neovim
ln -sfn $DOTFILES/nvim ~/.config/nvim

# zsh
ln $DOTFILES/.zshrc ~/.zshrc
ln $DOTFILES/.zprofile ~/.zprofile

#X11
ln $DOTFILES/.xinitrc ~/.xinitrc

#bspwm
ln -sfn $DOTFILES/bspwm ~/.config/bspwm
ln -sfn $DOTFILES/sxhkd ~/.config/sxhkd

#i3
ln -sfn $DOTFILES/i3 ~/.config/i3

#dunst
ln -sfn $DOTFILES/dunst ~/.config/dunst

#polybar
ln -sfn $DOTFILES/polybar ~/.config/polybar

#ranger
ln -sfn $DOTFILES/ranger ~/.config/ranger

#zathura
ln -sfn $DOTFILES/zathura ~/.config/zathura

#picom
ln $DOTFILES/picom.conf ~/.config/picom.conf

#kitty
ln -sfn $DOTFILES/kitty ~/.config/kitty
