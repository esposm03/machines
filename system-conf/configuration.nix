{ config, pkgs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
			./machine-configuration.nix
		];


	# General configuration
	boot.loader.systemd-boot.enable = true;
	boot.loader.systemd-boot.configurationLimit = 20;

	console = {
		font = "Lat2-Terminus16";
		keyMap = "it";
	};

	system.autoUpgrade.enable = true;

	fonts.fonts = with pkgs; [ cascadia-code fira-code ];



	# System packages
	environment.systemPackages = with pkgs; [
		wget neovim
	];

	programs.sway.enable = true;



	# Users
	users.users.samuele = {
		isNormalUser = true;
		shell = "${pkgs.fish}/bin/fish";
		extraGroups = [ "wheel" "sudo" ];
	};

}

