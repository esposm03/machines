{ config, pkgs, ... }:

{
  imports = [
    ../setups/terminal.nix
    ../setups/rust.nix
  ];

  home.packages = with pkgs; [
    firefox
    vscode
    fira-code

    xorg.xmodmap # To enable scroll-lock on xorg
  ];

  programs.git = {
    enable = true;
    userName = "esposm03";
    userEmail = "36164633+esposm03@users.noreply.github.com";
  };

}
