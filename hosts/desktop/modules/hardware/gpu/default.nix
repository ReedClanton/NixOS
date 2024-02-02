{ pkgs, ... }: {
	imports = [ ../../../../../modules/hardware/gpu ];

	boot = {
		initrd.kernelModules = [ "amdgpu" ];
		kernelParams = [ "radeon.cik_support=0" "amdgpu.cik_support=1" ];
	};

	hardware.opengl.extraPackages = [ pkgs.amdvlk ];

	services.xserver.videoDrivers = [ "amdgpu" ];
}
