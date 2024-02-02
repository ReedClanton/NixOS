{ user, ... }: {
	fileSystems."/run/media/${user.name}/Steam" = {
		device = "/dev/disk/by-label/Steam";
		fsType = "ext4";
	};
}
