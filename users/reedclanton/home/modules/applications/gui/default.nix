{ lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/applications/gui/default.nix";
    # Tracks location of flatpak package manager configuration.
    flatpak-configuration = "./flatpaks/default.nix";
    # Tracks location of file that installs flatpak(s).
    flatpak-applications = "./flatpaks/applications/default.nix";
    # Tracks location of file that installs GUI package(s).
    package-applications = "./packages/default.nix";
    # Tracks location of file that installs GUI program(s).
    program-applications = "./programs/default.nix";
  in [
    # Setup flatpak package manager.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${flatpak-configuration}")) then
        ./. + (builtins.substring 1 9999 "${flatpak-configuration}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no Home Manager flatpak package manager configuration (${flatpak-configuration})..."
          ../../../../../../do-nothing.nix
    )
    # Install flatpak(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${flatpak-applications}")) then
        ./. + (builtins.substring 1 9999 "${flatpak-applications}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no Home Manager flatpak(s) installed (${flatpak-applications})..."
          ../../../../../../do-nothing.nix
    )
    # Install package(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${package-applications}")) then
        ./. + (builtins.substring 1 9999 "${package-applications}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no Home Manager packages installed (${package-applications})..."
          ../../../../../../do-nothing.nix
    )
    # Install program(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${program-applications}")) then
        ./. + (builtins.substring 1 9999 "${program-applications}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no Home Manager programs installed (${program-applications})..."
          ../../../../../../do-nothing.nix
    )
  ];
}

