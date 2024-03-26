{ pkgs, ... }:

{
  home.packages = with pkgs; [
    direnv
    nix-direnv
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
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
    settings = {
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
      package = {
        format = "[$symbol$version]($style) ";
        symbol = "󰏗 ";
      };
      rust = {
        format = "[$symbol$version]($style) ";
        symbol = " ";
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
    };
  };
}
