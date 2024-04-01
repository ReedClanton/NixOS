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
          # Boot.
          ESP = {
            type = "EF00";
            size = "500M";
            start = "1M";
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
#            size = "100%";
            end = "-131G";
#            name = "${host}-root";
#            label = "${host}-root";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
          # Swap RAID 0.
          mdadm = {
            size = "130G";
            content = {
              type = "mdraid";
              name = "raid0";
            };
          };
        };
      };
  };
  disko.devices.disk.disk1 = {
      type = "disk";
      device = "/dev/nvme1n1";
      content = {
        type = "gpt";
        partitions = {
          # Home.
          home = {
#            size = "100%";
            start = "1M";
            end = "-131G";
#            name = "${host}-home";
#            label = "${host}-home";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
          # Swap RAID 0.
          mdadm = {
            size = "130G";
            content = {
              type = "mdraid";
              name = "raid0";
            };
          };
        };
      };
  };

  # Setup RAID 0 swap.
  disko.devices.mdadm.raid0 = {
    type = "mdadm";
    level = 0;
    content = {
      type = "gpt";
      partitions.swap = {
        size = "100%";
        content = {
          type = "swap";
          # Marks this device as the one that's used to resume from hibernation.
          resumeDevice = true;
        };
      };
    };
  };
}

