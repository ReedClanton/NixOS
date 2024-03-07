{ lib, ... }: {
  imports = [ ../default.nix ];

	services.xserver.displayManager.gdm.wayland = lib.mkForce false;
}

