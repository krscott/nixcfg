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
        s = "status -sb";
        lol = "log --graph --abbrev-commit --date-order --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
        lola = "lol --all";
        lol2 = "log --graph --abbrev-commit --date-order --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
        lola2 = "lol2 --all";
        dogs = "log --decorate --oneline --graph --stat";
        k = "!gitk --date-order";
        ka = "!gitk --all --date-order";
        l = "!lazygit";
        cr = "clone --recursive";
        smu = "submodule update --recursive --init";
      };
    };

    lazygit.enable = true;
  };

  # home.shellAliases = {
  #   gs = "git stuats";
  #   gl = "lazygit";
  # };
}
