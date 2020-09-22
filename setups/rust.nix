{ config, lib, ... }:
let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  rust = pkgs.rustChannels.stable.rust.override { extensions = [ "rust-src" ]; };
in
{
  home.packages = with pkgs; [
    rust
    cargo-edit
    gcc
  ];
}
