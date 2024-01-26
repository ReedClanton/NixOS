
# Usage

## Prerequisite(s)

- Install via NixOS GUI installer.
- Create or generate ssh keys.
- Clone this repo (ex. `$HOME/.config/NixOS`).
- Either:
  - Copy `/etc/nixos/hardware-configuration.nix` to `<repoRoot>/host/<hostName>/hardware-configuration.nix`.
  - Or manually update `<repoRoot>/host/<hostName>/hardware-configuration.nix` to reflect host hardware.
- Review `nixos/modules/` file(s) basic setup matches system or is desired for a new system.
  - In particular, review the bellow as comparied to `/etc/nixos/configuration.nix`:
    - `nixos/modules/boot/*`
    - `nixos/modules/networking/*` (hopfully not for long)
    - `nixos/modules/nix/*` (for NixOS version)
- Add Home Manager Nix channel with: `sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager` when running NixOS `unstable` channel or `sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-<majorNixOsVersionVersion>.<minorNixOsVersion>.tar.gz home-manager` when running on a relase version.
- Remove original `$HOME/.config/user-dirs.dirs` file if it exists.
- Update Nix channels with: `sudo nix-channel --update`.

## Apply Configuration

- Deploy NixOS with: `sudo nixos-rebuild switch --flake <pathToRepoRoot>/#<desiredHostName> --upgrade`.

