{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/1980-01-01-00-00-00-00";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/nix";
                moutOptions = ["defaults"];
              };
            };
          };
        };
      };
    };
    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "defaults"
          "size=4G"
          "mode=755"
        ];
      };
      "/tmp" = {
        fsType = "tmpfs";
        mountOptions = [
          "size=4G"
        ];
      };
    };
  };
}



