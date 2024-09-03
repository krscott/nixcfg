{ ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    plugins = [
      {
        name = "init-dotfile";
        src = ./.;
        file = "init.zsh";
      }
    ];
  };
}
