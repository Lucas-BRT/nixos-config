{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
    nixd
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "Discord Presence"
      "git-firefly"
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
        "nil" = {
          "binary" = {
            "path" = "nil";
          };
        };
        "rust-analyzer" = {
          "initialization_options" = {
            "check" = {
              "command" = "clippy";
            };
          };
        };
      };
      "inlay_hints" = {
        "enabled" = true;
        "show_type_hints" = true;
        "show_parameter_hints" = true;
        "show_other_hints" = true;
        "edit_debounce_ms" = 700;
        "scroll_debounce_ms" = 50;
        "toggle_on_modifiers_press" = null;
      };
      "auto_signature_help" = true;
    };
  };
}
