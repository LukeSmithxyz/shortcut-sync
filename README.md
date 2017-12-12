# Luke's Shortcut Sync

I have a lot of file directories and I like being able to easily sort the stuff I download or make in as few keypresses as possible.
I also have a lot of config files that I'm modifying all the time, and I like them to be easily accessible.

Making bash aliases is one thing, but since I use bash, ranger the filemanager *and*  qutebrowser, all with directory specific commands, I want to be able to keep all of the aliases and shortcuts I have for one program consistent with the others.

## Okay so what does this actually do?

This script reads in a file with pairs of key sequences and corresponding directories and creates shortcuts for them in bash and ranger, along with custom download commands in qutebrowser.

For example, you can assign the folder `~/Documents/` to `d`, and you get the following shortcuts:

+ `d` -- as a bash alias to cd to ~/Documents and show its contents
+ `;d` -- as a keyboard shortcut in qutebrowser to automatically select a file (with hints) and download it to that directory
+ And several particularly useful ranger commands:
	+ `gs` -- "go to ~/Documents" as a ranger command to cd there
	+ `md` -- "move to ~/Documents" as a ranger command to move selected files to that directory
	+ `Yd` -- "yank/copy to ~/Documents" a ranger command to *copy* the selected files to that directory
	+ `td` -- "make a tab in ~/Documents" pretty much what it sounds like

This of course goes for *any* shortcut/directory pair you put in the `folders` file.
A similar function is there for consistent access to config/dotfiles or other commonly opened text documents: the script will also read from `configs` to map shortcuts in both bash and ranger to match.

For example, I map `cfb` to my bashrc. This means it functions as an alias in bash, but also ranger will open the file if I press `cfb`.

## Cool, so how do I install it?

Throw all the files in `~/.config/Scripts/` (make the directory if it doesn't already exist). Run `runonce.sh` *once* to prepare you dotfiles. Then check `folders` and `configs` to add all the important, high-traffic files and directories you like to have shortcutted. Then just run `shortcuts.py`.

## How it works

All `shortcuts.py` does is trolls `folders` and `configs` for key/file combos and translates them into the appropriate syntax for each program to get the shortcuts above. It then puts that syntax in a set location in the config files.

The `runonce.sh` script will add two lines that look like this to all three config files:

```bash
# DO NOT DELETE LMAO
# DO NOT DELETE LMAO
```

These are the lines that `shortcuts.py` is looking for, to put the shortcuts between. As they themselves suggest, don't delete these lines or `shortcuts.py` will fail to update your configs. Don't run `runonce.sh` multiple times either (if you do just go into your bash/ranger/qutebrowser configs and delete the extra lines like this until you have only two).

## Other cool tips

You're going to want to have this script run each time you want your shortcuts updated, i.e. when you add new directories or config files to the shortcut list.
One easy way to do this for vim users is having vim automatically run the script whenever you write changes to the `folders` or `configs` files.
You can do this my simply adding the line below to your `vimrc`:

```vim
autocmd BufWritePost ~/.config/Scripts/folders,~/.config/Scripts/configs !python ~/.config/Scripts/shortcuts.py
```
