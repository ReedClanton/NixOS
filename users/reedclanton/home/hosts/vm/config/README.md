# Purpose

Organizes configuration file(s) needed by `nix` code in `../modules/`.

# Usage

Contains *only* directories. Each directory's name must correspond with an application or module, run by Home Manager, in `../modules/`.

# Rule(s) & Guideline(s)

- May contain only directories named after the program that's installed by Home Manager.
- The `README.md` is the only non-directory file allowed in this directory.
- No `nix` files may be stored here.
- No non-configuration data may be stored here.
- No host independent configuration file(s) are allowed.
- No non-configuration data may be stored here.
- No host independent configuration file(s) are allowed.

