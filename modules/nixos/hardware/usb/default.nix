{ pkgs, ... }: {
  boot.kernelModules = [
    "ipheth"
  ];
  # Service for automatically mounting iOS devices.
  services = {
    gvfs.enable = true;
    usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
    };
  };
  environment.systemPackages = with pkgs; [
    # Includes packages for USB tethering.
    # Note(s):
    #    - Haven't been able to get USB tethering to work. Might have to do with my usage of wpa.
    libimobiledevice
    ifuse
  ];
}

