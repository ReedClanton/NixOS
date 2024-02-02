{ user, ... }: {
	fileSystems."/run/media/${user.name}/vm" = {
		device = "/dev/disk/by-label/vm";
		fsType = "ext4";
	};
}
