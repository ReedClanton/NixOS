{ ... }: {
  imports = [
    ../../../../../../modules/nixos/hardware/power/tlp
  ];

  # Configure power usage.
  services.tlp.settings = {
    ## CPU ##
    # AMD/Intel.
    # TODO(s):
    #   - Test on desktop.
    CPU_DRIVER_OPMODE_ON_AC = "active";

    # AMD/Intel.
    # Note(s):
    #   - Use output of `tlp-stat -p` to determine values.
    #   - `CPU_DRIVER_OPMODE_ON_AC/BAT` must *not* be `active`.
#    CPU_SCALING_MAX_FREQ_ON_AC = 4700000;
#    CPU_SCALING_MIN_FREQ_ON_AC = 2550000;

    ## GPU/Graphics ##
    # AMD ATI (Legacy)
    # TODO(s):
    #   - Test on desktop.
    #   - Choose desktop values.
#    RADEON_POWER_PROFILE_ON_AC = "high";

    ## Memory/RAM/Sleep ##
    # TODO:
    #   - Test on desktop.
    #   - Choose desktop default.
#    MEM_SLEEP_ON_AC = "s2idle";

    ## Platform ##
    # NoOp

    ## Audio/Sound ##
    # NoOp

    ## Battery ##
    # NoOp
  };
}

