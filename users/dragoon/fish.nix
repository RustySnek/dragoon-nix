{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "pure";
        src = pure.src;
      }
    ];
    shellAliases = {
      "du" = "${pkgs.du-dust}/bin/dust";
      "ls" = "${pkgs.unstable.eza}/bin/eza --icons";
      "la" = "${pkgs.unstable.eza}/bin/eza --icons -la --extended --git";
      "cat" = "${pkgs.bat}/bin/bat";
      "df" = "${pkgs.duf}/bin/duf";
      "ps" = "${pkgs.procs}/bin/procs";
      "curl" = "${pkgs.curlie}/bin/curlie";
      "dig" = "${pkgs.dogdns}/bin/dog";
      "cp" = "${pkgs.xcp}/bin/xcp";
    };
  };

  home.persistence."/nix/persist/home/dragoon/" = {
    files = [
      ".local/share/fish/fish_history"
    ];
  };

  programs.kitty.settings.shell = "${pkgs.fish}/bin/fish";
}
