{ lib, ... }: {
  imports = [ ../default.nix ];

	services.xserver.displayManager.sddm.wayland.enable = lib.mkForce false;
}

