{
  pkgs,
  ...
}:{
  boot.loader = {
    efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = true;
    };
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
  };

  boot.binfmt.emulatedSystems = ["aarch64-linux"];
  boot.kernelPackages = pkgs.unstable.linuxPackages_latest;
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "virtio_blk" "virtio_pci" "sr_mod"];
  boot.kernelModules = ["kvm-amd"];
  boot.initrd.kernelModules = ["nvme" "dm-snapshot" "i2c-dev" "i2c-piix4" "vfio" "vfio_iommu_type1" "vfio_pci"];
  boot.initrd.checkJournalingFS = false;
  services.libinput.enable = true;
  services.spice-vdagentd.enable = true;
  services.xserver = {
    videoDrivers = ["qxl"];
    enable = true;
    xkb.layout = "us";
    desktopManager.xterm.enable = false;

    displayManager.lightdm.enable = true;
    windowManager.i3 = {
      package = pkgs.i3-gaps;
      configFile = ./i3.conf;
      enable = true;
      extraSessionCommands = ''
      xrandr --output Virtual-1 --mode 1920x1080
      '';
    }; 
  };
  services.displayManager.defaultSession = "none+i3";

  boot.blacklistedKernelModules = [];

  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;
}
 
