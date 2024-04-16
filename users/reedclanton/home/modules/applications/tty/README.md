# User's Home Manager TTY Application(s)

Contains all TTY (terminal) application(s) user would like installed by Home Manager.

## Purpose

Groups all TTY application(s) and package manager configuration together. Doing so allows for all TTY applications to be easily installed on systems without a GUI.

## Usage

There is one directory for each method TTY applications may be installed via Home Manager.

## Rule(s) & Guideline(s)

- Applications installed via:
   - `home.packages` should be contained within `./packages/`.
   - 'programs.<programName>` should be contained within `./programs/`.

# Content(s)

## `default.nix`

### Purpose

Imports all TTY applications installed by Home Manager.

### Usage

Import file to install all TTY applications via Home Manager. Ensure file is called from a Home Manager context.

### Rule(s) & Guideline(s)

- File should only import other file(s) and not configure anything itself.

## [`packages/`](./packages/README.md)

Contains all TTY package(s) (`home.packages`) installed by Home Manager. See section title for more.

## [`programs/`](./programs/README.md)

Contains all TTY program(s) (`programs.<programName>`) installed by Home Manager. See section title for more.

