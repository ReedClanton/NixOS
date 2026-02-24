{ lib, ... }: {
	imports = [ ../../../../modules/nixos/sound ];

	security.rtkit.enable = lib.mkForce false;
	services.pipewire = {
		enable = lib.mkForce false;
		alsa = {
			enable = lib.mkForce false;
			support32Bit = lib.mkForce false;
		};
		pulse.enable = lib.mkForce false;
		jack.enable = lib.mkForce false;
	};
}

