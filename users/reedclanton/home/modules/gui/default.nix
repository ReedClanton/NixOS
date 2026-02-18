{ ui, lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/gui/default.nix";
    # Tracks location of local home-manager GUI flatpak/package/program configuration.
    local-application-configuration = "./../applications/gui/default.nix";
    # Tracks location of common (global) home-manager GUI flatpak/package/program configuration.
    global-application-configuration = "./../../../../../modules/home-manager/applications/gui/default.nix";
    # Tracks location of local home-manager Desktop Environment (DE) configuration.
    local-de-configuration = "./${ui}/default.nix";
    # Tracks location of common (global) home-manager Desktop Environment (DE) configuration.
    global-de-configuration = "./../../../../../modules/home-manager/gui/${ui}/default.nix";
  in [
    # Install local (user specific) GUI application(s) if running a GUI.
    (
      if "${ui}" != "tty" && builtins.pathExists (./. + (builtins.substring 1 9999 "${local-application-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-application-configuration}")
      else (
        if "${ui}" != "tty" then
          trivial.warn
            "${current-file-path}: User '${user.name}' has no home-manager specific GUI application configuration (${local-application-configuration})..."
            ../../../../../do-nothing.nix
        else
          # Don't care, not running a GUI.
          ../../../../../do-nothing.nix
      )
    )
    # Install common (global) home-manager GUI application(s) if running a GUI.
    (
      if "${ui}" != "tty" && builtins.pathExists (./. + (builtins.substring 1 9999 "${global-application-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-application-configuration}")
      else (
        if "${ui}" != "tty" then
          trivial.warn
            "${current-file-path}: No common home-manager specific GUI application configuration (${global-application-configuration}) exists..."
            ../../../../../do-nothing.nix
        else
          # Don't care, not running a GUI.
          ../../../../../do-nothing.nix
      )
    )
    # Run local DE configuration if running a GUI.
    (
      if "${ui}" != "tty" && builtins.pathExists (./. + (builtins.substring 1 9999 "${local-de-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-de-configuration}")
      else (
        if "${ui}" != "tty" then
          trivial.warn
            "${current-file-path}: User '${user.name}' has no home-manager specific, host independent, desktop environment configuration found (${local-de-configuration})..."
            ../../../../../do-nothing.nix
        else
          # Don't care, not running a GUI.
          ../../../../../do-nothing.nix
      )
    )
    # Run common (global) DE configuration.
    (
      if "${ui}" != "tty" && builtins.pathExists (./. + (builtins.substring 1 9999 "${global-de-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-de-configuration}")
      else (
        if "${ui}" != "tty" then
          trivial.warn
            "${current-file-path}: No common home-manager specific, host independent, desktop environment configuration found (${global-de-configuration})..."
            ../../../../../do-nothing.nix
        else
          # Don't care, not running a GUI.
          ../../../../../do-nothing.nix
      )
    )
  ];
}

