{ config, pkgs, ... }: {
	programs.btop = {
		enable = true;
		settings = {
			color_theme = "kyli0x";
			truecolor = true;
			presets = "cpu:0:tty,net:0:tty,mem:0:tty cpu:0:tty proc:0:tty mem:0:tty net:0:tty";
			rounded_corners = false;
			graph_symbol = "tty";
			shown_boxes = "cpu mem net";
			update_ms = 500;
			proc_sorting = "cpu lazy";
			proc_tree = true;
			proc_colors = true;
			proc_gradient = true;
			proc_per_core = false;
			proc_mem_bytes = false;
			cpu_graph_upper = "total";
			cpu_graph_lower = "system";
			cpu_invert_lower = false;
			show_uptime = false;
			clock_format = "";
			background_update = false;
			net_sync = true;
			show_battery = true;
		};
	};
}

