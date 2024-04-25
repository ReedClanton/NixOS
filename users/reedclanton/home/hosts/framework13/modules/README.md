# User's Framework 13 (laptop) Specific Home Manager Configuration

Contains only `nix` files run by Home Manager. All are specific to this host.

## Purpose

Contains user's Home Manager `nix` modules. They are split up so they may be more easily modified, deactivated, or removed.

## Usage

Contains *only* directories. Each directory's name must correspond with a module (ex. `xdg`) or a grouping of modules (ex. `hardware`). Either way, it's expected that each directory contains a `default.nix` file. For example, `./<moduleName>/default.nix` and `./<moduleName>/<subModuleName>/default.nix` would both exist.

## Rule(s) & Guideline(s)

- May *only* contain directories.
- *All* directories must be the name of a module (ex. `xdg`) or module group (ex. `hardware`).
- `./<moduleName>/default.nix` is presumed to exist:
   - This file shale run all module configuration.
- When `./<moduleName>/<subModuleN>/` exists, then `./<moduleName>/<subModuleN>/default.nix` is presumed to exist:
   - This file *shale* run the subset of module configuration contained within.
- The root `default.nix` may be called, or a sub-module's `default.nix` may be called in lieu of it.
- File(s) will be run from within a Home Manager context.
- Only `nix` configuration that's specific to this host *shale* be included.

# Content(s)

Contents is subject to frequent change. For more information about a particular module, take a look at `./<moduleOfIntrest>/README.md`.

