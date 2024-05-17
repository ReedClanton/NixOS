{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "host/${host}/modules/virtualization/default.nix";
    # Tracks location of file that configures guest virtualization.
    virtualization-setup = "./../../../../modules/nixos/virtualization/guest.nix";
  in [
    # Call generic guest virtualization configuration.
    (if builtins.pathExists (./. + (builtins.substring 1 9999 "${virtualization-setup}")) then
      ./. + (builtins.substring 1 9999 "${virtualization-setup}")
    else
      trivial.warn
        "${current-file-path}: Common guest virtualization setup not found (${virtualization-setup}), guest virtualization won't be configured."
        ../../../../do-nothing.nix)
  ];
}

