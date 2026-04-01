# AnoNV installer
# (C) Anonoei, Licenced under the MIT license

AINST_SRC="https://github.com/Anonoei/anonv"
AINST_ROOT="${HOME}/.config/nvim/lua/anonv"
# ---------------------- #

function _show_help {
    echo "AnoNV installer"
    echo ""
    echo "Arguments:"
    echo "  -h|--help..................show this message"
}

function _parse_args {
    if [[ $# -eq 0 ]]; then
        return
    fi
    AINST_ARG=$1
    shift
    case $AINST_ARG in
        -h|--help)
            _show_help
            exit 0
            ;;
        *)
            echo "Unknown argument! $AINST_ARG"
            exit 1
            ;;
    esac
    _parse_args $*
}

function anonv_pre {
    [[ -d "${AINST_ROOT}.bak" ]] && rm -rf "${AINST_ROOT}.bak"
    [[ -d "${AINST_ROOT}" ]] && mv "${AINST_ROOT}" "${AINST_ROOT}.bak"
    [[ -d "${AINST_ROOT}" ]] && rm -rf "${AINST_ROOT}"
    mkdir -p "${AINST_ROOT}" && rm -rf "${AINST_ROOT}"
}
function anonv_post {
    echo "Writing nvim/init.lua"
    if [ -f "${HOME}/.config/nvim/init.vim" ]; then
        mv "${HOME}/.config/nvim/init.vim" "${HOME}/.config/nvim/init.vim-bak"
    fi
    if [ -f "${HOME}/.config/nvim/init.lua" ]; then
        mv "${HOME}/.config/nvim/init.lua" "${HOME}/.config/nvim/init.lua-bak"
    fi

    echo "require('anonv')" > "${HOME}/.config/nvim/init.lua"

    echo "Please install dependencies, or neovim will throw errors"
}

if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
    _parse_args $*
    echo '     ___                _   ___    __'
    echo '    /   |  ____  ____  / | / / |  / /'
    echo '   / /| | / __ \/ __ \/  |/ /| | / / '
    echo '  / ___ |/ / / / /_/ / /|  / | |/ /  '
    echo ' /_/  |_/_/ /_/\____/_/ |_/  |___/   '
    if ! command -v git &> /dev/null; then
        echo "Missing required package: git"
        exit 10
    fi

    anonv_pre
    echo "Cloning AnoNV..."
    git clone $AINST_SRC "${AINST_ROOT}"
    anonv_post
fi
