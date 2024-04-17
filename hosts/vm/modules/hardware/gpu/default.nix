{ lib, pkgs, user, ... }: {
  imports = [ ../../../../../modules/nixos/hardware/gpu ];
  
	programs.corectrl = {
		enable = lib.mkForce false;
		gpuOverclock.enable = lib.mkForce false;
	};

	# Enable GPU hardware acceleration.
  # Note(s):
  #   - This doesn't turn x11 on.
  #   - This is used even when running under Wayland.
  #   - Enables the drivers needed to support automatic screen resizing of guest display.
	services.xserver.videoDrivers = [ "vmware" "vboxvideo" "modesetting" ];
}
