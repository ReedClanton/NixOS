{ pkgs, ... }: {
	imports = [ ../../../../../modules/hardware/gpu ];

	boot = {
		initrd.kernelModules = [ "amdgpu" ];
		# Enable support for my old ass AMD ATI R9 290X GPU.
		kernelParams = [ "radeon.cik_support=0" "amdgpu.cik_support=1" ];
	};

	hardware.opengl.extraPackages = [ pkgs.amdvlk ];

	# Enable GPU hardware acceleration for x11 (but don't turn x11 on).
	services.xserver.videoDrivers = [ "amdgpu" ];
}
