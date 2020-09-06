{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];


	# General configuration
	boot.loader.systemd-boot.enable = true;
	boot.loader.systemd-boot.configurationLimit = 20;

	system.autoUpgrade.enable = true;
	time.timeZone = "Europe/Rome";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "it";
	};

	# Hardware configuration
	hardware.pulseaudio.enable = true;
	hardware.opengl.enable = true;


	# Programs
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

