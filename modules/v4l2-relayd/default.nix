{ ... }: {
	services.v4l2-relayd.instances = {
		"phone-relayd" = {
			enable = true;
			cardLabel = "Phone";
			input = {
				format = "YU12";
				framerate = 30;
				height = 480;
#				pipeline = TODO;
				width = 640;
			};
#			output.format = "YU12";
		};
	};
}
