# Home Manager Configuration

All `nix` files in this directory are run by Home Manager.

## Purpose

Contains all data and `nix` needed to fully configure Home Manager for the user. May be run independent of NixOS.

## Usage

`default.nix` is called with all parameters needed provided.

## Rule(s) & Guidelines

- `default.nix` is the entry point and thus is the only file that may be directly called from an external directory.

# Content(s)

## `default.nix`

File that brings together this user's Home Manager configuration. When in doubt as to what Home Manager files are being run, start here.

### Purpose

Is in charge of:

- Calling each part of the user's Home Manager configuration based upon the argument(s) provided.
- Setting up basic Home Manager settings.

### Usage

Ensure the argument(s) declared at the top are available. Then call with Home Manager to kick off user's Home Manager configuration.

### Rules & Guidelines

- This is to be the only file in this directory, or any child directory, that's directly called from outside this directory.
- File should only import other file(s) and set basic Home Manager setting(s):
   - A good rule of thumb here is that `home.<thing>` may be set, but `home.<thing>.<thing2>` should probably be broken out into a module.

## [`config/`](./config/README.md)

Stores non `nix` configuration file(s) for programs installed by Home Manager. See section title link for more.

## [`hosts/`](./hosts/README.md)

Stores Home Manager configurations that are host specific. See section title link for more.

## [`modules/`](./modules/README.md)

Stores user's Home Manager `nix` files. See section title link for more.

