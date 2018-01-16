#!/bin/bash

# Config locations
folders="$HOME/.config/Scripts/folders"
configs="$HOME/.config/Scripts/configs"

# Output locations
bash_shortcuts="$HOME/.bash_shortcuts"
ranger_shortcuts="$HOME/.config/ranger/shortcuts.conf"
qute_shortcuts="$HOME/.config/qutebrowser/shortcuts.py"

# Ensuring that output locations are properly sourced
cat ~/.bashrc | grep "source ~/.bash_shortcuts" || echo "source ~/.bash_shortcuts" >> ~/.bashrc
cat ~/.config/ranger/rc.conf | grep "source ~/.config/ranger/shortcuts.conf" || echo "source ~/.config/ranger/shortcuts.conf" >> ~/.config/ranger/rc.conf
cat ~/.config/qutebrowser/config.py | grep shortcuts.py || echo "config.source('shortcuts.py')" >> ~/.config/qutebrowser/config.py

#Delete old shortcuts
echo "# vim: filetype=sh" > $bash_shortcuts
echo "# ranger shortcuts" > $ranger_shortcuts
echo "# qutebrowser shortcuts" > $qute_shortcuts

IFS=$'\n'
set -f
for line in $(cat "$folders"); do
	key=$(echo $line | awk '{print $1}')
	dir=$(echo $line | awk '{print $2}')
	echo "alias $key='cd $dir && ls -a'" >> $bash_shortcuts
	echo "map g$key cd $dir" >> $ranger_shortcuts
	echo "map t$key tab_new $dir" >> $ranger_shortcuts
	echo "map m$key shell mv %s $dir" >> $ranger_shortcuts
	echo "map Y$key shell cp -r %s $dir" >> $ranger_shortcuts
	echo "config.bind(';$key', 'set downloads.location.directory $dir ;; hint links download')" >> $qute_shortcuts
done

set -f
for line in $(cat "$configs");
do
	short=$(echo $line | awk '{print $1}')
	conf=$(echo $line | awk '{print $2}')
	echo "alias $short='vim $conf'" >> $bash_shortcuts
	echo "map $short shell vim $conf" >> $ranger_shortcuts
done
