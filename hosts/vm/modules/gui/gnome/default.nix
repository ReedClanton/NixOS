{ lib, ... }: with lib; {
  imports = [ ../default.nix ];

  services.displayManager.gdm.wayland = mkForce false;
}

