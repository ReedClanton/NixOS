{ pkgs, lib, ... }: {
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
      # TODO(s):
      #   - Test on desktop.
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
      # Note(s):
      #   - Must be set by host.
      #   - Use output of `tlp-stat -p` to determine values.
      #   - `CPU_DRIVER_OPMODE_ON_AC/BAT` must *not* be `active`.
#      CPU_SCALING_MAX_FREQ_ON_AC = 4700000;
#      CPU_SCALING_MAX_FREQ_ON_BAT = 2550000;
#      CPU_SCALING_MIN_FREQ_ON_AC = 2550000;
#      CPU_SCALING_MIN_FREQ_ON_BAT = 400000;

      # AMD/Intel.
      # Note(s):
      #   - Must be set by host.
      #   - These defaults are for a Framework 13 11th generation.
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      ## GPU/Graphics ##
      # Intel.
      # Note(s):
      #   - Must be set by host (when relevant).
      #   - Use output of `tlp-stat -g` to determine values.
#      INTEL_GPU_BOOST_FREQ_ON_AC = 1300;
#      INTEL_GPU_BOOST_FREQ_ON_BAT = 1000;
#      INTEL_GPU_MAX_FREQ_ON_AC = 1300;
#      INTEL_GPU_MAX_FREQ_ON_BAT = 800;
#      INTEL_GPU_MIN_FREQ_ON_AC = 200;
#      INTEL_GPU_MIN_FREQ_ON_BAT = 100;

      # AMD ATI (Legacy)
      # Note(s):
      #   - Must be set by host (when relevant).
      # TODO(s):
      #   - Test on desktop.
      #   - Choose desktop values.
#      RADEON_POWER_PROFILE_ON_AC = "high";
#      RADEON_POWER_PROFILE_ON_BAT = "auto";

      ## Memory/RAM/Sleep ##
      # TODO:
      #   - Test on Framwork
      #   - Choose Framework default
      #   - Test on desktop.
      #   - Choose desktop default.
      #   - Choose default for here.
#      MEM_SLEEP_ON_AC = "s2idle";
#      MEM_SLEEP_ON_BAT = "deep";

      ## Platform ##
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      ## Audio/Sound ##
      # Enter audio power saving mode after this many second(s) (0 for off).
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;

      ## Battery ##
      # Note(s):
      #   - Must be set by host.
      #   - Not supported on all, or even most, hardware.
      # Start charging once bellow this.
#      START_CHARGE_THRESH_BAT0 = 60;
      # Stop charging once above this.
#      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}

