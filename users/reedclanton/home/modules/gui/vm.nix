{ host, lib, ui, user, ... }: with lib; {
  # TODO: Comment and update README.md.
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/gui/vm.nix";
    # Tracks location of local flatpak package manager configuration.
    local-flatpak-configuration = "./../applications/gui/flatpaks/default.nix";
    # Tracks location of the local Flatpak(s) that will be installed.
    brave-flatpak = "./flatpaks/applications/brave.nix";
    libre-office-flatpak = "./flatpaks/applications/libre-office.nix";
    tor-browser-launcher-flatpak = "./flatpaks/applications/tor-browser-launcher.nix";
    # Tracks location of common (global) home-manager Flatpak application(s).
    global-flatpak-applications = "./../../../../../modules/home-manager/applications/gui/flatpaks/applications/default.nix";
    # Tracks location of common (global) home-manager GUI packages & programs that should be
    # installed.
    gedit-package = "./../../../../../modules/applications/gui/packages/gedit.nix";
    firefox-program = "./../../../../../modules/applications/gui/programs/firefox.nix";
    # Tracks location of file that installs GUI program(s).
    program-applications = "./programs/default.nix";
    # Tracks location of local home-manager Desktop Environment (DE) configuration.
    local-de-configuration = "./${ui}/default.nix";
    # Tracks location of common (global) home-manager Desktop Environment (DE) configuration.
    global-de-configuration = "./../../../../../modules/home-manager/gui/${ui}/default.nix";
  in [
    # Configure flatpak package manager.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-flatpak-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-flatpak-configuration}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no home-manager flatpak package manager configuration (${local-flatpak-configuration})..."
          ../../../../../do-nothing.nix
    )
    # Install some flatpak(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${brave-flatpak}")) then
        ./. + (builtins.substring 1 9999 "${brave-flatpak}")
      else
        trivial.warn
          "${current-file-path}: The Brave Flatpak (${brave-flatpak}) is an expected application in the user's (${user.name}) home-manger configuration for the '${host}' host. This application will be missing..."
          ../../../../../do-nothing.nix
    )
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${libre-office-flatpak}")) then
        ./. + (builtins.substring 1 9999 "${libre-office-flatpak}")
      else
        trivial.warn
          "${current-file-path}: The Libre Office (${libre-office-flatpak}) is an expected application in the user's (${user.name}) home-manager configuration for the '${host}' host. This application will be missing..."
          ../../../../../do-nothing.nix
    )
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${tor-browser-launcher-flatpak}")) then
        ./. + (builtins.substring 1 9999 "${tor-browser-launcher-flatpak}")
      else
        trivial.warn
          "${current-file-path}: The Tor Browser Launcher Flatpak (${tor-browser-launcher-flatpak}) is an expected application in the user's (${user.name}) home-manger configuration for the '${host}' host. This application will be missing..."
          ../../../../../do-nothing.nix
    )
    # Install common (global) Flatpak(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-flatpak-applications}")) then
        ./. + (builtins.substring 1 9999 "${global-flatpak-applications}")
      else
        ../../../../../do-nothing.nix
    )
    # Install some package(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${gedit-package}")) then
        ./. + (builtins.substring 1 9999 "${gedit-package}")
      else
        ../../../../../do-nothing.nix
    )
    # Install some program(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${firefox-program}")) then
        ./. + (builtins.substring 1 9999 "${firefox-program}")
      else
        ../../../../../do-nothing.nix
    )
    # Run local DE configuration if running a GUI.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-de-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-de-configuration}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no home-manager specific, host independent, desktop environment configuration found (${local-de-configuration}) for this host (${host})..."
          ../../../../../do-nothing.nix
    )
    # Run common (global) DE configuration.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-de-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-de-configuration}")
      else
        trivial.warn
          "${current-file-path}: No common home-manager specific, host (${host}) & user (${user.name}) independent, desktop environment configuration found (${global-de-configuration})..."
          ../../../../../do-nothing.nix
    )
  ];
}

