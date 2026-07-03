{ pkgs, ... }:

let
    python = with pkgs; [
        python314
        python314Packages.ruff # python linter
        python314Packages.uv # python linter
        basedpyright
    ];

    c_cpp = with pkgs; [
        gcc
        clang-tools
    ];

    rust = with pkgs; [
        cargo
        rustc
        rustfmt
        rust-analyzer
    ];

    assembly = with pkgs; [
        asm-lsp
    ];

    web = with pkgs; [
        svelte-language-server
    ];

in {
    home.packages = python ++ c_cpp ++ rust ++ assembly ++ web;
}
