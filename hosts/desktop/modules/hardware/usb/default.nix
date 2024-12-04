{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/usb/default.nix";
    # Used when no action needs to be taken.
    do-nothing = "./../../../../../do-nothing.nix";
    # Tracks location of global USB configuration.
    global-usb-configuration = "./../../../../../modules/nixos/hardware/usb/default.nix";
  in [
    # Setup USB.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-usb-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-usb-configuration}")
      else
        trivial.warn
          "${current-file-path}: Common USB configuration file (${global-usb-configuration}) couldn't be found. USB will not be configured."
          ./. + (builtins.substring 1 9999 "${do-nothing}")
    )
  ];
}

