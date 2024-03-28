{ ... }: {
	programs.btop = {
		enable = true;
		settings = {
			background_update = true;
			clock_format = "";
			color_theme = "kyli0x";
			cpu_graph_upper = "total";
			cpu_graph_lower = "system";
			cpu_invert_lower = false;
			graph_symbol = "tty";
			net_auto = false;
			net_download = 20;
			net_upload = 10;
			net_sync = false;
			presets = "cpu:0:tty,net:0:tty,mem:0:tty cpu:0:tty proc:0:tty mem:0:tty net:0:tty";
			proc_colors = true;
			proc_gradient = true;
			proc_mem_bytes = false;
			proc_per_core = false;
			proc_sorting = "cpu lazy";
			proc_tree = true;
			rounded_corners = false;
			show_battery = true;
			show_uptime = false;
			shown_boxes = "cpu mem net";
			truecolor = true;
			update_ms = 500;
		};
	};
}

