{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  # System configuration
  boot.loader.systemd-boot.enable = true;

  system.autoUpgrade.enable = true;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  nix.package = pkgs.nixUnstable;
  nix.extraOptions = "experimental-features = nix-command flakes";

  time.timeZone = "Europe/Rome";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };



  # System customization
  home-manager.useGlobalPkgs = true;
  nixpkgs.config.allowUnfree = true;
  hardware.pulseaudio.enable = true;
  programs.sway.enable = true;

  environment.systemPackages = [ pkgs.wget pkgs.neovim ];
  fonts.fonts = with pkgs; [ cascadia-code fira-code ];



  # Users
  users.users.samuele.isNormalUser = true;
  home-manager.users.samuele = import ./users/samuele.nix;
}