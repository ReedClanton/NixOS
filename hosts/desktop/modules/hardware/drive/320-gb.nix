{ user, ... }: {
  fileSystems."/run/media/${user.name}/320-gb" = {
    device = "/dev/disk/by-label/320-gb";
    fsType = "ext4";
  };
}
