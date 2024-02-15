{ options, pkgs, user, ... }:
let
  cde-icons = pkgs.writeShellScriptBin "cde-icons" ''
    file=`basename '''${1%.*}`
    ${pkgs.imagemagick}/bin/convert $1 -resize 48x48 ~/.dt/icons/$file.l.pm
    ${pkgs.imagemagick}/bin/convert $1 -resize 32x32 ~/.dt/icons/$file.m.pm
    ${pkgs.imagemagick}/bin/convert $1 -resize 24x24 ~/.dt/icons/$file.s.pm
    ${pkgs.imagemagick}/bin/convert $1 -resize 16x16 ~/.dt/icons/$file.t.pm
  '';
  cde-battery = pkgs.writeScriptBin "cde-battery" ''
    #!${pkgs.cdesktopenv}/opt/dt/bin/dtksh
    ${pkgs.lib.readFile (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/edorig/dtksh/5f49e402b391c81ebea9609bdec9c7716e70a8c0/battery";
      sha256 = "0zjn9zl1as9xbk2845bbdy2xfj29b4hvvalcz8kf2llkndbfswvl";
    })}
  '';
in {
	services.xserver = {
		enable = true;
		displayManager = {
#			sddm = {
#				enable = true;
#				wayland.enable = true;
#			};
			autoLogin = {
				enable = true;
				user = user.name;
			};
		};
		# Enable Desktop Environment.
		desktopManager.cde = {
      enable = true;
      extraPackages = with pkgs; [
        cde-gtk-theme
        cde-icons
        cde-battery
        fsv
      ] ++ options.services.xserver.desktopManager.cde.extraPackages.default;
    };
		# Configure keymap in X11.
		layout = user.services.xserver.layout;
		xkbVariant = user.services.xserver.xkbVariant;
		# Exclude default X11 packages I don't want.
		excludePackages = with pkgs; [ xterm ];
	};

	environment = {
    etc = {
      "xdg/gtk-2.0/gtkrc".text = ''
        gtk-theme-name="cdetheme"
      '';
      "xdg/gtk-3.0/settings.ini".text = ''
        [Settings]
        tdk-theme-name-cdetheme
      '';
    };

		# Install CDE specific package(s).
		systemPackages = with pkgs.libsForQt5; [
			xdg-desktop-portal-kde
		];
	};

  qt5 = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };
}

