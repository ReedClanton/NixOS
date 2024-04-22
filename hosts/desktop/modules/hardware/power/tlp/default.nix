{ ... }: {
  imports = [
    ../../../../../../modules/nixos/hardware/power/tlp
  ];

  # Configure power usage.
  services.tlp.settings = {
    ## CPU ##
    # NoOp

    ## GPU/Graphics ##
    # AMD ATI (Legacy)
    RADEON_POWER_PROFILE_ON_AC = "high";

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

