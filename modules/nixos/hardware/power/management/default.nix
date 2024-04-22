{ pkgs, ... }: {
  imports = [
    # Power usage measuring tool.
    ../powerstat.nix
  ];

  environment.systemPackages = with pkgs; [
    powertop
  ];

  powerManagement = {
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

