# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  ## Bootloader ##
  loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
    
  ## Kernal(s) ##
  # TODO: Determine how to install multiple kernels and boot into the latest automatically.
#  kernelPackages = pkgs.linuxPackages_latest;

  ## Kernel Module(s) ##
  # TODO: Dynamicly determine what module(s) should be used based on hardware.
  # Tempeture monitoring:    Intel      AMD
#  initrd.kernelModules = [ "coretemp" "k10temp" ];
}
