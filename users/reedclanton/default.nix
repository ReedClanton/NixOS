# System level user configuration.

{ config, pkgs, user, ... }:
let
	userShell = pkgs.zsh;
in {
	imports = [
		./modules/networking
		./modules/sops
	];

	# Ensure user's password is decrypted to `/run/secrets-for-users` instead of `/run/secrets` so it's accesible at the point when it's needed.
	sops.secrets."users/${user.name}/pwd_hash".neededForUsers = true;

	users = {
		defaultUserShell = userShell;
		users.${user.name} = {
			description = user.description;
			extraGroups = user.extraGroups;
			hashedPasswordFile = config.sops.secrets."users/${user.name}/pwd_hash".path;
			isNormalUser = user.isNormalUser;
			shell = userShell;
		};
	};

	virtualisation.docker.enable = true;
}
