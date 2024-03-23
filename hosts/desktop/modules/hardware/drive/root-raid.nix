{ pkgs, ... }: {
  # Used to configure software RAID.
  environment.systemPackages = with pkgs; [ mdadm ];

  # TODO: Mount RAID used to host OS. This may end up being handled by host hardware-configuration.nix file.
#  fileSystems."/" = {
#    device = "/dev/disk/by-name/ROOT_RAID";
#    fsType = "ext4";
#  };
}
