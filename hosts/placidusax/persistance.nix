{...}: {
  environment.persistence."/nix/persist" = {
    directories = [
      "/var/lib/libvirt"
      "/var/lib/docker"
      "/var/lib/private/navidrome"
    ];
  };
  environment.etc."ssh/ssh_host_rsa_key".source = "/nix/persist/etc/ssh/ssh_host_rsa_key";
  environment.etc."ssh/ssh_host_rsa_key.pub".source = "/nix/persist/etc/ssh/ssh_host_rsa_key.pub";
  environment.etc."ssh/ssh_host_ed25519_key".source = "/nix/persist/etc/ssh/ssh_host_ed25519_key";
  environment.etc."ssh/ssh_host_ed25519_key.pub".source = "/nix/persist/etc/ssh/ssh_host_ed25519_key.pub";
  programs.fuse.userAllowOther = true;
}
