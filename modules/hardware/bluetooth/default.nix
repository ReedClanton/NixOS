{ config, ... }: {
  hardware.bluetooth = {
    enable = true;
    # Enable support for hsphfpd protocol used by audio devices (experimental).
    #   Note(s):
    #     - Conflicts with wireplumber (pipewire) and duplicates functionality.
    hsphfpd.enable = false;
    # Determines if bluetooth should be on and searching upon boot.
    powerOnBoot = false;
    # Report headphones' battery level to UPower.
    settings.General = {
      Experimental = config.services.upower.enable;
      KernelExperimental = config.services.upower.enable;
    };
  };
}
