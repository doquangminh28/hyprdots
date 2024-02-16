#!/bin/bash
#|---/ /+----------------------------------------+---/ /|#
#|--/ /-| Script to install pkgs from input list |--/ /-|#
#|-/ /--| Prasanth Rangan                        |-/ /--|#
#|/ /---+----------------------------------------+/ /---|#

source global_fn.sh
if [ $? -ne 0 ] ; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname "$(realpath "$0")")..."
    exit 1
fi

if ! pkg_installed pacdef
    then
    echo "installing dependency pacdef..."
    sudo pacman -S pacdef
fi

if ! pkg_installed chezmoi
    then
    echo "installing dependency chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply shinishiho
fi

pacdef g i ${XDG_CONFIG_HOME:-$HOME}/pacdef/groups/* 2>&1
pacdef p sy --noconfirm