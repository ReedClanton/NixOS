# User's Host Specific Home Manager Application(s)

Contains all application(s) user would like Home Manager to handle the instillation or configuration of. Generic, host independent, configuration shouldn't be included.

## Purpose

Tracks all host specific application install and configuration, regardless of UI or install method, user would like run by Home Manager.

## Rule(s) & Guideline(s)

- The `README.md` and `default.nix` *shale* be the only non-directory files in this directory.
- All directory file(s) *shale* be named after the type of UI the contained applications utilize.
- *Only* `nix` files are allowed.

# Content(s)

## `default.nix`

### Purpose

Installs and configures all host specific Home Manager application(s). This includes both TTY and GUI application(s), thus this file *shouldn't* be called when TTY UI is in use.

### Usage

Import file to install and configure all host specific Home Manager application(s).

### Rule(s) & Guideline(s)

- File *shale* only import other file(s) and not configure anything itself.

## [`gui/`](./gui/README.md) (may not exist)

Contains all host specific GUI application(s) and configuration user would like to have run by Home Manager. See section title link for more.

## [`tty/`](./tty/README.md)

Contains all host specific TTY (terminal) application(s) and configuration user would like to have run by Home Manager. See section title link for more.

