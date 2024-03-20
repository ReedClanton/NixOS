{ ... }: {
	programs.taskwarrior = {
		enable = true;
		colorTheme = "dark-16";
		config = {
			confirmation = false;
      urgency.age.coefficient = 0.5;
      urgency.annotations.coefficient = 0;
      urgency.blocked.coefficient = -6;
      urgency.blocking.coefficient = 10;
		};
	};
}

