# User's Host Specific Home Manager TTY Application(s)

Contains all host specific TTY (terminal) application install and configuration user would like run by Home Manager.

## Purpose

Groups all host specific TTY application install, configuration, and package manager configuration run by Home Manager together. Doing so allows for all TTY application(s) to be easily installed on systems without a GUI.

## Usage

There is one directory for each method TTY applications may be installed via Home Manager.

## Rule(s) & Guideline(s)

- Applications installed via:
   - `home.packages` should be contained within `./packages/`.
   - 'programs.<programName>` should be contained within `./programs/`.
- *Only* `nix` files are allowed.

# Content(s)

## `default.nix`

### Purpose

Imports all host specific TTY application install, configuration, and package manager configuration run by Home Manager.

### Usage

Import file to run all TTY application install, configuration, and package manager configuration via Home Manager. Ensure file is called from a Home Manager context.

### Rule(s) & Guideline(s)

- File *shale* only import other file(s) and not configure anything itself.

## [`packages/`](./packages/README.md)

Contains all TTY package(s) (`home.packages`) installed by Home Manager. See section title for more.

## [`programs/`](./programs/README.md)

Contains all TTY program(s) (`programs.<programName>`) installed by Home Manager. See section title for more.

