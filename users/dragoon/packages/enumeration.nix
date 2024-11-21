{pkgs, ...}: {
  home.packages = with pkgs; [
      rustscan
      gobuster
      zap
      wireshark
      lsof
      inetutils
      enum4linux
      rustcat
  ];
}
