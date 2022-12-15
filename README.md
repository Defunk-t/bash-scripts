# Dotfiles

This repo houses the config files and scripts I use on my main Linux workstation.

## What's Inside

This repo is structured like a full file system rather than a traditional dotfiles repo which would just represent a single `$HOME` folder setup. This is because I tend to use multiple Unix accounts on the command line and I'll explain my reasoning for this below.

- ### [`/home/admin/`](home/admin/)

  This is the main directory for my main user (the one I log in with.)

  It contains configs for things like: `bash`, `git`, `gpg`, `xorg`.

  It also contains [scripts](home/admin/scripts/).

  Aliases are defined to bind `pw-get` and `pw-mod` commands to scripts for a very simple password manager. (I'll turn this into its own project at some point.)

- ### [`/home/dev/`](home/dev/)

  > **Warning**
  > I wouldn't really recommend doing this if you don't have a good understanding of file system permissions because you **will** run into complications.

  This contains `$HOME` directories for Unix accounts tailored for specific programming languages or projects e.g. `dev-node` and `dev-ruby`. I add each of these to the `dev` user group.

  Using special unprivileged user accounts for development makes it slightly safer to execute code, especially from third party dependencies. In fact, a lot of Linux packages that use daemons will create a special user when they're installed for security reasons.

  It also makes it easier to customise the development environment while reducing clutter from my own home directory.

  Simply use `sudo -u <user> <command>` to execute a command as an another user. I set up aliases in my [`.bashrc`](home/admin/.bashrc) to simplify this. You can also use `su <user>` to switch to that user's shell.

  I tend to keep my programming projects in these special user folders and then either symlink them in my own `$HOME` directory, or just add the folders to a workspace in my IDE. Project folders use the group sticky bit permission.

## My Machine

<div align=center><image src=neofetch.jpg alt=Neofetch></div>

I use a laptop that runs Arch Linux with the XFCE4 desktop environment and I plan to experiment with other window managers, shells, and more when I have some time.
