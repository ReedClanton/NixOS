{ lib, pkgs, ... }: {
	imports = [
		../../../../modules/nixos/boot/efi-systemd.nix
	];

	boot = {
    # VirtualBox Guest Additions aren't compatible with latest kernel as of 2024/04/15.
    kernelPackages = lib.mkForce pkgs.linuxPackages_6_6;
    # No need to have many generations when I'm using snapshots.
    loader.systemd-boot.configurationLimit = lib.mkForce 5;
  };
}

