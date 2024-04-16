# User's Home Manager Flatpak Package(s)

Contains all flatpak package(s) user would like installed by Home Manger.

## Purpose

Groups all flatpak package(s) together. Doing so allows for greater control over what is and isn't installed.

## Usage

Call `default.nix` to install all package(s), or install only the desired ones by calling specific file(s).

## Rule(s) & Guideline(s)

- May only contain `nix` file(s) that install and configure a package via Home Manager.

# Content(s)

## `default.nix`

### Purpose

Installs all package(s) contained in `nix` files in currently directory via Home Manager.

### Usage

Runs all file(s) in current directory that have a `nix` extension by importing them.

### Rule(s) & Guideline(s)

- May only import files.
- May *not* contain `nix` configuration other than importing.

## `<packageName>.nix`

### Purpose

Installs package file is named after via Home Manager.

### Usage

Import file to install corresponding package.

### Rule(s) & Guideline(s)

- May not configure anything not directly related to the package being installed.
- Must install the package the file is named after.

