{ lib, ... }: {
  imports = [
    ../../../../modules/nixos/nix
  ];

  ## Garbage Collection ##
	nix.gc = {
		dates = lib.mkForce "daily";
		options = lib.mkForce "--delete-older-than 5d";
	};
}

