{ lib, user, ... }: {
  imports = [
    ../../../../modules/nixos/virtualisation
  ];

  # Setup shared folder.
	fileSystems."/vmshare" = {
		fsType = "vboxsf";
		device = "Share";
		options = [ "rw" "nofail" ];
	};

  # Configure host as guest.
	virtualisation = {
		vmware = {
      guest.enable = true;
      host.enable = lib.mkForce false;
    };
		virtualbox = {
      guest = {
        enable = true;
        clipboard = true;
        dragAndDrop = true;
        seamless = true;
        # Use kernel modules provided by VirtualBox rather than the upstream kernel.
        use3rdPartyModules = true;
      };
      host = {
        enable = lib.mkForce false;
        enableExtensionPack = lib.mkForce false;
      };
    };
	};
}
