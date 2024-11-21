{pkgs, ...}: {
  home.packages = with pkgs; [
      python312
      jre8
  ];
}
