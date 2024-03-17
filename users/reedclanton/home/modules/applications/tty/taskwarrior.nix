{ ... }: {
	programs.taskwarrior = {
		enable = true;
		colorTheme = "dark-16";
		config = {
			confirmation = false;
      urgency.age.coefficient = 0.5;
		};
	};
}

