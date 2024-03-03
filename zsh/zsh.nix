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
        userHostStyle = "purple";
      in 
      {
        username = {
          format = "[$user@]($style)";
          style_user = userHostStyle;
        };
        hostname = {
          # Style "8" is gray
          format = "[$hostname]($style)[:](8) ";
          style = userHostStyle;
        };
        directory = {
          style = "bold bright-blue";
        };
        git_branch = {
          format = "[$symbol$branch(:$remote_branch)]($style) ";
          style = "8";  # Gray
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
      };
  };
}
