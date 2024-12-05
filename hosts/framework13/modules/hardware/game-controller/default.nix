{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/game-controller/default.nix";
    # Tracks the root of this configuration.
    nix-root = "./../../../../../";
    # Used when no action needs to be taken.
    do-nothing = "${nix-root}do-nothing.nix";
    # Tracks the root of game controller configuration file(s).
    game-controller-root = "${nix-root}modules/nixos/hardware/game-controller/";
    # Tracks location of each game controller that a configuration exists for in the order they should be imported.
    global-logitech-wheel-configuration = "${game-controller-root}logitech-wheel.nix";
    global-wheel-configuration = "${game-controller-root}wheel.nix";
    global-game-controller-configuration = "${game-controller-root}default.nix";
  in [
    # Setup game controller(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-logitech-wheel-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-logitech-wheel-configuration}")
      else
        trivial.warn
          "${current-file-path}: Common Logitech wheel game controller configuration file (${global-logitech-wheel-configuration}) couldn't be found. Calling common generic wheel game controller configuration (${global-wheel-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-wheel-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-wheel-configuration}")
            else
              trivial.warn
                "${current-file-path}: Common wheel game controller configuration file (${global-wheel-configuration}) couldn't be found. Calling common generic game controller configuration (${global-game-controller-configuration})..."
                (
                  if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-game-controller-configuration}")) then
                    ./. + (builtins.substring 1 9999 "${global-game-controller-configuration}")
                  else
                    trivial.warn
                      "${current-file-path}: Common game controller configuration file (${global-game-controller-configuration}) couldn't be found. No game controller configuration will be done."
                      ./. + (builtins.substring 1 9999 "${do-nothing}")
                )
          )
    )
  ];
}

