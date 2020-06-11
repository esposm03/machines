{ config, pkgs, lib, ... }:

with import <home-manager/modules/lib/dag.nix> { inherit lib; };

{
  home.packages = with pkgs; [
    rustup
    gcc
  ];

  home.activation = {
    rust = dagEntryAfter ["writeBoundary"] ''
      rustup toolchain install stable
      rustup component add rls
      rustup component add rust-analysis
    '';
  };
}
