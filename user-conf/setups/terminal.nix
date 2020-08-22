# This module provides the configuration for my terminal setup.
# It installs the alacritty terminal emulator, and the `{Cascadia,Fira} Code`
# fonts.
#
# It also installs these tools:
# - Fish: my shell
# - Neovim: my editor
# - Exa: a substitute for ls
# - Bat: a substitute for cat
# - Zoxide: a substitute for cd
#
# And shell configurations:
# - Starship: a really fast prompt
# - Delta: a diff viewer
# - Direnv: per-directory environments, 
# mainly used to integrate `nix-shell` with all my setup

{ config, pkgs, ... }:

let greeting = "";
in {

	# Basics
	programs.fish.enable = true;
	programs.alacritty.enable = true;
	programs.alacritty.settings = {
		colors.primary = {
			background = "#0a0e14";
			foreground = "#b3b1ad";
		};
		font = {
			normal.family = "Cascadia Code";
			normal.style = "Regular";
		};
	};

	# Editor
	programs.neovim.enable = true;
	programs.neovim.configure = {

		# Configuration file
		customRC = ''
			set termguicolors
			let ayucolor = "dark"
			let g:airline_theme = "ayu_dark"
			colorscheme ayu
		'';

		# Plugins
		packages.myVimPackage.start = with pkgs.vimPlugins; [
			vim-airline
			auto-pairs

			# Themes
			ayu-vim
			vim-airline-themes
		];

	};

	# Tools
	home.packages = with pkgs; [ ripgrep fd tealdeer ];
	programs.fish.shellAliases = with pkgs; {
		ls = "${exa}/bin/exa";
		ll = "${exa}/bin/exa --long --header --group-directories-first";
		cat = "${bat}/bin/bat --plain";
	};
	programs.direnv.enableNixDirenvIntegration = true;
	programs.zoxide.enable = true;

	# Background tools
	programs.starship.enable = true;
	programs.git.delta.enable = true;
	programs.git.delta.options.side-by-side = true;		

}
