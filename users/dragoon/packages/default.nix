{
  pkgs,
  ...
}: {
  imports = [
    ./enumeration.nix
    ./languages.nix
    ./media.nix
    ./brutal.nix
    ./exploit.nix
  ];
  home.packages = with pkgs; [
    glibc
    wget
    openvpn
    gef
  ];
}
