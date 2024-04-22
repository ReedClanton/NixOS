{ ... }: {
  imports = [
    ../../../../../../modules/nixos/hardware/power/tlp
  ];

  # Configure power usage.
  services.tlp.settings = {
    ## CPU ##
    # AMD/Intel.
    # Note(s):
    #   - Use output of `tlp-stat -p` to determine values.
    #   - `CPU_DRIVER_OPMODE_ON_AC/BAT` must *not* be `active`.
    CPU_SCALING_MAX_FREQ_ON_BAT = 2550000;
    CPU_SCALING_MIN_FREQ_ON_BAT = 400000;

    ## GPU/Graphics ##
    # Intel.
    # Note(s):
    #   - Use output of `tlp-stat -g` to determine values.
    INTEL_GPU_BOOST_FREQ_ON_AC = 1300;
    INTEL_GPU_BOOST_FREQ_ON_BAT = 1000;
    INTEL_GPU_MAX_FREQ_ON_AC = 1300;
    INTEL_GPU_MAX_FREQ_ON_BAT = 800;
    INTEL_GPU_MIN_FREQ_ON_AC = 200;
    INTEL_GPU_MIN_FREQ_ON_BAT = 100;

    ## Memory/RAM/Sleep ##
    # NoOp

    ## Platform ##
    # NoOp

    ## Audio/Sound ##
    # NoOp

    ## Battery ##
    # NoOp
  };
}

