{ pkgs, ... }:

let
    python = with pkgs; [
        python3
        ruff # python linter
        pyright

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
