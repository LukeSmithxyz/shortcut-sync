**NOTE: This repo is no longer active, but the files are there updated in my
[voidrice](https://github.com/lukesmithxyz/voidrice).** This repo eventually
became minimal, but integrated enough to become part of my main dotfiles. You
now only need the one `shortcuts(.sh)` file for everything to work.

# Luke's Shortcut Sync

I have a lot of file directories and I like being able to easily sort the stuff I download or make in as few keypresses as possible.
I also have a lot of config files that I'm modifying all the time, and I like them to be easily accessible.

Making shell aliases is one thing, but since I use bash, ranger the filemanager *and*  qutebrowser, all with directory specific commands, I want to be able to keep all of the aliases and shortcuts I have for one program consistent with the others.

So I wrote this tiny `shortcuts.sh` script that generates consistent shortcuts aliases for all three programs based on lists of key/directory or key/config combos you can change whenever you want.

## Okay so what does this actually do?

This script reads in a file (`folders`) with pairs of key sequences and corresponding directories and creates shortcuts for them in bash (or any shell) and ranger, along with custom download commands in qutebrowser.

For example, you can assign the folder `~/Documents/` to `d`, and you get the following shortcuts:

+ `d` -- as a bash alias to cd to ~/Documents and show its contents
+ `;d` -- as a keyboard shortcut in qutebrowser to automatically select a file (with hints) and download it to that directory
+ And several particularly useful ranger commands:
	+ `gd` -- "go to ~/Documents" as a ranger command to cd there
	+ `md` -- "move to ~/Documents" as a ranger command to move selected files to that directory
	+ `Yd` -- "yank/copy to ~/Documents" a ranger command to *copy* the selected files to that directory
	+ `td` -- "make a tab in ~/Documents" pretty much what it sounds like

This of course goes for *any* shortcut/directory pair you put in the `folders` file.
A similar function is there for consistent access to config/dotfiles or other commonly opened text documents: the script will also read from `configs` to map shortcuts in both bash and ranger to match.

For example, I map `cfb` to my bashrc. This means it functions as an alias in bash, but also ranger will open the file if I press `cfb`.

## Installation

Put the files `folders`, `configs` and `shortcuts.sh` in `~/.scripts/` (create it if not existing, and yes it's easy enough to change `shorcuts.sh` to refer to other file locations).

Whenever you run `shortcuts.sh`, the script will read the combinations from `folders` and `configs` and add/update your shortcuts. If you're a vim-user, I recommend you putting the line below into your vimrc to have `shortcuts.sh` run automatically every time you save either file.

```vim
autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh
```

Notice by default you can edit the `folders` file and `configs` file with `cff` and `cfc` shortcuts, making making shortcuts even easier ;-).

### Non-bash shells

The script will automatically enable shortcuts for bash, but if you use zsh, or *any* typical shell with normal shell syntax, you can usually just throw `source ~/.bash_shortcuts` into your zshrc or other shell config and the script will work just as well for them.

## How it actually works

`shorcuts.sh` will output the shortcuts to three files for each config in the places below:

+ `~/.bash_shortcuts`
+ `~/.config/ranger/shortcuts.conf`
+ `~/.config/qutebrowser/shortcuts.py`

It will also add a line to each of the configs (if not already there) that will source these files. All of this is done automatically.

E.g. the line `source ~/.bash_shortcuts` will be added to your bashrc. You can move this line around or add comments. To "uninstall" Shortcut Sync, just remove these lines. Whenever you run `shortcuts.sh` again, they will be added automatically.

Remember that if there are binding conflicts, the lower mapping will win. So if you want the bindings here to take precedence over your personal aliases, keep these sourcing lines at the bottom. If you want your aliases to take precedence, move the sourcing line to the top.
