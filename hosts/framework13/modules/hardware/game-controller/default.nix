{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/game-controller/default.nix";
    # Used when no action needs to be taken.
    do-nothing = "./../../../../../do-nothing.nix";
    # Tracks location of global game controller configuration.
    global-game-controller-configuration = "./../../../../../modules/nixos/hardware/game-controller/default.nix";
  in [
    # Setup game controller(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-game-controller-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-game-controller-configuration}")
      else
        trivial.warn
          "${current-file-path}: Common game controller configuration file (${global-game-controller-configuration}) couldn't be found. Game controller(s) will not be configured."
          ./. + (builtins.substring 1 9999 "${do-nothing}")
    )
  ];
}

