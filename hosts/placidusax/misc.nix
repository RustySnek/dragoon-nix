{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xdg-utils
    glib
    dracula-theme
    gnome.adwaita-icon-theme
    xorg.xeyes
  ];

  services.dbus.enable = true;
  security.polkit.enable = true;
}
