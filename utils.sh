anv_install_nix_pkg() {
    # $1 package name
    # $2 command to test instalation
    if [[ "$(which $2)" == *"not found" ]] || [ -z "$(which $2)" ]; then
        if [[ "$(nix-env -q | grep "$2")" == "" ]]; then
            echo "Installing \"$2\" from \"$1\""
            nix-env -iA $1 > /dev/null
        fi
    fi
}

anv_install_deps() {
    # telescope deps
    anv_install_nix_pkg "nixpkgs.telescope" "telescope"
    anv_install_nix_pkg "nixpkgs.ripgrep" "ripgrep"
    anv_install_nix_pkg "nixpkgs.fd" "fd"
    anv_install_nix_pkg "nixpkgs.telescope" "telescope"
    anv_install_nix_pkg "nixpkgs.luajitPackages.jsregexp" "jsregexp"
}
