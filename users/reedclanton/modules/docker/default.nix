{ user, ... }: {
	users.users.${user.name}.extraGroups = [ "docker" ];

	virtualisation.docker = {
		enable = true;
		enableOnBoot = true;
	};
}
