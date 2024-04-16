# User's Home Manager GUI Application(s)

Contains all GUI application(s) user would like installed by Home Manager.

## Purpose

Groups all GUI application(s) and GUI only package manager configuration together.

## Usage

There is one directory for each method GUI applications may be installed via Home Manager.

## Rule(s) & Guideline(s)

- Applications installed via:
   - The flatpak package manager should be contained within `./flatpaks/`.
   - `home.packages` should be contained within `./packages/`.
   - 'programs.<programName>` should be contained within `./programs/`.

# Content(s)

## `default.nix`

### Purpose

Imports all GUI applications installed by Home Manager. It also setups alternative package managers (ex. flatpak).

### Usage

Import file to install all GUI applications via Home Manager. Ensure file is called from a Home Manager context.

### Rule(s) & Guideline(s)

- File should only import other file(s) and not configure anything itself.

## [`flatpaks/`](./flatpaks/README.md)

Contains Home Manager flatpak package manager configuration as well as Home Manager installed flatpak(s). See section title for more.

## [`packages/`](./packages/README.md)

Contains all GUI package(s) (`home.packages`) installed by Home Manager. See section title for more.

## [`programs/`](./programs/README.md)

Contains all GUI program(s) (`programs.<programName>`) installed by Home Manager. See section title for more.

