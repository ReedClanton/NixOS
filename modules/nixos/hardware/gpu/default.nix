{ user, ... }: {
	hardware.opengl = {
    enable = true;
    # Driver set in host because it's based on hardware.
#    extraPackages = with pkgs; [  ];
  };

	programs.corectrl = {
		enable = true;
		gpuOverclock.enable = true;
	};

	users.users."${user.name}".extraGroups = [ "corectrl" ];
}
