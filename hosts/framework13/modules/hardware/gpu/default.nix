{ pkgs, ... }: {
	imports = [ ../../../../../modules/nixos/hardware/gpu ];

  # Hardware specific driver needed to enable OpenGL.
	hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];
}
