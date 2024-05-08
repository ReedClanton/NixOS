{ lib, user, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/applications/tty/default.nix";
    # Tracks location of file that installs local package(s).
    local-package-applications = "./packages/default.nix";
    # Tracks location of file that installs global package(s).
    global-package-applications = "./../../../../../../modules/home-manager/applications/tty/packages/default.nix";
    # Tracks location of file that installs local program(s).
    local-program-applications = "./programs/default.nix";
    # Tracks location of file that install global program(s).
    global-program-applications = "./../../../../../../modules/home-manager/applications/tty/programs/default.nix";
  in [
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

