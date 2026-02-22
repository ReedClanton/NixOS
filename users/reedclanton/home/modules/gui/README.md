# Purpose

Organizes user's configuration of Visual Environment(s) (VE) as configured via Home Manager.

# Usage

Contains *only* directories. Each directory's name *must* correspond with a VE. To run the VE's
Home Manager configuration, call `./<veName>/default.nix`.

If the `ui` variable has been set, then you can call `./default.nix`.

# Rule(s) & Guideline(s)

- Must *only* contain directories named after the VE that the contents corresponds with
(other than this file).

# Content(s)

## `default.nix`

File that's in charge of building this user's Home Manager VE configuration.
When in doubt as to what Home Manager files are being run, start here.

### Purpose

Is in charge of:

- Selecting what VE to configure based on the value of `ui`.
- Installing Home Manager managed GUI application(s):
    - This applies to both local and common (global) Home Manager GUI application(s).

### Usage

Ensure the argument(s) declared at the top are available, `ui` in particular.
Then call from within a Home Manager context
(i.e. Home Manager already exists within calling scope) to kick off user's
Home Manager configuration.

## `vm.nix`

File that's in charge of building the user's Home Manager VE configuration for the `vm` host.

### Purpose

Is in charge of:

- Selecting what VE to configure based on the value of `ui`.
- Installing Home Manager GUI application(s):
    - This applies to both local and common (global) Home Manager GUI application(s).
    - Not all application(s) are installed due to this host being a virtual machine.

### Usage

This is intended to be called from the `./default.nix` file when the `host` variable
is set to `vm`.

# Term(s)

- VE -> Visual Environment
- DE -> Desktop Environment
- WM -> Window Manager

