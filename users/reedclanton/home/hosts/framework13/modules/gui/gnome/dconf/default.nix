# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix (mostly)
{ lib, ... }: with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Console" = {
      font-scale = 0.77;
    };

    "org/gnome/desktop/screensaver" = {
      lock-delay = mkUint32 180;
    };

    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}

