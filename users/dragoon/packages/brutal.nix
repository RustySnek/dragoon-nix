{pkgs, ...}: {
  home.packages = with pkgs; [
    john
    aircrack-ng
    hashcat
    thc-hydra
    medusa
  ];
}
