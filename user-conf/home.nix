{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.firefox
    pkgs.vscode

    pkgs.xmodmap # To enable scroll-lock on xorg
  ];

  programs.git = {
    enable = true;
    userName = "esposm03";
    userEmail = "36164633+esposm03@users.noreply.github.com";
  };

}
