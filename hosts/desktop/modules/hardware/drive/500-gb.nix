{ user, ... }: {
	fileSystems."/run/media/${user.name}/500-gb" = {
		device = "/dev/disk/by-label/500-gb";
		fsType = "ext4";
	};
}
