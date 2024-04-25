# User's Host Specific Visual Environment (VE) Install & Configuration via Home Manager

## Purpose

Contains and organizes all host specific VE install and configuration done via Home Manager.

## Usage

Contains *only* directories. Each directory's name must correspond with a VE. To run the VE's Home Manager configuration, call `./<veName>/default.nix`.

## Rule(s) & Guideline(s)

- Must *only* contain directories named after the VE that the contents corresponds with (other than this file).
- *Only* `nix` files are allowed.
- This module *doesn't contain* a top level `default.nix`:
   - This is because it doesn't make sense to install every supported VE at once (can only use one at a time).

# Content(s)

When new VEs are added, corresponding sections should be added bellow.

## [`gnome/`](./gnome/README.md)

Contains all host specific GNOME install and configuration done via Home Manager. See section title for more.

## [`hyprland/`](./hyprland/README.md)

Contents all host specific Hyprland install and configuration done via Home Manager. See section title for more.

## [`kde/`](./kde/README.md)

Contents all host specific KDE install and configuration done via Home Manager. See section title for more.

## [`xfce/`](./sfce/README.md)

Contents all host specific XFCE install and configuration done via Home Manager. See section title for more.

