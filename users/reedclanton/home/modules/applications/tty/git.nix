{ user, ... }: {
	home.file."Code/git/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to create the directory this file is in, a file must be created in it. Hense the existice of this file.";

	programs.git = {
		enable = true;
		userName = user.name;
		userEmail = user.email;
		aliases = {
			pu = "push";
			co = "checkout";
			cm = "commit";
		};
		extraConfig = {
			color.ui = true;
			core.editor = "nvim";
		};
	};
}

