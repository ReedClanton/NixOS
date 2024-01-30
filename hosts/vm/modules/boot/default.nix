{ lib, ... }: {
	imports = [
		../../../../modules/boot/efi-systemd.nix
	];

	boot.loader.systemd-boot.configurationLimit = lib.mkForce 5;
}

