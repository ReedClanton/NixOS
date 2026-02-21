{ lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/applications/gui/flatpaks/default.nix";
  in [
    # No user specific Flatpak package manager configuration needed over common (global)
    # home-manager configuration.
    ../../../../../../../do-nothing.nix
  ];
}

