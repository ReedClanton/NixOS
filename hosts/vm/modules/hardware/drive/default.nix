{ host, inputs, lib, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  disko.devices.disk.zero = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions =
      let
        second-partition-name = "root";
      in {
        # Boot.
        ESP =
        let
          label-name = lib.toUpper "${host}-boot";
        in {
          type = "EF00";
          start = "1M";
          size = "2049M";
          label = "${label-name}";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        # Root.
        "${second-partition-name}" =
        let
          label-name = "${host}-${second-partition-name}";
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
}

