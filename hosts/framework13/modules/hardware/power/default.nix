{ lib, ... }: {
  imports = [ ../../../../../modules/hardware/power ];

  powerManagement = {
#    cpufreq = {
#      min = 800000;
#      max = 2200000;
#    };
    cpuFreqGovernor = lib.mkForce "powersave";
    powertop.enable = lib.mkForce true;
  };
}

