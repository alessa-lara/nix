{ pkgs, ... }:

let
    session = with pkgs; [
        quickshell
        noctalia-shell
        pavucontrol
        eom # image viewer
        evince # document viewer
        caja-with-extensions # file manager
        celluloid
        htop
        ffmpeg-full
        stow
        rofi
        brightnessctl
        unzip
        xwayland-satellite
        gearlever # appimage integration
        file-roller # archive manager
        yaru-remix-theme
        papirus-icon-theme
        nwg-look
    ];

    dev = with pkgs; [
        fd # fuzzy finder nvim
        tree-sitter # nvim parser
        direnv # auto dev shell activation
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
    imports = [./modules/programming.nix];

    home.packages = session ++ dev ++ user;


    programs.git = {
        enable = true;
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
