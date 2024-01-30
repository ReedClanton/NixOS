{ user, ... }: {
	fileSystems."/vmshare" = {
		fsType = "vboxsf";
		device = "Shared";
		options = [ "rw" "nofail" ];
	};

	users.extraGroups.vboxuser.members = [ user.name ];

	virtualisation = {
		vmware.guest.enable = true;
		virtualbox.guest.enable = true;
	};
}
