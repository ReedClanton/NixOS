{ pkgs, ... }: {
	home.packages = with pkgs; [ linux-router ];
}

