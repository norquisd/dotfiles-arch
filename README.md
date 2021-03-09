# neovim
To get my neovim configuration running correctly, you need a couple of things.

First, I use [neovim-nightly](https://github.com/neovim/neovim/releases/tag/nightly), which is neccessary for use of [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

Secondly, I use [vim-plug](https://github.com/junegunn/vim-plug) as my plugin manager.

You'll probably want to install [pynvim](https://github.com/neovim/pynvim) for plugin support, and [nodejs](https://nodejs.org/en/download/package-manager) for [coc](https://github.com/neoclide/coc.nvim/) (coc has a curl command on their repo for easy node installation).

Once you have these installed, you can copy **nvim** to **~/.config/nvim**, open **init.vim** and run **:PlugInstall**

# coc
A few coc extensions I have installed are **coc-vimtex** (latex), **coc-ultisnips**, and **coc-pyright** (python). These can be installed in neovim via **:CocInstall *extension name***, or you can manage your extensions with [coc-marketplace](https://github.com/fannheyward/coc-marketplace)

# latex
To get [vimtex](https://github.com/lervag/vimtex) working with my setup, you'll need to use **zathura**, which you can install via
```bash
apt install zathura
```
on debian based distros or 
```bash
pacman -S zathura
```
on arch based distros. On arch based distros, you need to install the pdf backend with 
```bash
pacman -S zathura-pdf-mupdf
```
(you may need to do this on debian as well, I'm not sure). 

Vimtex supports compile-on-save, and synctex. You'll need to install [neovim-remote](https://github.com/mhinz/neovim-remote) for synctex support. You can forward search with **leader + lv** and backward search by **ctl+left click** on the appropriate text in zathura.

If you would like to view a pdf without the recoloring, you can type **:set recolor** in zathura, or remove the corresponding line in zathurarc.

Finally, you should copy **tex.snippets** and **texmath.snippets** to **~/.config/nvim/autoload/plugged/vim-snippets/UltiSnips** (you'll probably want to change/rename my *homework* snippet in **tex.snippets** to a more suitable document template).

Note that I use *ctl-j*, *ctl-k* for snippet menu navigation, and *ctl-l* for snippet expansion. You can then use *tab* and *shift+tab* for jumping between in-snippet tabstops.

For some information on the snippets, I copied them mostly from [gillescastel](https://github.com/gillescastel/latex-snippets "fillescastro"). He has an explanation of how these work [here](https://castel.dev/post/lecture-notes-1/).

# fonts
The font I use for my terminal (and hence ranger, neovim etc) is [FiraCode](https://github.com/tonsky/FiraCode). You can install it via
```bash
apt install fonts-firacode
```
or 
```bash
pacman -S ttf-fira-code
```
Additionally, the system font I use (you can set this via gnome_tweaks -> Fonts) is Roboto
```bash
apt install fonts-roboto
```
or 
```bash
pacman -S ttf-roboto
```
# gnome

![screenshot2](screenshot2.png?raw=true)
![screenshot1](screenshot1.png?raw=true)

To get my gnome setup, you'll want to install the package **gnome-tweaks** if you don't already have it. Then, I use [arc-dark](https://github.com/arc-design/arc-theme) as my gtk theme and gnome-shell theme, and [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) as my icon theme. Also, I use [vimix-cursors](https://github.com/vinceliuice/Vimix-cursors) as my cursor.

Probably the most useful extension I have found on gnome is System76's [tiling-extension](https://github.com/pop-os/shell). I would recommend installing this, and configuring the keyboard shortcuts to your liking.

If you haven't used a tiling manager before, having good keyboard shortcuts for window navigation and workspaces is crucial. Typically, one would use something like *super+h,j,k,l* or *super+up,down,left,right* for window navigation, and *super+1* to move to workspace 1, *super+2* to move to workspace 2, etc. Then maybe something like *super+shift+1* to move your active window to workspace 1 and so on. Personally, I use 4 static workspaces, rather than dynamic workspaces, which you can enable via gnome-tweaks -> Workspaces. Finally, you'd probably want to come up with some keyboard shortcuts for frequently used applications, like a terminal, browser, file explorer, etc.

If you want exactly the setup that I have in my screenshots, then here are the other extensions I use:

- [dynamic-panel-transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/) for the transparent top bar (I use full transparency at all times, and I also tick "Remove excess panel styling" to get rid of some glitches with the arc theme).
- [coverflow alt-tab](https://extensions.gnome.org/extension/97/coverflow-alt-tab/)
- [workspace matrix](https://extensions.gnome.org/extension/1485/workspace-matrix/)
- [top icons plus](https://extensions.gnome.org/extension/1031/topicons/)

The dock I use is **plank**
```bash
apt install plank
```
or
```bash
pacman -S plank
```
If you already have a panel/dock (for example, ubuntu's side panel), you can disable it via gnome-tweaks -> Dash to panel.

Finally, if you'd like to change the background of GDM (the gnome login screen), you can do so with the handy script [here](https://github.com/DimaZirix/fedora-gdm-wallpaper).
