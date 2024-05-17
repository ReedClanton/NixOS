{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "host/${host}/modules/virtualization/default.nix";
    # Tracks location of file that configures host virtualization.
    virtualization-setup = "./../../../../modules/nixos/virtualization/default.nix";
  in [
    # Generate list of what's installed.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${virtualization-setup}")) then
        ./. + (builtins.substring 1 9999 "${virtualization-setup}")
      else
        trivial.warn
          "${current-file-path}: Common host virtualization setup not found (${virtualization-setup}), host virtualization won't be configured."
          ../../../../do-nothing.nix
    )
  ];
}

