# System level user configuration.

{ pkgs, user, ... }:
let
	userShell = pkgs.zsh;
in {
	imports = [
		./modules/networking
		./modules/sops
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
