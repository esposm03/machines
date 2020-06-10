{ config, pkgs, ... }:

{
	home.packages = [
		pkgs.ion
		pkgs.starship
	];

    home.file.".config/ion/initrc".text = "eval $(starship init ion)";
}
