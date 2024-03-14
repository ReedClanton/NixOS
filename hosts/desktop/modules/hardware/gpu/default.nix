{ pkgs, ... }: {
	imports = [ ../../../../../modules/hardware/gpu ];

	boot = {
		initrd.kernelModules = [ "amdgpu" ];
		# Enable support for my old ass AMD ATI R9 290X GPU.
		kernelParams = [ "radeon.cik_support=0" "amdgpu.cik_support=1" ];
	};

	hardware.opengl.extraPackages = [ pkgs.amdvlk ];

	# Enable GPU hardware acceleration.
  # Note(s):
  #   - This doesn't turn x11 on.
  #   - This is used even when running under Wayland.
  #   - `amdgpu` also works, but it breaks v4l2loopback and seems to perform worse.
	services.xserver.videoDrivers = [ "ati" ];
}
