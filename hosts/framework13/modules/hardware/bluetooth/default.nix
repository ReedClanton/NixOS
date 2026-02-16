{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/bluetooth/default.nix";
    # Used when no action needs to be taken.
    do-nothing = "./../../../../../do-nothing.nix";
    # Tracks location of global bluetooth configuration.
    global-bluetooth-configuration = "./../../../../../modules/nixos/hardware/bluetooth/default.nix";
  in [
    # Setup bluetooth.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-bluetooth-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-bluetooth-configuration}")
      else
        trivial.warn
          "${current-file-path}: Common bluetooth configuration file (${global-bluetooth-configuration}) couldn't be found. Bluetooth will not be configured."
          ./. + (builtins.substring 1 9999 "${do-nothing}")
    )
  ];
  # Turn Bluetooth on. Defaults to off in global configuration.
  hardware.bluetooth.powerOnBoot = lib.mkForce true;
}

