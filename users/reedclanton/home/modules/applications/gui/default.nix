{ lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/applications/gui/default.nix";
    # Tracks location of local flatpak package manager configuration.
    local-flatpak-configuration = "./flatpaks/default.nix";
    # Tracks location of global flatpak package manager configuration.
    global-flatpak-configuration = "./../../../../../../modules/home-manager/applications/gui/flatpaks/default.nix";
    # Tracks location of file that installs flatpak(s).
    local-flatpak-applications = "./flatpaks/applications/default.nix";
    # Tracks location of file that installs global flatpak(s).
    global-flatpak-applications = "./../../../../../../modules/home-manager/applications/gui/flatpaks/applications/default.nix";
    # Tracks location of file that installs local package(s).
    local-package-applications = "./packages/default.nix";
    # Tracks location of file that installs global package(s).
    global-package-applications = "./../../../../../../modules/home-manager/applications/gui/packages/default.nix";
    # Tracks location of file that installs local program(s).
    local-program-applications = "./programs/default.nix";
    # Tracks location of file that install global program(s).
    global-program-applications = "./../../../../../../modules/home-manager/applications/gui/programs/default.nix";
  in [
    # Setup flatpak package manager.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-flatpak-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-flatpak-configuration}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no flatpak package manager configuration (${local-flatpak-configuration}), calling common module (${global-flatpak-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-flatpak-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-flatpak-configuration}")
            else
              throw "${current-file-path}: Common flatpak package manager configuration file (${global-flatpak-configuration}) couldn't be found. Flatpak package manager must be configured for all GUI applications to be installed."
          )
    )
    # Install flatpak(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-flatpak-applications}")) then
        ./. + (builtins.substring 1 9999 "${local-flatpak-applications}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no flatpak(s) installed (${local-flatpak-applications}), calling common module (${global-flatpak-applications})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-flatpak-applications}")) then
              ./. + (builtins.substring 1 9999 "${global-flatpak-applications}")
            else
              trivial.warn
                "${current-file-path}: Common flatpak(s) install not found (${global-flatpak-applications}). No Flatpaks will be installed by Home Manager."
                ../../../../../../do-nothing.nix
          )
    )
    # Install package(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-package-applications}")) then
        ./. + (builtins.substring 1 9999 "${local-package-applications}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no packages installed (${local-package-applications}), calling common module (${global-package-applications})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-package-applications}")) then
              ./. + (builtins.substring 1 9999 "${global-package-applications}")
            else
              trivial.warn
                "${current-file-path}: Common packages install not found (${global-package-applications}). No packages will be installed by Home Manager."
                ../../../../../../do-nothing.nix
          )
    )
    # Install program(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-program-applications}")) then
        ./. + (builtins.substring 1 9999 "${local-program-applications}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no programs installed (${local-program-applications}), calling common module (${global-program-applications})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-program-applications}")) then
              ./. + (builtins.substring 1 9999 "${global-program-applications}")
            else
              trivial.warn
                "${current-file-path}: Common program install not found (${global-program-applications}). No program will be installed by Home Manager."
                ../../../../../../do-nothing.nix
          )
    )
  ];
}

