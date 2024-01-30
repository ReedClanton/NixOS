{ user, ... }: {
	security.sudo = {
		enable = true;
		wheelNeedsPassword = true;
	};

	users.users.${user.name}.extraGroups = [ "wheel" ];
}

