# Purpose

Organizes configuration file(s) used by this user's Home Manager configuration.

# Usage

Contains *only* directories. Each directory's name must correspond with an application or module, run by Home Manager, in `../modules/`. Contents of each directory may be of any type of configuration file, however, non-configuration data, and `nix` files that take parameters (nix functions) are *not* allowed.

# Rule(s) & Guideline(s)

- May contain only directories named after the program that's installed by Home Manager.
- The `README.md` is the only non-directory file allowed in this directory.
- All types of configuration files are allowed.
- No `nix` files that contain functions may be stored here.
- `nix` files that only contain configuration data, but don't set those values, are allowed:
   - For the value(s) in these files to be utilized in the Home Manager configuration, they must be assigned to a Home Manager option by another `nix` file.
- No non-configuration data may be stored here.

