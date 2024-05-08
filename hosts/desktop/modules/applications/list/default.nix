{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "host/${host}/modules/applications/list/default.nix";
    # Tracks location of file that generates NixOS install list.
    install-list = "./../../../../../modules/nixos/applications/list/default.nix";
  in [
    # Generate list of what's installed.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${install-list}")) then
        ./. + (builtins.substring 1 9999 "${install-list}")
      else
        trivial.warn
          "${current-file-path}: Common install list generation not found (${install-list}), list won't be generated."
          ../../../../../do-nothing.nix
    )
  ];
}

