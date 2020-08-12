{ config, pkgs, ... }:

{
	home.packages = [pkgs.bat pkgs.exa pkgs.fd];

	programs.alacritty.enable = true;
	programs.alacritty.settings = {
		colors.primary = {
			background = "#0a0e14";
			foreground = "#b3b1ad";
		};
		font = {
			normal.family = "Fira Code";
			normal.style = "Regular";

			bold.family = "Fira Code";
			bold.style = "Bold";
		};
	};

	programs.fish.enable = true;
	programs.fish.shellAliases = {
		ls = "exa";
		ll = "exa --long --header --group-directories-first";
		cat = "bat";
	};
	programs.starship.enable = true;
	programs.git.delta.enable = true;
	programs.git.delta.options.side-by-side = true;		
}
