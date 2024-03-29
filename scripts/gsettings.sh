switch_to_application="gsettings set org.gnome.shell.keybindings switch-to-application-"
switch_to_workspace="gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-"
move_to_workspace="gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-"
for i in {1..9}
do
  cmd="${switch_to_application}${i} \"['']\""
  eval ${cmd} 
  cmd="${switch_to_workspace}${i} \"['<Super>${i}']\""
  eval ${cmd}
  cmd="${move_to_workspace}${i} \"['<Super><Shift>${i}']\""
  eval ${cmd}
done

gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['']"
gsettings set org.gnome.shell.extensions.pop-shell focus-left "['<Super>h']" 
gsettings set org.gnome.shell.extensions.pop-shell focus-down "['<Super>j']" 
gsettings set org.gnome.shell.extensions.pop-shell focus-up "['<Super>k']" 
gsettings set org.gnome.shell.extensions.pop-shell focus-right "['<Super>l']" 
gsettings set org.gnome.shell.extensions.pop-shell gap-inner "uint32 5" 
gsettings set org.gnome.shell.extensions.pop-shell gap-outer "uint32 5" 
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-left "['']"
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-down "['']"
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-up "['']"
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-right "['']"
gsettings set org.gnome.shell.extensions.pop-shell tile-swap-left "['<Super><Shift>h']" 
gsettings set org.gnome.shell.extensions.pop-shell tile-swap-down "['<Super><Shift>j']" 
gsettings set org.gnome.shell.extensions.pop-shell tile-swap-up "['<Super><Shift>k']" 
gsettings set org.gnome.shell.extensions.pop-shell tile-swap-right "['<Super><Shift>l']" 
gsettings set org.gnome.shell.extensions.pop-shell tile-enter "['<Super><Shift>Return']" 
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>Tab']"

#custom keybinding
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

#kitty
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Kitty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'kitty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

#firefox
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Firefox'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'firefox'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>b'

#toggle window titlebars
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Titlebars'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'bash /home/quinn/.dotfiles/scripts/toggle.sh'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Super><Shift>y'
