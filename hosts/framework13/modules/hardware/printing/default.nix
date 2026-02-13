{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/printing/default.nix";
    # Used when no action needs to be taken.
    do-nothing = "./../../../../../do-nothing.nix";
    # Tracks location of global printing configuration.
    global-printing-configuration = "./../../../../../modules/nixos/hardware/printing/default.nix";
  in [
    # Setup printing.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-printing-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-printing-configuration}")
      else
        trivial.warn
          "${current-file-path}: Common printing configuration file (${global-printing-configuration}) couldn't be found. Printing will not be configured."
          ./. + (builtins.substring 1 9999 "${do-nothing}")
    )
  ];
}

