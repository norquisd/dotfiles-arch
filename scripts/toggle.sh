#!/bin/bash

# state=$(gsettings get org.gnome.shell.extensions.pop-shell active-hint)

# if [[ "$state" == "false" ]]
# then
# gsettings set org.gnome.shell.extensions.pop-shell active-hint true
# else
# gsettings set org.gnome.shell.extensions.pop-shell active-hint false
# fi

state=$(gsettings get org.gnome.shell.extensions.pop-shell show-title)

if [[ "$state" == "false" ]] 
then
	gsettings set org.gnome.shell.extensions.pop-shell show-title true	
else
	gsettings set org.gnome.shell.extensions.pop-shell show-title false	
fi

