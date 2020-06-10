{ config, pkgs, ... }:

{
	home.packages = [
		pkgs.ion
		pkgs.starship
	];
}
