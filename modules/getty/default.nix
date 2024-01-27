{ config, inputs, user, ... }: {
	services.getty.autologinUser = user.name;
}

