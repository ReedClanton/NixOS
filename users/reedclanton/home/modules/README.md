# User's Host Independent Home Manager Configuration

Contains only host independent `nix` file(s) run by Home Manager.

## Purpose

Contains user's Home Manager `nix` module(s). They are split up so they may be more easily modified, deactivated, or removed.

## Usage

Contains *only* directories. Each directory's name must correspond with a module (ex. `xdg`) or a grouping of modules (ex. `hardware`). Either way, it's expected that each directory contains a `ddefault.nix` file. For example, `./<moduleName>/default.nix` and `./<moduleName>/<subModuleName>/default.nix` would both exist.

## Rule(s) & Guideline(s)

- May *only* contain directories.
- *All* directories must be the name of a module (ex. `xdg`) or module group (ex. `hardware`).
- `./<moduleName>/default.nix` is presumed to exist:
   - This file shale run all module configuration contained within.
- When `./<moduleName>/<subModuleN>/` exists, then `./<moduleName>/<subModuleN>/default.nix` is presumed to exist:
   - This file shale run the subset of module configuration contained within.
- The root 'default.nix` may be called, or a sub-module's `default.nix` may be called in lieu of it.
- File(s) will be run from within a Home Manager context.

# Content(s)

Contents is subject to frequent change. For more information about a particular module, take a look at it's `./<moduleOfIntrest>/README.md`.

