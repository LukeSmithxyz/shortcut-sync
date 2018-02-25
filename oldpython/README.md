# Old Complicated Readme for the Python File (only applies to `shortcuts.py`)

## Cool, so how do I install it?

Throw all the files in `~/.scripts/` (make the directory if it doesn't already exist). Run `runonce.sh` *once* to prepare you dotfiles. Then check `folders` and `configs` to add all the important, high-traffic files and directories you like to have shortcutted. Then just run `shortcuts.py`.

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
autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !python ~/.scripts/shortcuts.py
```
