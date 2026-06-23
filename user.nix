{ pkgs, ... }:

let
    session = with pkgs; [
        quickshell
        noctalia-shell
        pavucontrol
        eom
        evince
        nautilus
        nautilus-open-any-terminal
        celluloid
        htop
        ffmpeg-full
        stow
        rofi
        adwaita-icon-theme
        brightnessctl
        unzip
        xwayland-satellite
        fuse # for appimages
    ];

    dev = with pkgs; [
        git
        python3
        ruff # python linter
        pyright 
        gcc
        fd # fuzzy finder nvim
        tree-sitter # nvim parser
        cargo
        rustc
        rustfmt
        rust-analyzer
        clang-tools
    ];

    user = with pkgs; [
        kitty
        neovim
        libreoffice
        obsidian
        firefox
        chromium
        qutebrowser
        vesktop
        bitwarden-desktop
        motrix
    ];

in {
    home.packages = session ++ dev ++ user;

    programs.git = {
        settings = {
            user = {
                name  = "Alessa Lara";
                email = "98236508+alessa-lara@users.noreply.github.com";
            };
            init.defaultBranch = "main";
        };
    };

    home.stateVersion = "26.05";
}
