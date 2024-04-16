# User's Host Specific Home Manager Configuration

Contains all of this user's, host specific, Home Manager `nix` configuration. This means that if a `nix` expression would apply to all hosts, then it won't be found here. 

## Usage

Contains one directory for each host user would like to have Home Manager configuration run for.

## Rule(s) & Guideline(s)

- `defalut.nix` is the entry point and thus is the only file that may be directly called from a parent directory.
- Each directory not listed in [Content(s)](#contents) must be named after a host:
   - Contents shale be host specific Home Manager configuration user would like run when on a host of that name.
- No other files or directories other than the one(s) listed here, and this file, shale exist.

# Content(s)

## `default.nix`

File that handles running this user's Home Manager host specific configuration. Provided parameter(s), like `host`, are used to run `nix` file(s) associated with the current host.

### Purpose

Handles importing, and only importing, of any host specific Home Manager configuration.

### Usage

*Attempts* to call any and all file(s) that *may* exist in any host specific directory. In other words, if one host configure widget 1, but no other host does, then this file should *attempt* to call widget 1 for all hosts. When a called `nix` file doesn't exist, it should be silently ignored.

Argument(s) passed to this file are used to search for and find imported file(s). This includes, at a minimum, `host` witch corresponds with a directory name in the same location as the file.

### Rules & Guidelines

- May *only* import `nix` files:
   - May *not* contain `nix` configuration.
- *All* import(s) *must* be optional:
   - If an import doesn't exist, it's ignored.

## `<host>/`

Contents is subject to frequent change. For more information about a particular host, take a look at it's `README.md`.

