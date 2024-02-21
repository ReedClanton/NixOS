# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix (mostly)
{ lib, ... }: with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Console" = {
      custom-font = "Source Code Pro 12";
      font-scale = 0.9;
      use-system-font = false;
    };

    "org/gnome/desktop/screensaver" = {
      lock-delay = mkUint32 180;
      lock-enabled = true;
    };
  };
}

