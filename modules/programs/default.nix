{ ... }: {
	environment.pathsToLink = [ "/share/zsh" ];
	
	programs = {
		neovim = { 
			enable = true;
			defaultEditor = true;
		};
		zsh = {
			enable = true;
			enableCompletion = true;
			enableLsColors = true;
			syntaxHighlighting.enable = true;
		};
	};
}

