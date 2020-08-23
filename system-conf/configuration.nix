{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];


	# General configuration
	boot.loader.systemd-boot.enable = true;
	boot.loader.systemd-boot.configurationLimit = 20;
	system.autoUpgrade.enable = true;
	console = {
		font = "Lat2-Terminus16";
		keyMap = "it";
	};
	time.timeZone = "Europe/Rome";



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

