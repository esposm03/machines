{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];


  # General configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 20;

  networking.hostName = "SamuelePCNix";
  time.timeZone = "Europe/Rome";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };

  config.nixpkgs.allowUnfree = true;


  # System packages
  environment.systemPackages = with pkgs; [
    wget neovim
  ];

  services.xserver.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.displayManager.gdm.enable = true;


  # Users
  users.users.samuele = {
    isNormalUser = true;
    extraGroups = [ "wheel" "sudo" ];
  };

}

