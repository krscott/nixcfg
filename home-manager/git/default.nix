{ pkgs, ... }:
{
  programs = {
    vim = {
      enable = true;
      defaultEditor = true;
    };

    git = {
      enable = true;
      package = pkgs.gitFull;  # Includes gitk
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      aliases = {
        s = "status";
        lol = "log --oneline --date-order";
        k = "!gitk --date-order";
        ka = "!gitk --all --date-order";
        l = "!lazygit";
      };
    };

    lazygit.enable = true;
  };

  # home.shellAliases = {
  #   gs = "git stuats";
  #   gl = "lazygit";
  # };
}
