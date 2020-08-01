{ config, pkgs, ... }:

{
	home.packages = [pkgs.bat pkgs.exa];

	programs.fish.enable = true;
	programs.fish.shellAliases = {
		ls = "exa";
		ll = "exa --long --header --group-directories-first";
		cat = "bat";
	};
	programs.starship.enable = true;
	programs.git.delta.enable = true;
}
