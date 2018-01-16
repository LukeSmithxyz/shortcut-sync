#!/bin/bash
mkdir -p ~/.config/qutebrowser
mkdir -p ~/.config/ranger

echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.bashrc
echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.config/ranger/rc.conf
echo "# DO NOT DELETE LMAO\n# DO NOT DELETE LMAO" >> ~/.config/qutebrowser/config.py

python shortcuts.py

echo "You have now successfully run 'runonce.sh'."
echo "To prevent you from running this script twice (for your own good), this script will now delete itself."
echo ""
echo "Now add the shortcuts you want to the 'folders' and 'configs' files."
echo "After that, you can run 'shortcuts.py' anytime to update your shortcuts again."

rm runonce.sh
