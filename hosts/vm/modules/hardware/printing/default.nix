{ ... }: {
	services = {
		printing.enable = false;

		# Disable network printer auto-detect.
		avahi = {
			enable = false;
			nssmdns = false;
			openFirewall = false;
		};
	};
}

