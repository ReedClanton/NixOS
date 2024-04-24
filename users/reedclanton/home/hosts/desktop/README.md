# User's Desktop Home Manager Configuration

Contains user's Home Manager configuration that's specific to the desktop host/machine. For more general information, see the [parent directory's README.md](../README.md).

## Purpose

Tracks all Home Manager configuration that's specific to this host. Any configuration that's not specifically for this host and indented to be run via Home Manager, won't be found here.

## Usage

Contents is run by `../default.nix` rather than this directory containing a `default.nix`. This was done because each host is normally very similar, thus this reduces duplicated code.

## Rule(s) & Guideline(s)

- *Will* be called from an external, parent, directory.
- May *only* contain host specific Home Manager configuration.
- May *not* contain any NixOS (non Home Manager) or host independent configuration.

# Content(s)

## [`config/`](./config/README.md)

Stores non `nix` configuration file(s) for application(s) installed by Home Manager that are specific to this host. See section title link for more.

## [`data/`](./config/README.md) (may not exist)

Stores file(s) that aren't `nix` or application configuration file(s). Must be specific to this host. See section title for more.

## [`modules`](./modules/README.md)

Stores user's Home Manager `nix` file(s). Must be specific to this host. See section title link for more.

