{ pkgs, ... }: {
	imports = [ ./wheel.nix ];

	environment.systemPackages = with pkgs; [
		# Experimental Logitech force feedback module (DKMS).
    # Note(s):
    #   - This must be kept up-to-date with the kernel version used by the OS.
		linuxKernel.packages.linux_6_19.new-lg4ff
	];
}
