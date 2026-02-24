# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }: with lib.hm.gvariant; {
  # Adding this so this file does error out from doing nothing.
  imports = [ ../../../../../../../../../do-nothing.nix ];

  # Used to set stuff here, but now I just use the defaults in the user's dconf file.
#  dconf.settings = {
#  };
}

