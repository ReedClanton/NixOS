# Note(s):
#   - Other power management tools, like tlp, may overwrite these settings.

{ lib, ... }: {
  imports = [ ../../../../../../modules/nixos/hardware/power/management ];

  powerManagement = {
    cpuFreqGovernor = lib.mkForce "powersave";
    powertop.enable = lib.mkForce true;
  };
}

