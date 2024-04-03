{ host, inputs, lib, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  disko.devices.disk.disk0 = {
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
          label = lib.toUpper "${host}-boot";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
      };
    };
  };

  disko.devices.disk.disk1 = {
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
  disko.devices.disk.disk2 = {
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

