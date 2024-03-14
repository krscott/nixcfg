{ ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    historySubstringSearch.enable = true;
    plugins = [
      # {
      #   name = "powerlevel10k";
      #   src = pkgs.zsh-powerlevel10k;
      #   file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # }
      # {
      #   name = "powerlevel10k-dotfile";
      #   src = ./.;
      #   file = ".p10k.zsh";
      # }
      {
        name = "init-dotfile";
        src = ./.;
        file = "init.zsh";
      }
    ];
  };

  programs.fzf = {
    enable = true;
  };

  # Note: Starship is cross-platform, and could be moved to separate module
  programs.starship = {
    enable = true;
    settings =
      let
        # https://github.com/catppuccin/starship/blob/ee9763c6bd3c5bada9de23678b4e4e33b01e71ae/palettes/mocha.toml
        theme.palettes.catppuccin_mocha = rec {
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

          black = base;
          #red = red;
          #green = green;
          #yellow = yellow;
          #blue = blue;
          purple = mauve;
          cyan = lavender;
          #white = white;
          bright-black = subtext0;
          bright-red = pink;
          bright-green = teal; 
          bright-yellow = peach;
          bright-blue = sapphire;
          bright-purple = flamingo;
          bright-cyan = sky;
          bright-white = subtext1;
        };
      in 
      {
        palette = "catppuccin_mocha";

        username = {
          format = "[$user@]($style)";
          style_user = "purple";
        };
        hostname = {
          format = "[$hostname]($style)[:](bright-black) ";
          style = "purple";
        };
        directory = {

        };
        git_branch = {
          format = "[$symbol$branch(:$remote_branch)]($style) ";
          style = "bright-black";
          symbol = "";
        };
        cmd_duration = {
          format = "[$duration]($style) ";
          style = "yellow";
        };
        status = {
          disabled = false;
          symbol = "";
        };
        container = {
          disabled = true;
        };
      } // theme;
  };
}
