{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

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
  hardware.pulseaudio.enable = true;
  environment.systemPackages = [ pkgs.wget pkgs.neovim ];
  programs.sway.enable = true;
  fonts.fonts = with pkgs; [ cascadia-code fira-code ];



  # Users
  users.users.samuele = {
    isNormalUser = true;
    shell = "${pkgs.fish}/bin/fish";
    extraGroups = [ "wheel" "sudo" ];
  };

}
