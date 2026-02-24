{ ... }: {
	services = {
		printing.enable = false;

		# Disable network printer auto-detect.
		avahi = {
			enable = false;
			nssmdns4 = false;
			openFirewall = false;
		};
	};
}

