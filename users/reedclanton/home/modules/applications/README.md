# User's Home Manager Application(s)

Contains all applications user would like Home Manager to handle the instillation of.

# Content(s)

## `default.nix`

### Purpose

Installs all applications. This includes both TTY and GUI applications, so this file *shouldn't* be called when TTY UI is in use.

### Usage

Import file to install all Home Manager installed application(s).


## [`gui/`](./gui/README.md)

Contains all GUI application(s) user would like to have installed by Home Manager. See section title link for more.

## [`tty/`](./tty/README.md)

Contains all TTY (terminal) application(s) user would like to have installed by Home Manager. See section title link for more.

