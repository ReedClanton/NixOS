{ ... }: {
	programs.taskwarrior = {
		enable = true;
		colorTheme = "dark-16";
		config = {
			confirmation = false;
		};
	};
}

