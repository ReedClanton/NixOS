{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		# CLI for Proton GE.
#		protonup-ng
		# GUI for Proton GE.
		protonup-qt
	];
}
