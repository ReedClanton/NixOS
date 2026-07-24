{ pkgs, user, ... }: {
	users.users.${user.name}.extraGroups = [ "docker" ];

	virtualisation.docker = {
		enable = true;
		enableOnBoot = true;
    # This must be done so long as I'm on version 25.11 because 25.11 is pinned to Docker 28
    # and Docker 28 has been marked a vulnerable.
    package = pkgs.docker_29;
	};
}
