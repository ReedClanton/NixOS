{ host, inputs, lib, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  disko.devices.disk.disk0 = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          # For grub MBR.
          # TODO: Determine if needed.
#          MBR = {
#            type = "EF02";
#            start = "1M";
#            size = "1M";
#          };
          # Boot.
          ESP = {
            type = "EF00";
            size = "500M";
#            name = lib.toUpper "${host}-BOOT";
#            label = lib.toUpper "${host}-BOOT";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          # Root.
          root = {
            size = "100%";
#            name = "${host}-root";
#            label = "${host}-root";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
          # TODO: Swap RAID 0.
        };
      };
  };
  disko.devices.disk.disk1 = {
      type = "disk";
      device = "/dev/nvme1n1";
      content = {
        type = "gpt";
        partitions = {
          # For grub MBR.
          # TODO: Determine if needed.
#          MBR = {
#            type = "EF02";
#            start = "1M";
#            size = "1M";
#          };
          # Home.
          home = {
            size = "100%";
#            name = "${host}-home";
#            label = "${host}-home";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
          # TODO: Add swap raid 0.
        };
      };
  };
}

