{ ... }: {
	documentation.nixos = {
		enable = true;
		includeAllModules = true;
		options.warningsAreErrors = true;
	};
}
