{ host, inputs, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  disko.devices.disk.disk0 = {
    type = "disk";
    # Note(s):
    #   - Must be set by each host.
    device = "/dev/disk/by-id/ata-VBOX_HARDDISK_VBc33972aa-b029f834";
    content = {
      type = "gpt";
      partitions = {
        # Boot.
        ESP = {
          type = "EF00";
          start = "1M";
          end = "1025M";
          priority = 0;
          name = "BOOT";
          label = "BOOT";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        # Root.
        root = {
          size = "100%";
#          start = "1026M";
          # Note(s):
          #   - Must be set by each host.
#          end = "113666M";
          name = "${host}-root";
          label = "${host}-root";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
        # Home.
#        luks = {
#          size = "100%";
#          name = "${host}-home";
#          label = "${host}-home";
#          content = {
#            type = "luks";
#            name = "${host}-home";
#            label = "${host}-home";
#            content = {
#              type = "lvm_pv";
#              vg = "pool";
#            };
#          };
#        };
      };
    };
  };
}

