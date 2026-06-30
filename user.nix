{ pkgs, ... }:

let
    session = with pkgs; [
        quickshell
        noctalia-shell
        pavucontrol
        eom # image viewer
        evince # document viewer
        nautilus # file manager
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
        gearlever # appimage integration
        file-roller # archive manager
        orchis-theme # gtk theme
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
        asm-lsp
        direnv # auto dev shell activation
        pyright
        svelte-language-server
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
