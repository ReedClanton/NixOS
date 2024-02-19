# System level user configuration.

{ config, pkgs, user, ... }:
let
	userShell = pkgs.zsh;
in {
	imports = [
    ./modules/arduino
		./modules/docker
		./modules/networking
		./modules/sops
	];

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
}
