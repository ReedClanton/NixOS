{ config, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "modules/nixos/applications/list/default.nix";
    # Tracks location of file that generates list of flatpak(s) installed.
    flatpak-list = "./flatpaks/default.nix";
    # Tracks location of file that generates list of package(s) installed.
    package-list = "./packages/default.nix";
  in [
    # Generate list of installed flatpak package(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${flatpak-list}")) then
        ./. + (builtins.substring 1 9999 "${flatpak-list}")
      else
        trivial.warn
          "${current-file-path}: Common flatpak package list generation not found (${flatpak-list}), package list won't be generated."
          ../../../../do-nothing.nix
    )
    # Generate list of installed NixOS package(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${package-list}")) then
        ./. + (builtins.substring 1 9999 "${package-list}")
      else
        trivial.warn
          "${current-file-path}: Common NixOS package list generation not found (${package-list}), package list won't be generated."
          ../../../../do-nothing.nix
    )
  ];
}

