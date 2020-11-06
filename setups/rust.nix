{ config, lib, ... }:
let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
in
{
  home.packages = with pkgs; [
    rustup
    cargo-edit
    gcc
  ];

  programs.fish.interactiveShellInit = with pkgs; "
    rustup toolchain link astable ${rustChannels.stable.rust} > /dev/null
    rustup toolchain link anightly ${rustChannels.nightly.rust} > /dev/null
  ";
}
