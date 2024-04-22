{ lib, pkgs, ... }: {
  imports = [
    # Power usage measuring tool.
    ../powerstat.nix
  ];

  # GNOME turns this on and it conflicts with `tlp`.
  services.power-profiles-daemon.enable = lib.mkForce false;

  # Configure power usage.
  services.tlp = {
    enable = true;
    settings = {
      ## CPU ##
      # AMD/Intel.
      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "guided";

      # AMD/Intel.
      # Note(s):
      #   - Only supported on modern hardware.
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # Intel.
      # Note(s):
      #   - Only supported on modern hardware.
      #   - `CPU_DRIVER_OPMODE_ON_AC/BAT` must be `active`.
      CPU_HWP_DYN_BOOST_ON_AC = true;
      CPU_HWP_DYN_BOOST_ON_BAT = false;

      # Intel.
      # Note(s):
      #   - Only supported on modern hardware.
      #   - `CPU_DRIVER_OPMODE_ON_AC/BAT` must be `active`.
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MAX_PERF_ON_BAT = 75;
      CPU_MIN_PERF_ON_AC = 10;
      CPU_MIN_PERF_ON_BAT = 1;

      # AMD/Intel.
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      ## GPU/Graphics ##
      # NoOp

      ## Memory/RAM/Sleep ##
      MEM_SLEEP_ON_AC = "s2idle";
      MEM_SLEEP_ON_BAT = "deep";

      ## Platform ##
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      ## Audio/Sound ##
      # Enter audio power saving mode after this many second(s) (0 for off).
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;

      ## USB ##
      USB_AUTOSUSPEND = false;
      USB_AUTOSUSPEND_DISABLE_ON_SHUTDOWN = true;
      USB_EXCLUDE_AUDIO = true;
      USB_EXCLUDE_BTUSB = true;
      USB_EXCLUDE_PHONE = true;
      USB_EXCLUDE_PRINTER = true;
      USB_EXCLUDE_WWAN = true;

      ## Battery ##
      # Note(s):
      #   - Must be set by host (when relevant/supported).
      #   - Not supported on all, or even most, hardware.
      # Start charging once bellow this.
      START_CHARGE_THRESH_BAT0 = 60;
      # Stop charging once above this.
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}

