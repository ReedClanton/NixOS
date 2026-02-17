# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix (mostly)
{ lib, ... }: with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Console" = {
      font-scale = 0.8;
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/screensaver" = {
      lock-delay = mkUint32 180;
      lock-enabled = true;
    };

    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}

