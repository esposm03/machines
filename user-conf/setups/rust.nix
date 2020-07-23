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
  }
