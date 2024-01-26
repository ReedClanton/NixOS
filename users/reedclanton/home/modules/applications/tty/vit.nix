{ config, pkgs, ... }: {
	home.packages = with pkgs; [ vit ];
	xdg.configFile."vit/config.ini" = {
		executable = true;
		source = ../../../config/vit/config.ini;
	};
}

