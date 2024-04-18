{ ... }: {
  services.tlp = {
    enable = true;
    settings = {
      ## CPU ##
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MAX_PERF_ON_AC = 100;
      CPU_MAX_PERF_ON_BAT = 75;
      CPU_MIN_PERF_ON_AC = 10;
      CPU_MIN_PERF_ON_BAT = 0;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      ## Battery ##
      # Start charging once bellow this.
      START_CHARGE_THRESH_BAT0 = 60;
      # Stop charging once above this.
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}

