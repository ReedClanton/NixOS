{ lib, user, ... }: {
  imports = [ ../../../../../modules/hardware/gpu ];
  
  # Hardware specific driver needed to enable OpenGL.
#	hardware.opengl.extraPackages = with pkgs; [  ];

	programs.corectrl = {
		enable = lib.mkForce false;
		gpuOverclock.enable = lib.mkForce false;
	};
}
