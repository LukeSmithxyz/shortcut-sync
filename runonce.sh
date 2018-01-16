#!/usr/bin/bash
echo "Welcome to Shortcut Sync!"
echo "Creating config files for qutebrowser and ranger in case they don't exist"
mkdir -p ~/.config/qutebrowser
mkdir -p ~/.config/ranger
echo "creating '~/.config/Scripts' with symlinks to shortcuts, configs"
mkdir -p ~/.config/Scripts
ln -s "$PWD/folders" ~/.config/Scripts/folders"
ln -s "$PWD/configs" ~/.config/Scripts/configs
echo "adding markup tags to config files"
echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.bashrc
echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.zshrc
echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.config/ranger/rc.conf
echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.config/qutebrowser/config.py
echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.config/gtk-3.0/bookmarks
echo "adding auto-update line to .vimrc"
echo "autocmd BufWritePost $PWD/folders,$PWD/configs !python $PWD/shortcuts.py"echo -e "autocmd BufWritePost $PWD/folders,$PWD/configs !python $PWD/shortcuts.py" >> ~/.vimrc
echo ""
echo "You have now successfully run 'runonce.sh'."
echo ""
echo "Now update the shortcuts you want to the 'folders' and 'configs' files."
echo "After that, you can run 'shortcuts.py' to update your shortcuts again."
echo "python shortcuts.py is also run when '$PWD/configs' or '$PWD/folders' are updated"
echo "make sure you do not run this script a second time!"
