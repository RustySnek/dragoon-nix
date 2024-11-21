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
  ];



home.packages = with pkgs; [
    git
    gotop
    jre8
    openvpn
    exploitdb
    zap
    inetutils
    john
    nmap
    gscreenshot
    lsof
    neofetch
    rust-analyzer
    unzip
    ffmpeg-full
    glibc
    netcat-gnu
    wireshark
    gobuster
    metasploit
    xclip
    mariadb
    wget
    xwallpaper
    i3lock
    rofi
    dmenu
    fd
    python311Packages.tree-sitter
    tree-sitter
    vimPlugins.nvim-treesitter
    ungoogled-chromium
    python311Packages.pynvim
    python311
    qbittorrent
    mpv
    ripgrep
    xorg.xinit
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
home.file.".config/nvim" = {
  force = true;
  source = ./neovim;
  recursive = true;
};
  home.stateVersion = "24.11";
}
