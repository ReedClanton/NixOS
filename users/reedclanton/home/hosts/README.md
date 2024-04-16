# User's Host Specific Home Manager Configuration

Contains all of this user's, host specific, Home Manager `nix` configuration.

## Usage

Contains one directory for each host user would like to have Home Manager configuration run for.

## Rule(s) & Guideline(s)

- `defalut.nix` is the entry point and thus is the only file that may be directly called from an external directory.
- Each directory name must be one of the following:
   - Named after a host:
      - Contents shale be host specific Home Manager configuration desired by user.
   - [`config`](./config/README.md) (may not exist).
   - [`data`](./data/README.md) (may not exist).
- No other files or directories other than the one(s) listed here, and this file, shale exist.

# Content(s)

## `default.nix`

File that handles running this user's Home Manager host specific configuration.

### Purpose

Handles importing, and only importing, of any host specific Home Manager configuration. In other words, this file configures Home Manager by importing files rather than containing `nix` syntax itself.

### Usage

*Attempts* to call any and all file(s) that *may* exist in any host specific directory. In other words, if one host configure widget 1, but no other host does, then this file should *attempt* to call widget 1 for all hosts. When a called `nix` file doesn't exist, it should be silently ignored.

Argument(s) passed to this file are used to search for and find imported file(s). This includes, at a minimum, `host` witch corresponds with a directory name in the same location as the file.

### Rules & Guidelines

- May *only* import `nix` files:
   - May *not* contain `nix` configuration.
- *All* import(s) *must* be optional:
   - If one doesn't exist, ignore it.

## `<host>/`

Contents is subject to frequent change. For more information about a particular host, take a look at it's `README.md`.

