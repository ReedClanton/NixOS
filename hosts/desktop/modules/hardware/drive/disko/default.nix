{ host, inputs, lib, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  disko.devices.disk.zero = {
    type = "disk";
    device = "/dev/sda";
    content = {
      type = "gpt";
      partitions = {
        # Boot.
        ESP = {
          type = "EF00";
          start = "1M";
          size = "2049M";
          label = lib.toUpper "${host}-boot-p0";
          content = {
            type = "mdraid";
            name = "boot";
          };
        };
      };
    };
  };

  disko.devices.disk.one = {
    type = "disk";
    device = "/dev/sdb";
    content = {
      type = "gpt";
      # Boot RAID 0.
      partitions.ESP = {
        type = "EF00";
        start = "1M";
        size = "2049M";
        label = lib.toUpper "${host}-boot-p1";
        content = {
          type = "mdraid";
          name = "boot";
        };
      };
    };
  };

  disko.devices.mdadm.boot = {
    type = "mdadm";
    level = 0;
    metadata = "1.0";
    content = {
      type = "filesystem";
      format = "vfat";
      mountpoint = "/boot";
    };
  };

  disko.devices.disk.two = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      # Root.
      partitions.root = {
        size = "100%";
        start = "1M";
        label = "${host}-root";
        content = {
          type = "filesystem";
          format = "ext4";
          mountpoint = "/";
        };
      };
    };
  };
  disko.devices.disk.three = {
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
          content = {
            type = "luks";
            name = "${host}-home";
            settings.allowDiscards = true;
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
        };
        # Swap.
        swap = {
          # 130G.
          start = "-133121M";
          end = "-1M";
          label = "swap";
          content = {
            type = "swap";
            # Marks this device as the one that's used to resume from hibernation.
            resumeDevice = true;
          };
        };
      };
    };
  };

#  swapDevices = [
#    { device = "/dev/by-label/swap"; }
#  ];
}

