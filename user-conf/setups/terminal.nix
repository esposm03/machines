{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ion
		starship
		exa
	];

    home.file.".config/ion/initrc".text = ''
		alias ls = "exa"
		alias ll = "exa --long --header --group-directories-first"

		eval $(starship init ion)
	'';
}
