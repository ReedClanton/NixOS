# User's Host Independent Home Manager Configuration

Contains only `nix` files. All are run, regardless of host, by Home Manager.

## Purpose

Contains user's Home Manager `nix` modules. They are split up so they may be more easily modified, deactivated, or removed.

## Usage

Contains *only* directories. Each directory's name must correspond with a module (ex. `xdg`) or a grouping of modules (ex. `hardware`). Either way, it's expected that `./<moduleName>/default.nix` exists.

## Rule(s) & Guideline(s)

- May *only* contain directories.
- *All* directories must be the name of a module (ex. `xdg`) or module group (ex. `hardware`).
- `./<moduleName>/default.nix` is presumed to exist.
- Additional `default.nix` files that select for a subset may exist in child directories.

# Content(s)

Contents is subject to frequent change. For more information about a particular module, take a look at it's `README.md`.

