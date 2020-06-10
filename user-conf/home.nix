{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
  ];

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.firefox
    pkgs.vscode
    pkgs.fira-code

    pkgs.xorg.xmodmap # To enable scroll-lock on xorg

    pkgs.gcc
    pkgs.latest.rustChannels.stable.rust
  ];

  programs.git = {
    enable = true;
    userName = "esposm03";
    userEmail = "36164633+esposm03@users.noreply.github.com";
  };

}
