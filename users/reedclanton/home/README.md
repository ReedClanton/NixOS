# Home Manager Configuration

All `nix` files in this directory are run by Home Manager.

# TODO(s)

- Update `flake.nix` so the only entry point into the Home Manager configuration is `./default.nix`.

# `default.nix`

File that brings together this user's Home Manager configuration. When in doubt as to what Home Manager files are being run, start here.

## Purpose

Is in charge of calling each part of the user's Home Manager configuration based upon the argument(s) provided.

## Usage

Ensure the argument(s) declared at the top are available. Then call file to kick off user's Home Manager configuration.

## Rules & Guidelines

- This is to be the only file in this directory, or any child directory, that's directly called from outside this directory.
- File should only import other file(s).

# [`config/`](./config/README.md)

Stores non `nix` configuration file(s) for programs installed by Home Manager. See section title link for more.

# [`hosts/`](./hosts/README.md)

Stores Home Manager configurations that are host specific. See section title link for more.

# [`modules/`](./modules/README.md)

Stores user's Home Manager `nix` files. See section title link for more.

