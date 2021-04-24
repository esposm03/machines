{ config, lib, ... }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };

  rust-stable = pkgs.rustChannels.stable.rust.override { extensions = [ "rust-src" ]; };
  rust-nightly = pkgs.rustChannels.nightly.rust.override { extensions = [ "rust-src" "clippy-preview" "rustfmt-preview" ]; };

in {
  home.packages = with pkgs; [
    rustup
    cargo-edit
    lld_11
  ];

  programs.fish.interactiveShellInit = with pkgs; "
    rustup toolchain link astable ${rust-stable} > /dev/null
  ";

  home.file."cargo-config" = {
    text = "
      [build]
      rustflags = [\"-C\", \"link-arg=-fuse-ld=lld\"]
    ";
    target = ".cargo/config.toml";
  };
}
