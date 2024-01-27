{ pkgs, ... }: {
	home = {
		packages = with pkgs; [ lynx ];
		sessionVariables = {
			WWW_HOME = "https://www.google.com";
		};
	};
}

