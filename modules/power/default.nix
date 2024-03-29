{ ... }: {
  powerManagement = {
    # Set CPU minimum and maximum frequency.
    #   Note(s):
    #     - Should only be set by host (not here).
#    cpufreq = {
#      min = 800000;
#      max = 2200000;
#    };
    # Frequencies allowed by the kernel. Default is `performance` set by kernel.
    #   Value(s):
    #     - ondemand
    #     - performance
    #     - powersave
    cpuFreqGovernor = "ondemand";
    # CPU auto tuned power saving at startup.
    #   Note(s):
    #     - Good for mobile devices.
    powertop.enable = false;
  };
}

