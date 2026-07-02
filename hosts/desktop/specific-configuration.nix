{ config, lib,  pkgs, ... }:

{
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "us";
}
