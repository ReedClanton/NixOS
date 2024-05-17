{ host, ui, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "host/${host}/modules/virtualization/default.nix";
    # Tracks location of file that configures host virtualization.
    virtualization-setup = "./../../../../modules/nixos/virtualization/default.nix";
  in [
    # Determine if host virtualization need be configured.
    (if "${ui}" != "tty" then
      # Call generic host virtualization configuration.
      (if builtins.pathExists (./. + (builtins.substring 1 9999 "${virtualization-setup}")) then
        ./. + (builtins.substring 1 9999 "${virtualization-setup}")
      else
        trivial.warn
          "${current-file-path}: Common host virtualization setup not found (${virtualization-setup}), host virtualization won't be configured."
          ../../../../do-nothing.nix)
    else
      # TTY doesn't need host virtualization setup.
      ../../../../do-nothing.nix)
  ];
}

