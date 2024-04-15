# System level user configuration.

{ config, host, pkgs, ui, user, ... }:
let
	userShell = pkgs.zsh;
in {
	imports = [
    # Hardware setup.
    (if builtins.pathExists ./modules/hardware/default.nix then ./modules/hardware else ../../do-nothing.nix)
    # User setup.
    (if builtins.pathExists ./modules/arduino/default.nix then ./modules/arduino else ../../do-nothing.nix)
    (if builtins.pathExists ./modules/docker/default.nix then ./modules/docker else ../../do-nothing.nix)
    (if builtins.pathExists ./modules/sops/default.nix then ./modules/sops else ../../do-nothing.nix)
    # GUI user setup.
    (if builtins.pathExists ./modules/gui/${ui}/${host}.nix then ./modules/gui/${ui}/${host}.nix else (if builtins.pathExists ./modules/gui/${ui} then ./modules/gui/${ui} else ../../do-nothing.nix))
    # Host specific user setup.
    (if builtins.pathExists ./hosts/default.nix then ./hosts else ../../do-nothing.nix)
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
