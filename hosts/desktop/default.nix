{ host, lib, ui, ... }: with lib; {
	imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "host/${host}/default.nix";
    # Tracks path to file that configures host specific hardware.
    hardware-setup = "./modules/hardware/default.nix";
    # Tracks path to file that generates a list of installed application(s).
    application-list = "./modules/applications/list/default.nix";
    # Tracks path to file that installs package(s).
    package-setup = "./modules/applications/tty/packages/default.nix";
    # Tracks path to file that installs program(s).
    program-setup = "./modules/applications/tty/programs/default.nix";
    # Tracks path to file that configures GUI.
    gui-setup = "./modules/gui/${ui}/default.nix";
    # Tracks path to file that configures host virtualization.
    virtualization-setup = "./modules/virtualization/default.nix";
  in [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
    # Include custom host specific hardware configuration.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${hardware-setup}")) then
        ./. + (builtins.substring 1 9999 "${hardware-setup}")
      else
        throw "${current-file-path}: Hardware configuration for '${host}' (${hardware-setup}) couldn't be found."
    )
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${application-list}")) then
        ./. + (builtins.substring 1 9999 "${application-list}")
      else
        trivial.warn
          "${current-file-path}: Application list configuration for '${host}' (${application-list}) couldn't be found, no installed application list will be generated."
          ../../do-nothing.nix
    )
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${package-setup}")) then
        ./. + (builtins.substring 1 9999 "${package-setup}")
      else
        trivial.warn
          "${current-file-path}: Package(s) to be installed on '${host}' (${package-setup}) couldn't be found, skipping."
          ../../do-nothing.nix
    )
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${program-setup}")) then
        ./. + (builtins.substring 1 9999 "${program-setup}")
      else
        ../../do-nothing.nix
    )
    (if builtins.pathExists ./modules/benchmark/default.nix then ./modules/benchmark else ../../modules/nixos/benchmark)
    (if builtins.pathExists ./modules/boot/default.nix then ./modules/boot else ../../modules/nixos/boot/efi-systemd.nix)
    (if builtins.pathExists ./modules/documentation/default.nix then ./modules/documentation else ../../modules/nixos/documentation)
    (if builtins.pathExists ./modules/getty/default.nix then ./modules/getty else ../../modules/nixos/getty)
    # Only setup GUI stuff when running a GUI (not TTY).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${gui-setup}")) then
        ./. + (builtins.substring 1 9999 "${gui-setup}")
      else
        builtins.trace "${current-file-path}: GUI setup for '${ui}' (${gui-setup}) not found, host specific GUI configuration skipped." ../../do-nothing.nix
    )
    (if builtins.pathExists ./modules/language/default.nix then ./modules/language else ../../modules/nixos/language)
    (if builtins.pathExists ./modules/nix/default.nix then ./modules/nix else ../../modules/nixos/nix)
		(if builtins.pathExists ./modules/proton/default.nix then ./modules/proton else ../../modules/nixos/proton)
    (if builtins.pathExists ./modules/sound/default.nix then ./modules/sound else ../../modules/nixos/sound)
    (if builtins.pathExists ./modules/ssh/default.nix then ./modules/ssh else ../../modules/nixos/ssh)
    (if builtins.pathExists ./modules/sudo/default.nix then ./modules/sudo else ../../modules/nixos/sudo)
    (if builtins.pathExists ./modules/time/default.nix then ./modules/time else ../../modules/nixos/time)
    (if builtins.pathExists ./modules/tty/default.nix then ./modules/tty else ../../modules/nixos/tty)
    (
      if builtins.pathExists ./modules/virtualization/default.nix then
        ./modules/virtualization
      else
        trivial.warn
          "${current-file-path}: Virtualization setup for '${host}' (${virtualization-setup}) not found, virtualization won't be configured."
          ../../do-nothing.nix
    )
    (if builtins.pathExists ./modules/xdg/default.nix then ./modules/xdg else ../../modules/nixos/xdg)
	];
}
