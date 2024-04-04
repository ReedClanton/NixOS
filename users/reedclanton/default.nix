# System level user configuration.

{ config, host, pkgs, ui, user, ... }:
let
	userShell = pkgs.zsh;
in {
	imports = [
    ./modules/arduino
		./modules/docker
    (if builtins.pathExists ./modules/gui/${ui}/${host}.nix then ./modules/gui/${ui}/${host}.nix else (if builtins.pathExists ./modules/gui/${ui} then ./modules/gui/${ui} else ../../do-nothing.nix))
    (if builtins.pathExists ./modules/hardware/default.nix then ./modules/hardware else ../../do-nothing.nix)
		./modules/networking
		./modules/sops
	];

	users = {
		defaultUserShell = userShell;
		users.${user.name} = {
			description = user.description;
			extraGroups = user.extraGroups;
#			hashedPasswordFile = config.sops.secrets."users/${user.name}/pwd_hash".path;
      initialPassword = "password";
			isNormalUser = user.isNormalUser;
			shell = userShell;
		};
	};
}
