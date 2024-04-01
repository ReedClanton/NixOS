{ host, inputs, lib, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  disko.devices.disk = {
    disk0 =
    let
      first-partition-start-in-M = 1;
    in {
      type = "disk";
      # TODO: Add id.
      device = "/dev/disk/by-id/<idHere>";
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
            start = "${first-partition-start-in-M}M";
            size = "1G";
            name = lib.toUpper "${host}-BOOT";
            label = lib.toUpper "${host}-BOOT";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          # Root.
          root = {
            # TODO: Set size.
            size = "100%";
#            start = "1026M";
#            end = "113666M";
            name = "${host}-root";
            label = "${host}-root";
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
    disk1 = {
      type = "disk";
      # TODO: Add id.
      device = "/dev/disk/by-id/<idHere>";
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
            # TODO: Set size once swap added.
            size = "100%";
#            start = "1026M";
#            end = "113666M";
            name = "${host}-home";
            label = "${host}-home";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
          # TODO: Add swap raid 0.
        };
      };
    };
  };
}

