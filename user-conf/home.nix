{ config, pkgs, ... }:

{
	imports = [
		./users/samuele.nix
	];

	programs.home-manager.enable = true;

}
