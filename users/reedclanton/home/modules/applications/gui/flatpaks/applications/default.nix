{ lib, user, ... }:
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
			(file: hasSuffix ".nix" file && ! hasSuffix "default.nix" file)
			(files dir)
		);
in {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/applications/gui/flatpaks/applications/default.nix";
    # Tracks location of global flatpak(s).
    global-flatpak-applications = "./../../../../../../../../modules/home-manager/applications/gui/flatpaks/applications/default.nix";
  in validFiles ./. ++ [
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-flatpak-applications}")) then
        ./. + (builtins.substring 1 9999 "${global-flatpak-applications}")
      else
        trivial.warn "${current-file-path}: Common flatpak(s) (${global-flatpak-applications}) couldn't be found. Only user specific ones will be installed." ../../../../../../../../do-nothing.nix
    )
  ];
}

