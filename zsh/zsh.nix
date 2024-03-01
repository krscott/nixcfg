{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    historySubstringSearch.enable = true;
    # TODO: Swap p10k for starship.rs ?
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-dotfile";
        src = ./.;
        file = ".p10k.zsh";
      }
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
}
