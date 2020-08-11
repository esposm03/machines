{ config, pkgs, ... }:

{
	imports = [
		../setups/terminal.nix
		../setups/sway.nix
		../setups/rust.nix
	];

	home.packages = with pkgs; [
		firefox
		fira-code
		discord

		neovim

		xorg.xmodmap # To enable scroll-lock on xorg
	];

	home.sessionVariables.EDITOR = "${pkgs.neovim}/bin/nvim";

	programs.direnv.enable = true;
	programs.direnv.enableNixDirenvIntegration = true;

	programs.git = {
		enable = true;
		userName = "esposm03";
		userEmail = "36164633+esposm03@users.noreply.github.com";
	};

	programs.vscode = {
		enable = true;
		package = pkgs.vscode;
		extensions = with pkgs.vscode-extensions; [
			bbenoist.Nix
			vscodevim.vim

			(pkgs.vscode-utils.buildVscodeMarketplaceExtension {
				mktplcRef = {
					name = "rust-analyzer";
					publisher = "matklad";
					version = "0.2.248";
					sha256 = "244c4ec2bb8e4f35a081058214551c83418e9ad5bf9757126641b8ef10ee40e8";
				};
			})
		];

		userSettings = {
			"workbench.startupEditor" = "newUntitledFile";
			"workbench.colorTheme" = "Ayu Dark Bordered";
			"files.exclude" = {
					"**/.DS_Store" = false;
					"**/.hg" = false;
					"**/.nix-pkgconfig" = true;
					"**/.svn" = false;
					"**/CVS" = false;
			};

			"explorer.openEditors.visible" = 0;
			"explorer.confirmDelete" = false;
			"explorer.confirmDragAndDrop" = false;
			"editor.fontFamily" = "'Fira Code', monospace, 'Droid Sans Fallback'";
			"editor.fontLigatures" = true;
			"editor.cursorSmoothCaretAnimation" = true;
			"editor.smoothScrolling" = true;
			"editor.insertSpaces" = false;
			"editor.lineNumbers" = "relative";

			"git.autofetch" = true;
			"git.confirmSync" = false;
			"todo-tree.tree.showScanModeButton" = false;
			"extensions.ignoreRecommendations" = true;
		};
	};

}
