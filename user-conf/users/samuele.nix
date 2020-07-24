{ config, pkgs, ... }:

{
  imports = [
    ../setups/terminal.nix
    ../setups/rust.nix
  ];

  home.packages = with pkgs; [
    firefox
    fira-code
    discord

    xorg.xmodmap # To enable scroll-lock on xorg
  ];

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
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "0.1.2";
          sha256 = "693371af5b1a51a37d23cd946020ec42f1fd5015a3b9efc14a75263103a7b1d8";
        };
      })
    ];

    userSettings = {
      "explorer.openEditors.visible" = 0;
      "editor.fontFamily" = "'Fira Code', 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'";
      "editor.fontLigatures" = true;
      "editor.cursorSmoothCaretAnimation" = true;
      "editor.smoothScrolling" = true;
      "explorer.confirmDelete" = false;
      "window.zoomLevel" = 0;
      "editor.lineNumbers" = "relative";
      "files.exclude" = {
          "**/.DS_Store" = false;
          "**/.hg" = false;
          "**/.nix-pkgconfig" = true;
          "**/.svn" = false;
          "**/CVS" = false;
      };
      "workbench.startupEditor" = "newUntitledFile";
      "editor.insertSpaces" = false;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "explorer.confirmDragAndDrop" = false;
      "todo-tree.tree.showScanModeButton" = false;
      "diffEditor.ignoreTrimWhitespace" = false;
      "workbench.colorTheme" = "Firefox Quantum Dark";
      "extensions.ignoreRecommendations" = true;
    };
  };

}
