{ ... }: {
	programs.taskwarrior = {
		enable = true;
		colorTheme = "dark-16";
		config = {
			confirmation = false;
      urgency.age.coefficient = 0.5;
      urgency.annotations.coefficient = 0;
      urgency.blocked.coefficient = -5;
      urgency.blocking.coefficient = 10;
      urgency.due.coefficient = 14.5;
      urgency.uda.priority.H.coefficient = 8;
      urgency.user.project.Health.coefficient = 4;
      urgency.user.project.Health_Fitness.coefficient = 4;
      urgency.user.project.Health_Food.coefficient = 8;
      urgency.user.project.Health_Hydration.coefficient = 4;
      urgency.user.project.Health_Medication.coefficient = 8;
      urgency.user.tag.epic.coefficient = 8;
      urgency.user.tag.easy.coefficient = 2;
      urgency.user.tag.hard.coefficient = -1;
      urgency.user.tag.task.coefficient = 12;
		};
	};
}

