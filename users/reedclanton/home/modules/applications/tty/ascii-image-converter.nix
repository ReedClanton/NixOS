{ config, pkgs, ... }: {
	home.packages = with pkgs; [ ascii-image-converter ];
}

