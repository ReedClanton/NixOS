# Users

Each user should have one directory located in the same directory as this file. The directory should match the user's system user name.

# User's Directory Content(s)

1. `./<userName>/default.nix`:
  - Contains user's *system* configuration (i.e. NixOS configuration, *not* Home Manager).
2. `./<userName>/modules/`:
  - Contains NixOS system module(s) (i.e. NixOS configuration, *not* Home Manager).
  - Note(s):
    - Each module should consist of a directory that contains `.nix` file(s) (normally at least a `default.nix`).
	- Module(s) needed for a basic tty system must be imported by the `./<userName>/default.nix` file.
	- Module(s) needed for a specific system variant (ex. Gnome, KDE, Hyprland, etc.) should be called by the relavent flake.
3. `./<userName>/home/`:
  - Contains user's Home Manager configuration.
4. `./<userName>/home/default.nix`:
  - Root of user's Home Manager configuration (offten people name this file `home.nix`).
  - Template for this file is [here](./docs/home-default.nix) (make sure you replace all text enclosed by `<` and `>`).
5. `./<userName>/home/modules/`:
  - Contains Home Manager module(s).
  - Note(s):
    - Each module should consist of a directory that contains `.nix` file(s) (normally at least a `default.nix`).
	- Module(s) needed for a basic tty system must be imported by the `./<userName>/home/default.nix` file.
	- Module(s) needed for a specific system variant (ex. Gnome, KDE, Hyprland, etc.) should be called by the relavent flake.
6. `./<userName>/home/config/`:
  - Contains configuration file(s) for specific applications/system elements (ex. Firfox, hyprland).
  - Note(s):
    - Each configuration file/set of files should be contained in a directory. For example, for `neovim` the path would be `./<userName>/home/config/neovim/init.vim`.
7. `./<userName>/home/data/`:
  - Stores all of user's data (i.e. *not* configuration).
  - Is *not* included in git repo.

