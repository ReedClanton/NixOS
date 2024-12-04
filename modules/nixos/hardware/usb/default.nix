{ pkgs, ... }: {
  # Service for automatically mounting iOS devices.
  services.usbmuxd.enable = true;
  environment.systemPackages = with pkgs; [
    libimobiledevice
    # Optional: Used to mount using `ifuse`.
    ifuse
  ];
}

