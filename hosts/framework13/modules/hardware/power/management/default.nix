{# Note(s):
#   - Other power management tools, like tlp, may overwrite these settings.

 lib, ... }: {
  imports = [ ../../../../../../modules/nixos/hardware/power ];

  powerManagement = {
#    cpufreq = {
#      min = 800000;
#      max = 2200000;
#    };
    cpuFreqGovernor = lib.mkForce "powersave";
    powertop.enable = lib.mkForce true;
  };
}

