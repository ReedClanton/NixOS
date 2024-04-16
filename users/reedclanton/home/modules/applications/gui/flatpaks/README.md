# User's Home Manager Flatpak Configuration & Application(s)

Contains user's Home Manager flatpak package manager configuration and package install.

## Purpose

Groups all flatpak package manager configuration and flatpak package instillation handled by Home Manager together.

## Usage

Call only `./default.nix` to configure the flatpak package manager via Home Manager for this user, or `./applications/default.nix` to install the flatpak(s) in that directory for this user (i.e. not system wide).

## Rule(s) & Guideline(s)

- May only contain `nix` file(s) that either:
   - Configure the flatpak package manager OR
   - Install flatpak package(s).

# Content(s)

## `default.nix`

### Purpose

Configures flatpak package manager via Home Manager. This is specific to the user. In other words, this configure flatpak for user specific applications and settings as apposed to system wide.

### Usage

Call with required parameters from a Home Manager context to configure flatpak for specifically this user.

### Rule(s) & Guideline(s)

- Only user specific configuration *shale* be in this file.
- No system wide flatpak configuration is allowed.

## [`applications/`](./applications/README.md)

Contains all flatpak(s) installed via Home Manager. See section title link for more.

