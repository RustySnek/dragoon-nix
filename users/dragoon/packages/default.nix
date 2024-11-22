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
  
  home.file."wordlists" = {
    force = true;
    source = "${pkgs.seclists}/share/wordlists/seclists";
    recursive = false;
  };

  home.packages = with pkgs; [
    glibc
    wget
    openvpn
    gef
  ];
}
