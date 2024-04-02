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
            start = "1M";
            size = "500M";
            label = lib.toUpper "${host}-BOOT";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          # Root.
          root = {
            size = "100%";
            label = "${host}-root";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
          # Swap RAID 0.
          mdadm = {
            # 80G.
            start = "-81921M";
            end = "-1M";
            label = "swap-p0";
            content = {
              type = "mdraid";
              name = "swap";
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
            size = "100%";
            start = "1M";
            label = "${host}-home";
#            content = {
#              type = "luks";
#              name = "${host}-home";
#              settings.allowDiscards = true;
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
              };
#            };
          };
          # Swap RAID 0.
          mdadm = {
            # 80G.
            start = "-81921M";
            end = "-1M";
            label = "swap-p1";
            content = {
              type = "mdraid";
              name = "swap";
            };
          };
        };
      };
  };

  # Setup RAID 0 swap.
  disko.devices.mdadm.swap = {
    type = "mdadm";
    level = 0;
    content = {
      type = "gpt";
      partitions.swap = {
        size = "100%";
        label = "swap";
        content = {
          type = "swap";
          # Marks this device as the one that's used to resume from hibernation.
          resumeDevice = true;
        };
      };
    };
  };

  swapDevices = [
    { device = "/dev/by-label/swap"; }
  ];
}

