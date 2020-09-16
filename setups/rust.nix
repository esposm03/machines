{ config, lib, ... }:

with import <home-manager/modules/lib/dag.nix> { inherit lib; };
let
		moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
		pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
in
	{
		home.packages = with pkgs; [
			latest.rustChannels.stable.rust
			cargo-edit
			gcc
		];

		programs.vscode.extensions = [
			(pkgs.vscode-utils.buildVscodeMarketplaceExtension {
				mktplcRef = {
					name = "rust";
					publisher = "rust-lang";
					version = "0.7.8";
					sha256 = "637dda81234c5666950907587799b3c2388ae494d94edcd39264864d0ad2360d";
				};
			})
		];

		programs.vscode.userSettings = {
			"rust-client.disableRustup" = true;
			"rust-client.engine" = "rust-analyzer";
			"files.exclude" = {
				"**/Cargo.lock" = true;
				"**/target" = true;
			};
		};
	}
