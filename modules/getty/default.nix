{ user, ... }: {
	services.getty.autologinUser = user.name;
}

