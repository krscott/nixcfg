{ pkgs, ... }:
let
  # Mocha palette
  # https://github.com/catppuccin/starship/blob/ee9763c6bd3c5bada9de23678b4e4e33b01e71ae/palettes/mocha.toml
  color = {
    rosewater = "#f5e0dc";
    flamingo = "#f2cdcd";
    pink = "#f5c2e7";
    mauve = "#cba6f7";
    red = "#f38ba8";
    maroon = "#eba0ac";
    peach = "#fab387";
    yellow = "#f9e2af";
    green = "#a6e3a1";
    teal = "#94e2d5";
    sky = "#89dceb";
    sapphire = "#74c7ec";
    blue = "#89b4fa";
    lavender = "#b4befe";
    text = "#cdd6f4";
    subtext1 = "#bac2de";
    subtext0 = "#a6adc8";
    overlay2 = "#9399b2";
    overlay1 = "#7f849c";
    overlay0 = "#6c7086";
    surface2 = "#585b70";
    surface1 = "#45475a";
    surface0 = "#313244";
    base = "#1e1e2e";
    mantle = "#181825";
    crust = "#11111b";
  };
in
{
  programs.kitty.theme = "Catppuccin-Mocha";
  
  programs.neovim.plugins = [
    pkgs.vimPlugins.catppuccin-nvim
  ];

  programs.starship.settings = {
    palette = "catppuccin_mocha";
    palettes.catppuccin_mocha = {
      black = color.base;
      red = color.red;
      green = color.green;
      yellow = color.yellow;
      blue = color.blue;
      purple = color.mauve;
      cyan = color.lavender;
      white = color.text;
      bright-black = color.subtext0;
      bright-red = color.pink;
      bright-green = color.teal; 
      bright-yellow = color.peach;
      bright-blue = color.sapphire;
      bright-purple = color.flamingo;
      bright-cyan = color.sky;
      bright-white = color.subtext1;
    };
  };

  programs.tmux.plugins = [
    {
      plugin = pkgs.tmuxPlugins.catppuccin;
      extraConfig = ''
        set -g @catppuccin_flavour 'mocha' # latte, frappe, macchiato, mocha
        # Make tabs display window name instead of default (current directory)
        set -g @catppuccin_window_default_text "#W"
        set -g @catppuccin_window_current_text "#W"
      '';
    }
  ];
}
