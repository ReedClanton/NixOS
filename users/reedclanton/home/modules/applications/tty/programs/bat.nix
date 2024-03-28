{ ... }: {
	programs.bat = {
		enable = true;
		config = {
			theme = "Coldark-Dark";
			# This also works well in tty.
#			theme = "ansi";
			color = "auto";
		};
	};
}

