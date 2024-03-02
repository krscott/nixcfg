{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux-init.conf;
    # Note: 'sensible' plugin is included by default
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha' # latte, frappe, macchiato, mocha
          # Make tabs display window name instead of default (current directory)
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_text "#W"
        '';
      }
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
  };
}
