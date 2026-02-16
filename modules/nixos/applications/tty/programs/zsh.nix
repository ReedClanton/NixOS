{ ... }: {
	environment.pathsToLink = [ "/share/zsh" ];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		enableLsColors = true;
		syntaxHighlighting.enable = true;
	};
}

