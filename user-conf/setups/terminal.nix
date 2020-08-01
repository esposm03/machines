{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ion
		starship
		exa
	];

	home.file.".config/ion/initrc".text =

	''
	alias ls = "exa"
	alias ll = "exa --long --header --group-directories-first"

	fn PROMPT
		starship prompt --status $? --jobs $(jobs ^| wc -l)
	end

	export NIX_PATH="~/.nix-defexpr/channels:$NIX_PATH"
	'';

}
