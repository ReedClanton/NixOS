{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error message(s).
    current-file-path = "host/${host}/modules/applications/tty/programs/default.nix";
    # Tracks path to file that installs host independent program(s).
    program-setup = "./../../../../../../modules/nixos/applications/tty/programs/default.nix";
  in [
    # Install common program(s).
    (if builtins.pathExists (./. + (builtins.substring 1 9999 "${program-setup}")) then
      ./. + (builtins.substring 1 9999 "${program-setup}")
    else
      trivial.warn
        "${current-file-path}: Common program(s) to install couldn't be found (${program-setup}), skipping."
        ../../../../../../do-nothing.nix)
  ];
}

