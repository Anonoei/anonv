#!/bin/bash
echo '     ___                _   ___    __'
echo '    /   |  ____  ____  / | / / |  / /'
echo '   / /| | / __ \/ __ \/  |/ /| | / / '
echo '  / ___ |/ / / / /_/ / /|  / | |/ /  '
echo ' /_/  |_/_/ /_/\____/_/ |_/  |___/   '
ANONV_SRC="https://github.com/Anonoei/anonv"

ANONV_ROOT="${HOME}/.config/nvim/lua/anonv"

if [[ "$1" == "-l" || "$1" == "--local" ]]; then
    ANV_SRC="$2"
    if [[ "$ANV_SRC" == "." ]]; then
        ANV_SRC="$PWD"
    fi
    foldername=${ANV_SRC##*/}
    foldername=${foldername:-/}
    if [[ ! $foldername == "anonv" ]]; then
        echo "Please install from anonv source, not $foldername"
        exit
    fi
    if [ ! -d "$ANV_SRC" ]; then
        echo "Unable to install from local directory $ANV_SRC"
        exit
    fi
fi

if [ ! -d $ANV_ROOT ]; then
    mkdir -p $ANV_ROOT
fi

echo "Cloning AnoNV..."
if [[ -d "${ANV_ROOT}" ]]; then
    rm -rf "${ANV_ROOT}"
fi
if [[ $ANV_SRC == /* ]]; then
    cp -R "${ANV_SRC}" "${ANV_ROOT}"
else
    git clone $ANV_SRC "${ANV_ROOT}"
fi

echo "Writing nvim/init.lua"
if [ -f "${HOME}/.config/nvim/init.vim" ]; then
    mv "${HOME}/.config/nvim/init.vim" "${HOME}/.config/nvim/init.vim-bak"
fi
if [ -f "${HOME}/.config/nvim/init.lua" ]; then
    mv "${HOME}/.config/nvim/init.lua" "${HOME}/.config/nvim/init.lua-bak"
fi

echo "require('anonv')" > "${HOME}/.config/nvim/init.lua"

echo "Please install dependencies, or neovim will throw errors"
