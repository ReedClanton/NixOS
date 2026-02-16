{ config, pkgs, user, ... }: {
	# TPM is used in place of `programs.tmux.plugins` because that method of installing plugins doesn't work when those plugins are used in the status bar.
	home.file."${config.xdg.configHome}/tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
		owner = "tmux-plugins";
		repo = "tpm";
		rev = "7bdb7ca";
		sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
	};

	programs.tmux = {
		enable = true;
		baseIndex = 1;
		clock24 = false;
		disableConfirmationPrompt = false;
		escapeTime = 400;
		extraConfig = ''
			###########
			## Legend ##
			###########
			
			## Key(s) ##
			# <ctrl>:		C
			# <alt>:		M
			# <shift>:		S
			
			## Command(s) ##
			# bind-key:		Set key binding. Alias: `bind`.
			# unbind-key:	Unset key binding. Alias: `unbind`.
			# set-option:	Set configuration value. Alias: `set`.
			
			##############################
			## Source TMUX Configuration ##
			##############################
			
			unbind-key		r
			bind-key		r source-file ${config.xdg.configHome}/tmux/tmux.conf \; display-message "${config.xdg.configHome}/tmux/tmux.conf reloaded."
			
			############
			## Session ##
			############
			
			## Close ##
			bind-key		m confirm-before -p "Kill session #S (y/n):" kill-session
			
			####################
			## Pane Binding(s) ##
			####################
			
			## Split/New ##
			unbind-key		%
			bind-key		v split-window -h -c "#{pane_current_path}" \; send-keys 'c' Enter
			unbind-key		'"'
			bind-key		h split-window -v -c "#{pane_current_path}" \; send-keys 'c' Enter
			
			## Close ##
			bind-key		x kill-pane
			
			## Resize ##
			bind-key -rn	C-y resize-pane -U 1
			bind-key -rn	C-h resize-pane -D 1
			bind-key -rn	C-g resize-pane -L 2
			bind-key -rn	C-j resize-pane -R 2
			
			######################
			## Window Binding(s) ##
			######################
			
			## New ##
			bind-key		c new-window -c "#{pane_current_path}" \; send-keys 'c' Enter
			
			## Close ##
			unbind-key		&
			bind-key		k kill-window
			
			## Select ##
			unbind-key	0
			bind-key		0 select-window -t :10
      # Remove binding that removes last text in copy buffer.
      unbind-key    -
      bind-key    - select-window -t :11
			
			###################
			## TMUX Plugin(s) ##
			###################
			
			## TPM ##
			# Note:
			#	`<prefix> + I` to fetch and source plugin(s).
			set-option -g @plugin 'tmux-plugins/tpm'
			
			## TMUX CPU ##
			set-option -g @plugin 'tmux-plugins/tmux-cpu'
			set-option -g @cpu_percentage_format "%03.0f%%"
			set-option -g @cpu_medium_thresh '50'
			set-option -g @cpu_high_thresh '80'
			set-option -g @cpu_temp_unit 'C'
			set-option -g @cpu_temp_medium_thresh '80'
			set-option -g @cpu_temp_high_thresh '94'
			set-option -g @ram_percentage_format "%03.0f%%"
			set-option -g @ram_medium_thresh '65'
			set-option -g @ram_high_thresh '85'
			
			## TMUX Online Status ##
			set-option -g @plugin 'tmux-plugins/tmux-online-status'
			set-option -g @online_icon ' Online '
			set-option -g @offline_icon 'Offline!'
			
			## TMUX Weather ##
			set-option -g @plugin 'aaronpowell/tmux-weather'
			# Set cachiing duration in seconds. Default: Caching disabled when not set.
			set-option -g @forecast-cache-duration 600
			# Set location. Default: location based on IP address.
			set-option -g @forecast-location 'Arvada'
			# Configure weather representation. Default: `%C+%t+%w`. For more, see: https://github.com/chubin/wttr.in#one-line-output
			set-option -g @forecast-format '%l:+%C,+%t,+%h+RH,+%w'\&u
			# Ensure long forcasts don't message with the rest of the status bar. Default: 75.
			set-option -g @forecast-char-limit 52
			# Set location of cache file. Default: `/tmp/tmux-weather.cache`.
			set-option -g @forecast-cache-path '${config.xdg.configHome}/tmux/plugins/tmux-weather/tmux-weather.cache'
			
			####################################
			## Status Bar Layout Configuration ##
			####################################
			
			## First Line ##
			set-option -g status 5
			set-option -g status-right-length '95'
			set-option -g status-right '#{forecast} |#{cpu_bg_color} #{cpu_percentage} #[default]|#{ram_bg_color} #{ram_percentage} #[default]|#{online_status}#[default]|'
			
			## Second Line ##
			set-option -g status-format[1]  '#[align=left]| TMUX | Prefix  | Resize Pane  (U,D,L,R) | Rm (Sen,Win,Pane) | Switch Session | Copy Mode | Cp Start/Copy/Ln End/St/Top/Scroll Up/Dn |#[align=right]Weather|^CPU ^|^RAM ^|Internet#[default]|'
			
			## Third Line ##
			set-option -g status-format[2]  '#[align=left]`----> | <ctl>+a | <pf> <ctl>+[y,h,g,j]   | <pf> [m,k,x]      | <pf> s         | <pf> [    | <ctl> + <space>/w/e/a/R/<up>/<down>      |#[align=right]%Y/%m(%B)/%d(%A), %I(%H):%M:%S %p %Z'
			
			## Forth Line ##
			set-option -g status-format[3]  '#[align=left]| VIM | Mv (L,D,U,R) | Ln St/Ed/1st char | Nx/Prv Word | Fl Tp/Bm  | Undo/Redo  | Rm Chr/Ln | Inst/@End | Fnd & Replace Line [All]  | Fnd & Replace One @ Time             | Srch/Rev | Nxt/Prev | Visual Mode/Cp/Pst | Read (cp fl into cur) | Cmd     | Spell Nx/Pr/Cor/DicAdd |'
			
			## Fifth Line ##
			set-option -g status-format[4]  '#[align=left]`---> | [h,j,k,l]    | 0/$/^             | w/b         | gg/[ln#]G |  u/<ctl>+r | x/dd      | i/A       | :[%%]s/<fndTxt>/<repTxt>/g | /<fnd> -> cgn -> <rep> -> <esc> -> . | / / ?    | :n/N     | :v/y/p             | :r <flNm>             | :!<cmd> | ]s / [s / z= / zg      |'
			
			run ${config.xdg.configHome}/tmux/plugins/tpm/tpm
		'';
		historyLimit = user.shell.history.inMemory;
		mouse = false;
		shortcut = "a";
		# Tmux wrapper.
		tmuxp.enable = true;
	};
}

