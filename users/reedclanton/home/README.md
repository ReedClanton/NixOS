# Home Manager Configuration

All `nix` files in this directory, and all sub-directories, are run by Home Manager.

## Purpose

Contains all data, configuration, and `nix` file(s) needed to fully configure Home Manager for
this user. May be run independent of NixOS.

## Usage

Home Manager configuration has been broken out into this directory so it may be removed or used
independent of NixOS.

## Rule(s) & Guideline(s)

- `default.nix` is the entry point to this Home Manager configuration.
- The only file(s) that may be called that exist about this directory are common Home Manager
modules:
   - These calls must not prevent successful execution when the external file doesn't exist.
- No file or directory that's not documented in this README may be added to this directory (other than this README).

# Content(s)

## `default.nix`

File that's in charge of building this user's Home Manager configuration. When in doubt as to what Home Manager files are being run, start here.

### Purpose

Is in charge of:

- Calling each part of the user's Home Manager configuration based upon the argument(s) provided.
- Setting up basic Home Manager settings.

### Usage

Ensure the argument(s) declared at the top are available. Then call from within a Home Manager context (i.e. Home Manager already exists within calling scope) to kick off user's Home Manager configuration.

### Rule(s) & Guideline(s)

- This is to be the only file in this directory, or any child directory, that's directly called from an outside (i.e. parent) directory.
- Must be called from within a Home Manager context (i.e. Home Manager isn't imported, thus it be already exist in the calling scope).
- File should only import other file(s) and set basic Home Manager setting(s):
   - A good rule of thumb here is that `home.<thing>` may be set, but `home.<thing>.<thing2>` should probably be broken out into a module.

## [`config/`](./config/README.md)

Stores non `nix` configuration file(s) for programs installed by Home Manager. See section title link for more.

## [`data/`](./data/README.md) (may not exist)

Stores files that aren't `nix` or application configuration files. See section title link for more.

## [`hosts/`](./hosts/README.md)

Stores Home Manager configurations that are host specific. See section title link for more.

## [`modules/`](./modules/README.md)

Stores user's Home Manager `nix` files. See section title link for more.

