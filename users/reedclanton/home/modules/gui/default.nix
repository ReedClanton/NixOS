{ ui, lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/gui/default.nix";
    # Tracks location of local Home Manager GUI flatpak/package/program configuration.
    local-application-configuration = "./../applications/gui/default.nix";
    # Tracks location of common (global) Home Manager GUI flatpak/package/program configuration.
    global-application-configuration = "./../../../../../modules/home-manager/applications/gui/default.nix";
    # Tracks location of local Home Manager Visual Environment (VE) configuration.
    local-ve-configuration = "./${ui}/default.nix";
    # Tracks location of common (global) Home Manager Visual Environment (VE) configuration.
    global-ve-configuration = "./../../../../../modules/home-manager/gui/${ui}/default.nix";
  in [
    # Install local (user specific) GUI application(s) if running a GUI.
    (
      if "${ui}" != "tty" && builtins.pathExists (./. + (builtins.substring 1 9999 "${local-application-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-application-configuration}")
      else (
        if "${ui}" != "tty" then
          trivial.warn
            "${current-file-path}: User '${user.name}' has no Home Manager specific GUI (${ui}) application configuration (${local-application-configuration})..."
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
            "${current-file-path}: No common Home Manager GUI (${ui}) application configuration (${global-application-configuration}) exists..."
            ../../../../../do-nothing.nix
        else
          # Don't care, not running a GUI.
          ../../../../../do-nothing.nix
      )
    )
    # Run local VE configuration if running a GUI.
    (
      if "${ui}" != "tty" && builtins.pathExists (./. + (builtins.substring 1 9999 "${local-ve-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-ve-configuration}")
      else (
        if "${ui}" != "tty" then
          trivial.warn
            "${current-file-path}: User '${user.name}' has no Home Manager specific, host (${host}) independent, visual environment (${ui}) configuration (${local-ve-configuration})..."
            ../../../../../do-nothing.nix
        else
          # Don't care, not running a GUI.
          ../../../../../do-nothing.nix
      )
    )
    # Run common (global) DE configuration.
    (
      if "${ui}" != "tty" && builtins.pathExists (./. + (builtins.substring 1 9999 "${global-ve-configuration}")) then
        ./. + (builtins.substring 1 9999 "${global-ve-configuration}")
      else (
        if "${ui}" != "tty" then
          trivial.warn
            "${current-file-path}: No common Home Manager specific, host independent, visual environment (${ui}) configuration exists (${global-ve-configuration})..."
            ../../../../../do-nothing.nix
        else
          # Don't care, not running a GUI.
          ../../../../../do-nothing.nix
      )
    )
  ];
}

