{
  lib,
  pkgs,
  nil-ls,
  ...
}: {
  imports = [
  ./gpg.nix
  ./disk.nix
  ./audio.nix
  ./users.nix
  ./docker.nix
  ./gpg.nix
  ./persistance.nix
  ./network.nix
  ./boot.nix
];

services.passSecretService.enable = true;
services.postgresql = {
  enable = true;
  ensureDatabases = [ "mydatabase" ];
  enableTCPIP = true;
  settings.port = 5432;
  authentication = pkgs.lib.mkOverride 10 ''
 
 #...
      local all       all     trust
    #type database DBuser origin-address auth-method
    # ipv4
    host  all      all     127.0.0.1/32   trust
  '';
  initialScript = pkgs.writeText "backend-initScript" ''
    CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
    CREATE DATABASE nixcloud;
    GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
  '';
};  
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.configPackages = [ pkgs.xdg-desktop-portal-gtk ];

  
  time.timeZone = "Europe/Warsaw";
  environment.etc.hosts.mode = "0644";
  environment.systemPackages = with pkgs; [
    unstable.devenv unstable.neovim fastcompmgr
    fzf jq nil floorp glib man-pages-posix
  ];

  fonts.packages = with pkgs; [
    migu
    baekmuk-ttf
    quicksand
    nanum
    noto-fonts-emoji
    twemoji-color-font
    openmoji-color
    twitter-color-emoji
    (pkgs.nerdfonts.override {fonts = ["VictorMono"];})
  ];

  services.dbus.enable = true;
  security.polkit.enable = true;
  nix.settings.trusted-users = ["dragoon" "root"];
  nix.settings.substituters = ["https://nix-community.cachix.org" "https://cache.nixos.org" "https://devenv.cachix.org"];
  nix.settings.trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  networking.hostName = "placidusax";
  system.stateVersion = "24.11";
}
