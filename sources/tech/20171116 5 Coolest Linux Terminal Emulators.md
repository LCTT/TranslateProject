5 Coolest Linux Terminal Emulators
============================================================


![Cool retro term](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner2.png?itok=zUuRFq_L "Cool retro term")
Carla Schroder looks at some of her favorite terminal emulators, including Cool Retro Term shown here.[Used with permission][4]

Sure, we can get by with boring old GNOME terminal, Konsole, and funny, rickety, old xterm. When you're in the mood to try something new, however, take a look at these five cool and useful Linux terminals.

### Xiki

Number one on my hit parade is [Xiki][10]. Xiki is the brainchild of Craig Muth, talented programmer and funny man (funny as in humorous, and possibly other senses of the word as well). I wrote about Xiki so long ago, in [Meet Xiki, the Revolutionary Command Shell for Linux and Mac OS X][11]. Xiki is much more than yet another terminal emulator; it's an interactive environment for expanding the reach and speed of your command-line interface.


Xiki has mouse support and runs in most command shells. It has tons of on-screen help and is fast to navigate with the keyboard or mouse. One simple example of its speed is how it turbocharges the `ls` command. Xiki zooms through multiple levels in your filesystem without having to continually re-type `ls` or `cd`, or resort to clever regular expressions.

Xiki integrates with many text editors, provides a persistent scratchpad, has a fast search engine, and, as they say, much much more. Xiki is so featureful and so different that the fastest way to wrap your head around it is to watch [Craig's funny and informative videos][12].

### Cool Retro Term

I dig [Cool Retro Term][13] (shown in main image above) for its looks, and also its usefulness. It takes us back to the era of cathode ray tube monitors, which wasn't all that long ago, and which I have zero nostalgia for. Pry my LCD screens from my cold dead etc. It is based on [Konsole][14], so it has Konsole's excellent functionality. Change Cool Retro Term's appearance from the Profiles menu. Profiles include Amber, Green, Pixelated, Apple ][, and Transparent Green, and all include a realistic scanline. Not all of them are usable, for example the Vintage profile warps and flickers realistically like a dying screen.

Cool Retro Term's GitHub repository has detailed installation instructions, and Ubuntu users havethe [PPA][15].

### Sakura

When you want a nice lightweight and configurable terminal, try [Sakura][16] (Figure 1). It has few dependencies, unlike GNOME Terminal and Konsole, which drag in big chunks of GNOME and KDE. Most options are configurable from the right-click menu, such as tab labels, colors, size, default number of tabs, fonts, bell, and cursor type. You can set more options, for example keybindings, in your personal configuration file, `~/.config/sakura/sakura.conf`.

![sakura](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_9.png?itok=9fiPn8xt "sakura")
Figure 1: Sakura is a nice, lightweight, configurable terminal.[Used with permission][1]

Command-line options are detailed in `man sakura`. Use these to lauch Sakura from the command line, or use them in your graphical launcher. For example, this opens to four tabs and sets the window title to MyWindowTitle:

```
$ sakura -t MyWindowTitle -n 4
```

### Terminology

[Terminology][17] comes from the lushly lovely world of the Enlightenment graphical environment and can be prettified all you want (Figure 2). It has a lot of useful features: independent split windows, open files and URLs, file icons, tabs, and gobs more. It even runs in the Linux console, without a graphical environment.


![Terminology](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-2_6.png?itok=FDQ7nFUV "Terminology")
Figure 2: Terminology can also run in the Linux console, without a graphical environment.[Used with permission][2]

When you have multiple split windows each one can have a different background, and backgrounds are any media file: image files, video, or music. It comes with a bundle of dark themes and transparency, because who needs readability, and even a Nyan cat theme. There are no scroll bars, so navigate up and down with Shift+PageUp and Shift+PageDown.

There are multiple controls: a right-click menu, context dialogs, and command-line options. The right-click menu has the tiniest fonts in the universe, and Miniview displays a microscopic file tree. If there are options to make these readable I did not find them. When you have multiple tabs open click the little tab browser to open a chooser that scrolls up and down. Everything is configurable; consult `man terminology` for a list of commands and options, including a nice batch of fast keyboard shortcuts. Strangely, this does not include the following commands, which I found by accident:

*   tyalpha

*   tybg

*   tycat

*   tyls

*   typop

*   tyq

Use the `tybg [filename]` command to set a background, and `tybg` with no options to remove the background. Run `typop [filename]` to open files. `tyls` lists files in icon view. Run any of these commands with the `-h` option to learn what they do. Even with the readability quirks, Terminology is fast, pretty, and useful

### Tilda

There are several excellent drop-down terminal emulators, including Guake and Yakuake. [Tilda][18] (Figure 3) is one of the simplest and most lightweight. After opening Tilda it stays open, and you display or hide it with a shortcut key. The tilda key is the default, and you can map any key you like. It's always open and ready to work, but out of your way until you need it.


![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-3_3.png?itok=zTBWotp8)
Figure 3: Tilda is one of the simplest and most lightweight terminal emulators.[Used with permission][3]

Tilda has a nice complement of options, including default size and placement, appearance, keybindings, search bar, mouse hover, and tab bar. These are controlled with a right-click menu.

 _Learn more about Linux through the free ["Introduction to Linux" ][9]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/5-coolest-linux-terminal-emulators

作者：[CARLA SCHRODER ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/files/images/fig-1png-9
[6]:https://www.linux.com/files/images/fig-2png-6
[7]:https://www.linux.com/files/images/fig-3png-3
[8]:https://www.linux.com/files/images/banner2png
[9]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[10]:http://xiki.org/
[11]:https://www.linux.com/learn/meet-xiki-revolutionary-command-shell-linux-and-mac-os-x
[12]:http://xiki.org/screencasts/
[13]:https://github.com/Swordfish90/cool-retro-term
[14]:https://www.linux.com/learn/expert-tips-and-tricks-kate-and-konsole
[15]:https://launchpad.net/~bugs-launchpad-net-falkensweb/+archive/ubuntu/cool-retro-term
[16]:https://bugs.launchpad.net/sakura
[17]:https://www.enlightenment.org/about-terminology
[18]:https://github.com/lanoxx/tilda
