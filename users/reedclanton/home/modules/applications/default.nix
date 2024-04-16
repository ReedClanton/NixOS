# This file installed *all* applications. Not appropriate for tty environments.
{ ... }: {
  imports = [
    ./gui
    ./tty
  ];
}

