{
  pkgs,
  impermanence,
  ...
}: {
  imports = [
    impermanence.nixosModules.home-manager.impermanence
    # ...
  ];
home.packages = with pkgs; [
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
    ];
    allowOther = true;
  };
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.stateVersion = "24.11";
}
