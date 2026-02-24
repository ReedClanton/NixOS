{ config, host, lib, ui, user, ... }: with lib; {
	imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/default.nix";
    # Tracks location of user's local Home Manager hardware setup configuration.
    hardware-configuration = "./modules/hardware/default.nix";
    # Tracks location of the code that creates a list of applications that are installed
    # by Home Manager.
    app-list = "./modules/applications/list/default.nix";
    # Tracks location of Home Manager tty application(s).
    tty-apps = "./modules/applications/tty/default.nix";
    # Tracks location of Home Manager SOPS configuration.
    sops-configuration = "./modules/sops/default.nix";
    # Tracks location of Home Manager XDG configuration.
    xdg-configuration = "./modules/xdg/default.nix";
    # Tracks location of Home Manager GUI configuration that's specific to the VM host.
    vm-gui-configuration = "./modules/gui/vm.nix";
    # Tracks location of Home Manager host independent GUI configuration for
    gui-configuration = "./modules/gui/default.nix";
    # Tracks location of Home Manager host specific configuration.
    host-configuration = "./hosts/default.nix";
  in [
    # Hardware setup.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${hardware-configuration}")) then
        ./. + (builtins.substring 1 9999 "${hardware-configuration}")
      else
        trivial.warn
          "${current-file-path}: No Home Manager host (${host}) independent hardware configuration exists (${hardware-configuration}) for this user (${user.name})..."
          ../../../do-nothing.nix
    )
    # User setup.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${app-list}")) then
        ./. + (builtins.substring 1 9999 "${app-list}")
      else
        trivial.warn
          "${current-file-path}: No list of application(s) installed by Home Manager for this user/host (${user.name}/${host}) exists (${app-list})..."
          ../../../do-nothing.nix
    )
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${tty-apps}")) then
        ./. + (builtins.substring 1 9999 "${tty-apps}")
      else
        trivial.warn
          "${current-file-path}: No set of tty application(s) installed by Home Manager for this user/host (${user.name}/${host}) exists (${tty-apps})..."
          ../../../do-nothing.nix
    )
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${sops-configuration}")) then
        ./. + (builtins.substring 1 9999 "${sops-configuration}")
      else
        trivial.warn
          "${current-file-path}: No SOPS Home Manager configuration exists for this user/host (${user.name}/${host}) exists (${sops-configuration})..."
          ../../../do-nothing.nix
    )
		(
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${xdg-configuration}")) then
        ./. + (builtins.substring 1 9999 "${xdg-configuration}")
      else
        trivial.warn
          "${current-file-path}: No XDG Home Manager configuration exists for this user/host (${user.name}/${host}) exists (${xdg-configuration})..."
          ../../../do-nothing.nix
    )
    # GUI setup.
    (
      # Check if *any* GUI setup is needed.
      if "${ui}" != "tty" then (
        # Determine *what* GUI setup is needed.
        if "${host}" == "vm" then (
          if builtins.pathExists (./. + (builtins.substring 1 9999 "${vm-gui-configuration}")) then
            ./. + (builtins.substring 1 9999 "${vm-gui-configuration}")
          else
            trivial.warn
              "${current-file-path}: No Home Manager GUI environment configuration exists (${vm-gui-configuration}) for this user/host (${user.name}/${host})..."
              ../../../do-nothing.nix
        ) else (
          if builtins.pathExists (./. + (builtins.substring 1 9999 "${gui-configuration}")) then
            ./. + (builtins.substring 1 9999 "${gui-configuration}")
          else
            trivial.warn
              "${current-file-path}: No Home Manager GUI environment configuration exists (${gui-configuration}) for this user/host (${user.name}/${host})..."
              ../../../do-nothing.nix
        )
      # No GUI setup is needed.
      ) else
        ../../../do-nothing.nix
    )
    # Host setup.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${host-configuration}")) then
        ./. + (builtins.substring 1 9999 "${host-configuration}")
      else
        trivial.warn
          "${current-file-path}: No host (${host}) specific Home Manager configuration this user (${user.name}) exists (${host-configuration})..."
          ../../../do-nothing.nix
    )
	];

	home = {
		# This value determines the Home Manager release that your configuration is
		# compatible with. This helps avoid breakage when a new Home Manager release
		# introduces backwards incompatible changes.
		#
		# You should not change this value, even if you update Home Manager. If you do
		# want to update the value, then make sure to first check the Home Manager
		# release notes.
		stateVersion = "23.11";
		username = user.name;
		homeDirectory = user.home;
		shellAliases = user.shell.aliases;

		sessionVariables = {
			# TODO: Test! Doesn't seem like just setting these worked.
			# Removes `.gnupg/` from home.
			GNUPGHOME = "${config.xdg.dataHome}/gnupg";
			# Removes `.compose-cache/` from home.
			XCOMPOSECACHE="${config.xdg.cacheHome}/X11/xcompose";
			# Removes `.zoom` from home.
			# Note: Commented out because it breaks stuff when set.
#			SSB_HOME="${config.xdg.configHome}/zoom";
		};

		file = {
			".ssh/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to create the directory this file is in, a file must be created in it. Hense the existice of this file.";
			"${config.xdg.configHome}/sops/age/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to create the directory this file is in, a file must be created in it. Hense the existice of this file.";
		};
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
