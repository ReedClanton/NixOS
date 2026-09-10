{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/sound/default.nix";
    # Used when no action needs to be taken.
    do-nothing = "./../../../../../do-nothing.nix";
    # Tracks location of global sound configuration.
    global-sound-configuration = "./../../../../../modules/nixos/hardware/sound/default.nix";
  in [
    # Setup printing.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-sound-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-sound-configuration}")
      else
        trivial.warn
          "${current-file-path}: Common sound configuration file (${global-sound-configuration}) couldn't be found. Sound will not be configured."
          ./. + (builtins.substring 1 9999 "${do-nothing}")
    )
  ];
}

