{ config, host, ui, user, ... }: {
	imports = [
    # Hardware setup.
    (if builtins.pathExists ./modules/hardware/default.nix then ./modules/hardware else ../../../do-nothing.nix)
    # User setup.
    (if builtins.pathExists ./modules/applications/list/default.nix then ./modules/applications/list else ../../../do-nothing.nix)
    (if builtins.pathExists ./modules/applications/tty/default.nix then ./modules/applications/tty else ../../../do-nothing.nix)
    (if builtins.pathExists ./modules/sops/default.nix then ./modules/sops else ../../../do-nothing.nix)
		(if builtins.pathExists ./modules/xdg/default.nix then ./modules/xdg else ../../../do-nothing.nix)
    # GUI setup.
    (
      if builtins.pathExists ./modules/gui/${ui}/default.nix then
        ./modules/gui/${ui}
      else (
        if builtins.pathExists ../../../modules/home-manager/gui/${ui}/default.nix then
          ../../../modules/home-manager/gui/${ui}
        else
          ../../../do-nothing.nix
      )
    )
    # Host setup.
    (if builtins.pathExists ./hosts/default.nix then ./hosts else ../../../do-nothing.nix)
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
			# Removes `.gtkrc-2.0` from home.
			GTK2_RC_FILES="${config.xdg.configHome}/gtk-2.0/gtkrc";
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
