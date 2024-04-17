{ lib, ... }:
with lib;
let
	# Recursively constructs an attrset of a given folder, recursing on directories, value of attrs is the file type.
	getDir = dir: mapAttrs
		(file: type:
			if type == "directory" then getDir "${dir}/${file}" else type
		)
		(builtins.readDir dir);

	# Collects all files of a directory as a list of strings of paths
	files = dir: collect isString (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));

	# Returns list of files in directories specified. Value passed in must always be current directory.
	validFiles = dir: map
		(file: ./. + "/${file}")
		(filter
			(file: hasSuffix ".nix" file && file != "default.nix")
			(files dir)
		);
in {
  # Manually import flatpak setup because `default.nix` files aren't imported by `validFiles`.
	imports = validFiles ./. ++ [ (if builtins.pathExists ./flatpaks/default.nix then ./flatpaks else ../../../../../../modules/home-manager/applications/gui/flatpaks) ];
}

