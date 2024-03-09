{ ... }: {
  fileSystems."/home" = {
    device = "/dev/disk/by-label/Data";
    fsType = "ext4";
  };
}
