{ user, ... }: {
	programs.corectrl = {
		enable = true;
		gpuOverclock.enable = true;
	};

	users.users."${user.name}".extraGroups = [ "corectrl" ];
}
