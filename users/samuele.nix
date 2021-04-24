{ config, pkgs, ... }:

{
  imports = [
    ../setups/terminal.nix
    ../setups/sway.nix
    ../setups/rust.nix
  ];

  home.packages = with pkgs; [
    # Fonts
    fira-code
    cascadia-code

    # Utilities
    firefox
    discord
    zip
    xdg_utils
  ];

  home.sessionVariables.EDITOR = "${pkgs.neovim}/bin/nvim";

  programs.git = {
    enable = true;
    userName = "esposm03";
    userEmail = "36164633+esposm03@users.noreply.github.com";
    extraConfig = { pull = { rebase = true; }; };
  };

}
