{ lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/applications/list/default.nix";
    # Tracks location of file that generates Home Manager package list.
    package-list = "./../../../../../../modules/home-manager/applications/list/default.nix";
  in [
    # Generate package list.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${package-list}")) then
        ./. + (builtins.substring 1 9999 "${package-list}")
      else
        trivial.warn
          "${current-file-path}: Common package list generation not found (${package-list}), package list won't be generated."
          ../../../../../../do-nothing.nix
    )
  ];
}

