{ pkgs, ... }: {
	services = {
		printing = {
			# Enable CUPS printing driver.
			enable = true;
			# Additional drivers that may or may not be needed depending on printer.
			drivers = with pkgs; [
				# Drivers for many different printers from many different vendors.
				gutenprint
				# Additional binary-only drivers for some printers.
				gutenprintBin
				# Drivers for HP printers.
				hplip
				# Drivers for HP printers with proprietary plugins.
				#   NOTE: Use NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup' to add the printer,
				#    regular CUPS UI doesn't seem to work.
				hplipWithPlugin
				# Postscript drivers for Lexmark.
				postscript-lexmark
				# Proprietary Samsung drivers.
				samsung-unified-linux-driver
				# Drivers for printers that support SPL (Samsung Printer Language).
				splix
				# Drivers for some Brother printers.
				brlaser
				# Generic drivers for more Brother printers.
				brgenml1lpr
				brgenml1cupswrapper
				# Drivers for some Canon Pixma devices.
				cnijfilter2
			];
		};
		# Enable network printer auto-detect.
		avahi = {
			enable = true;
			nssmdns = true;
			openFirewall = true;
		};
	};
}

