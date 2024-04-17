{ pkgs, ... }: {
	imports = [ ./wheel.nix ];

	environment.systemPackages = with pkgs; [
		# Experimental Logitech force feedback module (DKMS).
		linuxKernel.packages.linux_latest_libre.new-lg4ff
	];
}
