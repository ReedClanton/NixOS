# User's Home Manager Application(s)

Contains all application(s) user would like Home Manager to handle the instillation or configuration of.

## Purpose

Tracks all host independent application install and configuration, regardless of UI or install method, user would like run by Home Manager.

## Rule(s) & Guideline(s)

- The `README.md` and `default.nix` *shale* be the only non-directory files in this directory.
- All directory file(s) *shale* be named after the type of UI the contained application(s) utilize.
- *Only* `nix` files are allowed.

# Content(s)

## `default.nix`

### Purpose

Installs and configures all Home Manager application(s). This includes both TTY and GUI application(s), thus this file *shouldn't* be called when TTY UI is in use.

### Usage

Import file to install and configure all Home Manager application(s).

### Rule(s) & Guideline(s)

- File *shale* only import other file(s) and not configure anything itself.

## [`gui/`](./gui/README.md)

Contains all GUI application(s) and configuration user would like to have run by Home Manager. See section title link for more.

## [`tty/`](./tty/README.md)

Contains all TTY (terminal) application(s) and configuration user would like to have run by Home Manager. See section title link for more.

