# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }: with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/desktop/session" = {
      idle-delay = lib.mkForce mkUint32 0;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-saver-profile-on-low-battery = lib.mkForce false;
    };
  };
}

