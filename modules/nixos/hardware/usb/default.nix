{ pkgs, ... }: {
  # Service for automatically mounting iOS devices.
  # Note(s):
  #    - Hasn't worked for me. I've had to use `ifuse` to mount iOS devices.
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
  environment.systemPackages = with pkgs; [
    # Includes packages for USB tethering.
    # Note(s):
    #    - Haven't been able to get USB tethering to work. Might have to do with my usage of wpa.
    libimobiledevice
    ifuse
  ];
}

