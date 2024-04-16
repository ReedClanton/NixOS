# User's Framework 13 (laptop) Specific Home Manager Configuration

Contains only `nix` files run by Home Manager. All are specific to this host.

## Purpose

Contains user's Home Manager `nix` modules. They are split up so they may be more easily modified, deactivated, or removed.

## Usage

Contains *only* directories. Each directory's name must correspond with a module (ex. `xdg`) or a grouping of modules (ex. `hardware`). Either way, it's expected that `./<moduleName>/default.nix` exists.

## Rule(s) & Guideline(s)

- May *only* contain directories.
- *All* directories must be the name of a module (ex. `xdg`) or module group (ex. `hardware`).
- `./<moduleName>/default.nix` is presumed to exist:
   - This file shale run all module configuration when possible.
- Additional `default.nix` files that select for a subset may exist in child directories:
   - This files may be the primary files called in lieu of the root `default.nix`.
- File(s) will be run from within a Home Manager context.
- Only `nix` configuration that specific to this host should be included.

# Content(s)

Contents is subject to frequent change. For more information about a particular module, take a look at it's `README.md`.

