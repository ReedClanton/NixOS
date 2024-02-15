# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }: with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/desktop/screensaver" = {
      lock-delay = mkUint32 180;
      lock-enabled = true;
    };
  };
}

