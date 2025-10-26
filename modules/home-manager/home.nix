{ pkgs, ... }:

{
  home.username = "lucasbrt";
  home.homeDirectory = "/home/lucasbrt";

  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn_night_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };



  home.packages = with pkgs; [
    # Sys and Tools
    vim
    neovim
    wl-clipboard
    git
    gh
    wget
    alacritty
    tmux
    libpq
    clang
    gemini-cli
    pkg-config
    zola
    vivaldi
    asciinema
    helix
    zellij

    # Languages
    cargo-watch
    cargo-edit
    cargo-outdated
    cargo-audit
    cargo-nextest   
    rustup
    cabal-install
    ghc
    nodejs_24
    python314

    # Gaming
    heroic
    mangohud
    lutris
    bottles
    discord
    steam

    # Utils
    firefox
    bitwarden
    zed-editor
    onlyoffice-bin
    obsidian
    megasync
    sqlx-cli
    mission-center
  ];

  home.stateVersion = "24.05";

}
