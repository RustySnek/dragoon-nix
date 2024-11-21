{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xdg-utils
    glib
    dracula-theme # gtk themeracula-theme # gtk theme
    gnome.adwaita-icon-theme # default gnome cursors
    gnome.adwaita-icon-theme # default gnome cursors
    xorg.xeyes
  ];

  services.dbus.enable = true;
  security.polkit.enable = true;
}
