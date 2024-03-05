{ user, ... }: {
	fileSystems."/run/media/${user.name}/Data" = {
		device = "/dev/disk/by-label/Data";
		fsType = "ext4";
	};
}
