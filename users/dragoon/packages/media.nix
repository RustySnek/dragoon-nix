{pkgs, ...}: {
  home.packages = with pkgs; [
    ouch
    mpv
    gscreenshot
    ffmpeg-full
    qbittorrent
  ];
}
