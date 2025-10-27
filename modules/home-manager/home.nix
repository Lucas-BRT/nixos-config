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
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
    ];
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
    nil
    nixd
    nixdoc

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
    boxbuddy
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "Discord Presence"
    ];
    userKeymaps = [
      {
        "context" = "Editor && vim_mode == normal && vim_operator == none && !VimWaiting";
        "bindings" = {
          "space w" = "workspace::Save";
          "space s f" = "file_finder::Toggle";
          "space s t" = "pane::DeploySearch";
          "space c" = "pane::CloseActiveItem";
          "ctrl-t" = "terminal_panel::ToggleFocus";
          "g d" = "editor::GoToDefinition";
        };
      }
      {
        "context" = "Editor && vim_mode == normal";
        "bindings" = {
          "shift-j" = "pane::ActivatePreviousItem";
          "shift-k" = "pane::ActivateNextItem";
          "ctrl-h" = "project_panel::ToggleFocus";
        };
      }
      {
        "context" = "Dock && vim_mode == normal";
        "bindings" = {
          "ctrl-l" = "project_panel::ToggleFocus";
          "a" = "project_panel::NewFile";
          "D" = "project_panel::Delete";
        };
      }
    ];

    userSettings = {
      "vim_mode" = true;
      "ui_font_size" = 16;
      "buffer_font_size" = 16;
      "format_on_save" = "on";
      "theme" = {
        "mode" = "system";
        "light" = "One Light";
        "dark" = "One Dark";
      };
      "lsp" = {
        "rust-analyzer" = {
          "initialization_options" = {
            "check" = {
              "command" = "clippy";
            };
          };
        };
      };
    };
  };

  home.stateVersion = "24.05";

}
