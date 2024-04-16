# Purpose

Organizes configuration files.

# Usage

Contains *only* directories. Each directory's name must correspond with an application or module run by Home Manager via `../default.nix`. Contents of each directory may be any type of configuration file, however, `nix` files and non-configuration data are *not* allowed.

# Rule(s) & Guideline(s)

- May contain only directories named after the program that's installed by Home Manager.
- The `README.md` is the only non-directory file allowed in this directory.
- No `nix` files may be stored here.
- No non-configuration data may be stored here.

