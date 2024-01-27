# System level user configuration.

{ pkgs, config, user, ... }:
let
	userShell = pkgs.zsh;
in {
	imports = [
		./modules/networking
	];

	users = {
		defaultUserShell = userShell;
		users.${user.name} = {
			description = user.description;
			extraGroups = user.extraGroups;
			initialPassword = user.initialPassword;
			isNormalUser = user.isNormalUser;
			shell = userShell;
		};
	};

	virtualisation.docker.enable = true;
}
