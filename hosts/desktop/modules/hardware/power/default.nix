{ lib, ... }: {
  imports = [ ../../../../../modules/power ];

  powerManagement = {
#    cpufreq = {
#      min = 800000;
#      max = 2200000;
#    };
    cpuFreqGovernor = lib.mkForce "performance";
  };
}

