{ host, inputs, lib, pkgs, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  disko.devices.disk.zero = {
    type = "disk";
    device = "/dev/disk/by-id/ata-Samsung_SSD_840_Series_S14CNEACB89263P";
    content = {
      type = "gpt";
      # Boot.
      partitions.ESP = {
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
  disko.devices.disk.one = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions =
      let
        first-partition-name = "root";
      in {
        # Root.
        "${first-partition-name}" =
        let
          label-name = "${host}-${first-partition-name}";
        in {
          size = "100%";
          start = "1M";
          label = "${label-name}";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
  disko.devices.disk.two = {
    type = "disk";
    device = "/dev/nvme1n1";
    content = {
      type = "gpt";
      partitions =
      let
        first-partition-name = "home";
        second-partition-name = "swap";
      in {
        # Home.
        "${first-partition-name}" =
        let
          label-name = "${host}-${first-partition-name}";
        in {
          size = "100%";
          start = "1M";
          label = "${label-name}";
          content = {
            type = "luks";
            name = "${label-name}";
            settings.allowDiscards = true;
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
        };
        # Swap.
        swap =
        let
          label-name = "${host}-${second-partition-name}";
        in {
          # 130G.
          start = "-133121M";
          end = "-1M";
          label = "${label-name}";
          content = {
            type = "swap";
            # Marks this device as the one that's used to resume from hibernation.
            resumeDevice = true;
          };
        };
      };
    };
  };
  # Setup backup hard drive(s).
  disko.devices.disk.three = {
    type = "disk";
    device = "/dev/disk/by-id/ata-ST3320820AS_9QF2Q882";
    content = {
      type = "gpt";
      # Used for backup of only most critical file(s) (due to small size of disk).
      partitions =
      let
        first-partition-name = "bk-320";
      in {
        "${first-partition-name}" =
        let
          label-name = "${host}-${first-partition-name}";
        in {
          size = "100%";
          start = "1M";
          label = "${label-name}";
          content = {
            type = "filesystem";
            format = "ext4";
            # Not critical to system boot so don't allow boot halt.
            mountOptions = [ "nofail" ];
            mountpoint = "/mnt/${label-name}";
          };
        };
      };
    };
  };
  disko.devices.disk.four = {
    type = "disk";
    device = "/dev/disk/by-id/ata-Hitachi_HDS721050CLA362_JP8522HR3U16AV";
    content = {
      type = "gpt";
      partitions =
      let
        first-partition-name = "bk-500";
      in {
        "${first-partition-name}" =
        let
          label-name = "${host}-${first-partition-name}";
        in {
          size = "100%";
          start = "1M";
          label = "${label-name}";
          content = {
            type = "filesystem";
            format = "ext4";
            # Not critical to system boot so don't allow boot halt.
            mountOptions = [ "nofail" ];
            mountpoint = "/mnt/${label-name}";
          };
        };
      };
    };
  };
#  disko.devices.disk.five = {
#    type = "disk";
#    device = "/dev/disk/by-id/usb-XG7000-1_TB_2280_012345678906-0:0";
#    content = {
#      type = "gpt";
#      partitions =
#      let
#        first-partition-name = "usb-1tb";
#      in {
#        "${first-partition-name}" =
#        let
#          label-name = "${host}-${first-partition-name}";
#        in {
#          size = "100%";
#          start = "1M";
#          label = "${label-name}";
#          content = {
#            type = "filesystem";
#            format = "ext4";
#            # Not critical to system boot so don't allow boot halt.
#            mountOptions = [ "nofail" ];
#            mountpoint = "/mnt/${label-name}";
#          };
#        };
#      };
#    };
#  };
  # 40G internal Intel SSD.
  disko.devices.disk.six = {
    type = "disk";
    device = "/dev/disk/by-id/ata-INTEL_SSDSA2CT040G3_CVPR138403A5040AGN";
    content = {
      type = "gpt";
      partitions =
      let
        first-partition-name = "ssd-40";
      in {
        "${first-partition-name}" =
        let
          label-name = "${host}-${first-partition-name}";
        in {
          size = "100%";
          start = "1M";
          label = "${label-name}";
          content = {
            type = "filesystem";
            format = "ext4";
            # Not critical to system boot so don't allow boot halt.
            mountOptions = [ "nofail" ];
            mountpoint = "/mnt/${label-name}";
          };
        };
      };
    };
  };

  # Used to configure software RAID.
  environment.systemPackages = with pkgs; [ mdadm ];
}

