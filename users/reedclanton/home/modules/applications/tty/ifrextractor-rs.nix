{ pkgs, ... }: {
	home.packages = with pkgs; [ ifrextractor-rs ];
}

