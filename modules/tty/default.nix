{ ... }: {
	## TTY Login Prompt Setup ##
	environment.etc.issue = {
		text = ''
\e[1;34m_____   _______         \e[0;33m  _______ ________      \e[1;37m| \e[1;32m\t on \d
\e[1;34m___  | / /___(_)____  __\e[0;33m  __  __ \__  ___/       \e[1;37m|
\e[1;34m__   |/ / __  / __  |/_/\e[0;33m  _  / / /_____ \        \e[1;37m| \e[1;34m\s \r (\m)
\e[1;34m_  /|  /  _  /  __>  <  \e[0;33m  / /_/ / ____/ /       \e[1;37m| \e[1;33m\U logged in
\e[1;34m/_/ |_/   /_/   /_/|_|  \e[0;33m  \____/  /____/         \e[1;37m| \e[1;35m\l on \e[1;36m\n
\e[1;31m<<< Run 'nixos-help' for the NixOS manual. >>>\e[0m

'';
		mode = "0440";
	};
}

