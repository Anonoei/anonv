#!/bin/bash
echo '     ___                _   ___    __'
echo '    /   |  ____  ____  / | / / |  / /'
echo '   / /| | / __ \/ __ \/  |/ /| | / / '
echo '  / ___ |/ / / / /_/ / /|  / | |/ /  '
echo ' /_/  |_/_/ /_/\____/_/ |_/  |___/   '
ANONV_SRC="https://github.com/Anonoei/anonv"

ANONV_ROOT="${HOME}/.config/nvim/lua/anonv"

if [[ "$1" == "-l" || "$1" == "--local" ]]; then
    ANONV_SRC="$2"
    if [[ "$ANONV_SRC" == "." ]]; then
        ANONV_SRC="$PWD"
    fi
    foldername=${ANONV_SRC##*/}
    foldername=${foldername:-/}
    if [[ ! $foldername == "anonv" ]]; then
        echo "Please install from anonv source, not $foldername"
        exit
    fi
    if [ ! -d "$ANONV_SRC" ]; then
        echo "Unable to install from local directory $ANONV_SRC"
        exit
    fi
fi

if [ ! -d $ANONV_ROOT ]; then
    mkdir -p $ANONV_ROOT
fi

echo "Cloning AnoNV..."
if [[ -d "${ANONV_ROOT}" ]]; then
    rm -rf "${ANONV_ROOT}"
fi
if [[ $ANONV_SRC == /* ]]; then
    cp -R "${ANONV_SRC}" "${ANONV_ROOT}"
else
    git clone $ANONV_SRC "${ANONV_ROOT}"
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
