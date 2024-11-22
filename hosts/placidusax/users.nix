{
  pkgs,
  ...
}: {
  users.mutableUsers = false;
  programs.fish.enable = true;
  users.users.dragoon = {
    isNormalUser = true;
    extraGroups = ["wheel" "libvirtd" "docker" "adbusers" "input" "video"];
    password = "skyborne";
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
    ];
  };

  environment.persistence."/nix/persist" = {
    users.dragoon.directories = [
      "Projects"
      "Documents"
      "Music"
      "Pictures"
      ".floorp"
    ];
  };
}
