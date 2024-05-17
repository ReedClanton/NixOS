{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error message(s).
    current-file-path = "host/${host}/modules/applications/tty/packages/default.nix";
    # Tracks path to file that installs host independent package(s).
    package-setup = "./../../../../../../modules/nixos/applications/tty/packages/default.nix";
  in [
    # Install common package(s).
    (if builtins.pathExists (./. + (builtins.substring 1 9999 "${package-setup}")) then
      ./. + (builtins.substring 1 9999 "${package-setup}")
    else
      trivial.warn
        "${current-file-path}: Common package(s) to install couldn't be found (${package-setup}), skipping."
        ../../../../../../do-nothing.nix)
  ];
}

