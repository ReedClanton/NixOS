{ inputs, config, pkgs, lib, user, ... }: {
	users.extraGroups.vboxuser.members = [ user.name ];
	virtualisation = {
		vmware.host.enable = true;
		virtualbox.host = {
			enable = true;
			enableExtensionPack = true;
		};
	};
}
