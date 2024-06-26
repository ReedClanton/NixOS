{ config, host, pkgs, ... }: {
	home = {
    file."${config.xdg.configHome}/fastfetch/config.jsonc".source = (
      if builtins.pathExists ../../../../hosts/${host}/config/fastfetch/config.jsonc then
        ../../../../hosts/${host}/config/fastfetch/config.jsonc
      else
        ../../../../config/fastfetch/config.jsonc
    );
    packages = with pkgs; [ fastfetch ];
  };
}

