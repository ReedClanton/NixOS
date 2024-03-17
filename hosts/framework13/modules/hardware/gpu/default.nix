{ pkgs, ... }: {
	imports = [ ../../../../../modules/hardware/gpu ];

  # Hardware specific driver needed to enable OpenGL.
	hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];
}
