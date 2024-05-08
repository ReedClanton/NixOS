{ lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/applications/gui/flatpaks/default.nix";
    # Tracks location of global flatpak package manager configuration.
    global-flatpak-configuration = "./../../../../../../../modules/home-manager/applications/gui/flatpaks/default.nix";
  in [
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-flatpak-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-flatpak-configuration}")
      else
        throw "${current-file-path}: Common flatpak package manager configuration file (${global-flatpak-configuration}) couldn't be found. Flatpak package manager must be configured for flatpak(s) to be installed."
    )
  ];
}

