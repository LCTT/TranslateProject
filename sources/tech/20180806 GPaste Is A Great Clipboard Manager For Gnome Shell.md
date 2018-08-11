GPaste Is A Great Clipboard Manager For Gnome Shell
======
**[GPaste][1] is a clipboard management system that consists of a library, daemon, and interfaces for the command line and Gnome (using a native Gnome Shell extension).**

A clipboard manager allows keeping track of what you're copying and pasting, providing access to previously copied items. GPaste, with its native Gnome Shell extension, makes the perfect addition for those looking for a Gnome clipboard manager.

[![GPaste Gnome Shell extension Ubuntu 18.04][2]][3]
GPaste Gnome Shell extension
**Using GPaste in Gnome, you get a configurable, searchable clipboard history, available with a click on the top panel. GPaste remembers not only the text you copy, but also file paths and images** (the latter needs to be enabled from its settings as it's disabled by default).

What's more, GPaste can detect growing lines, meaning it can detect when a new text copy is an extension of another and replaces it if it's true, useful for keeping your clipboard clean.

From the extension menu you can pause GPaste from tracking the clipboard, and remove items from the clipboard history or the whole history. You'll also find a button that launches the GPaste user interface window.

**If you prefer to use the keyboard, you can use a key shortcut to open the GPaste history from the top bar** (`Ctrl + Alt + H`), **or open the full GPaste GUI** (`Ctrl + Alt + G`).

The tool also incorporates keyboard shortcuts to (can be changed):

  * delete the active item from history: `Ctrl + Alt + V`

  * **mark the active item as being a password (which obfuscates the clipboard entry in GPaste):** `Ctrl + Alt + S`

  * sync the clipboard to the primary selection: `Ctrl + Alt + O`

  * sync the primary selection to the clipboard: `Ctrl + Alt + P`

  * upload the active item to a pastebin service: `Ctrl + Alt + U`

[![][4]][5]
GPaste GUI

The GPaste interface window provides access to the clipboard history (with options to clear, edit or upload items), which can be searched, an option to pause GPaste from tracking the clipboard, restart the GPaste daemon, backup current clipboard history, as well as to its settings.

[![][6]][7]
GPaste GUI

From the GPaste UI you can change settings like:

  * Enable or disable the Gnome Shell extension
  * Sync the daemon state with the extension's one
  * Primary selection affects history
  * Synchronize clipboard with primary selection
  * Image support
  * Trim items
  * Detect growing lines
  * Save history
  * History settings like max history size, memory usage, max text item length, and more
  * Keyboard shortcuts



### Download GPaste

[Download GPaste](https://github.com/Keruspe/GPaste)

The Gpaste project page does not link to any GPaste binaries, and only source installation instructions. Users running Linux distributions other than Debian or Ubuntu (for which you'll find GPaste installation instructions below) can search their distro repositories for GPaste.

Do not confuse GPaste with the GPaste Integration extension posted on the Gnome Shell extension website. That is a Gnome Shell extension that uses GPaste daemon, which is no longer maintained. The native Gnome Shell extension built into GPaste is still maintained.

#### Install GPaste in Ubuntu (18.04, 16.04) or Debian (Jessie and newer)

**For Debian, GPaste is available for Jessie and newer, while for Ubuntu, GPaste is in the repositories for 16.04 and newer (so it's available in the Ubuntu 18.04 Bionic Beaver).**

**You can install GPaste (the daemon and the Gnome Shell extension) in Debian or Ubuntu using this command:**
```
sudo apt install gnome-shell-extensions-gpaste gpaste

```

After the installation completes, restart Gnome Shell by pressing `Alt + F2` and typing `r` , then pressing the `Enter` key. The GPaste Gnome Shell extension should now be enabled and its icon should show up on the top Gnome Shell panel. If it's not, use Gnome Tweaks (Gnome Tweak Tool) to enable the extension.

**The GPaste 3.28.0 package from[Debian][8] and [Ubuntu][9] has a bug that makes it crash if the image support option is enabled, so do not enable this feature for now.** This was marked as


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/gpaste-is-great-clipboard-manager-for.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/Keruspe/GPaste
[2]:https://2.bp.blogspot.com/-2ndArDBcrwY/W2gyhMc1kEI/AAAAAAAABS0/ZAe_onuGCacMblF733QGBX3XqyZd--WuACLcBGAs/s400/gpaste-gnome-shell-extension-ubuntu1804.png (Gpaste Gnome Shell)
[3]:https://2.bp.blogspot.com/-2ndArDBcrwY/W2gyhMc1kEI/AAAAAAAABS0/ZAe_onuGCacMblF733QGBX3XqyZd--WuACLcBGAs/s1600/gpaste-gnome-shell-extension-ubuntu1804.png
[4]:https://2.bp.blogspot.com/-7FBRsZJvYek/W2gyvzmeRxI/AAAAAAAABS4/LhokMFSn8_kZndrNB-BTP4W3e9IUuz9BgCLcBGAs/s640/gpaste-gui_1.png
[5]:https://2.bp.blogspot.com/-7FBRsZJvYek/W2gyvzmeRxI/AAAAAAAABS4/LhokMFSn8_kZndrNB-BTP4W3e9IUuz9BgCLcBGAs/s1600/gpaste-gui_1.png
[6]:https://4.bp.blogspot.com/-047ShYc6RrQ/W2gyz5FCf_I/AAAAAAAABTA/-o6jaWzwNpsSjG0QRwRJ5Xurq_A6dQ0sQCLcBGAs/s640/gpaste-gui_2.png
[7]:https://4.bp.blogspot.com/-047ShYc6RrQ/W2gyz5FCf_I/AAAAAAAABTA/-o6jaWzwNpsSjG0QRwRJ5Xurq_A6dQ0sQCLcBGAs/s1600/gpaste-gui_2.png
[8]:https://packages.debian.org/buster/gpaste
[9]:https://launchpad.net/ubuntu/+source/gpaste
[10]:https://www.imagination-land.org/posts/2018-04-13-gpaste-3.28.2-released.html
