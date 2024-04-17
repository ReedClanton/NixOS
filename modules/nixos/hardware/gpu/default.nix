{ user, ... }: {
	hardware.opengl = {
    enable = true;
    # Driver set in host because it's based on hardware.
#    extraPackages = with pkgs; [  ];
    # Enable accelerated OpenGL rendering through the Direct Rendering Interface (DRI).
    # Note(s):
    #   - `hardware.opengl.driSupport32Bit` doesn't support AMD drivers yet.
    driSupport = true;
  };

	programs.corectrl = {
		enable = true;
		gpuOverclock.enable = true;
	};

	users.users."${user.name}".extraGroups = [ "corectrl" ];
}
