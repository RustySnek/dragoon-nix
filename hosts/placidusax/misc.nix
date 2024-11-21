{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xdg-utils
    glib
    dracula-theme # gtk themeracula-theme # gtk theme
    gnome3.adwaita-icon-theme # default gnome cursors
    gnome3.adwaita-icon-theme # default gnome cursors
    xorg.xeyes
  ];

  services.dbus.enable = true;
  security.polkit.enable = true;
}
