{
  pkgs,
  impermanence,
  ...
}: {
  imports = [
    impermanence.nixosModules.home-manager.impermanence
    ./fish.nix
    ./kitty.nix
    ./direnv.nix
    ./gpg.nix
    ./neovim.nix
    ./packages
  ];

home.packages = with pkgs; [
    git
    gotop
    neofetch
    xclip
    mariadb
    xwallpaper
    rofi
    dmenu
    ungoogled-chromium
  ];

  services.udiskie.enable = true;
  xdg.enable = true;

  home.persistence."/nix/persist/home/dragoon" = {
    directories = [
      ".local/share/docker"
      ".local/state/wireplumber"
      ".config/rofi"
      ".local/share/qbittorrent"
      ".local/share/nvim"
    ];
    files = [
    ".ssh/id_rsa"
    ".ssh/id_rsa.pub"
    ".ssh/id_ed25519.pub"
    ".ssh/id_ed25519"
    ];
    allowOther = true;
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.file.".background-image" = {
    force = true;
    source = ./assets/full.jpg;
    recursive = true;
  };
  home.file.".config/i3status/config" = {
    force = true;
    source = ./i3status;
    recursive = true;
  };
  home.stateVersion = "24.11";
}
