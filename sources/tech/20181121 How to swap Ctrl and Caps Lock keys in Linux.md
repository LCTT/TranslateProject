How to swap Ctrl and Caps Lock keys in Linux
======
Linux desktop environments make it easy to set up your keyboard as you want it. Here's how.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboard_numbers_letters_type_game.jpg?itok=fLlWGw1K)

For many people who've been computer users for (let's just say) "quite some time now," the Ctrl and Caps Lock keys have been in the wrong place since shortly after the first PC keyboards rolled off the production line. For me, the correct positioning appears in this image of a vintage 1995 Sun Workstation keyboard. (Forgive me for the blurriness of the image; it was taken with a Minox spy camera in low light.)

If you're interested, you can read about the [history of the Ctrl key location][1]. I'm not going to discuss the various rationales for placing the Ctrl key next to the "a" key versus below the Shift key; I'm not going to comment on the overall uselessness of the Caps Lock key (whoops); and I'm not going to argue with those who advocate using the heel of the hand to activate the Ctrl key, even though it's impossible to do on some laptop keyboards where the keys are inset below the level of the wrist rest (whoops).

Rather, I'm going to assume I'm not the only one who prefers the Ctrl key next to the "a" and describe how to use the wonderful flexibility that comes with Linux to swap the Ctrl and Caps Lock keys on various desktop environments. Note that this kind of advice seems to have a limited shelf life, as tools for tweaking desktop settings change fairly often. But I hope this offers a good place for you to start.

### With GNOME 3

[GNOME 3][2] desktop environment users can use the [Tweaks][3] tool to swap their Caps Lock and Ctrl keys, as you can see below.
![](https://opensource.com/sites/default/files/uploads/tweaks-tool.png)
Here's how to do it:

  1. Install the Tweaks tool from your distribution's repositories.
  2. Start the Tweaks application.
  3. Select "Keyboard & Mouse" from the left-hand menu.
  4. Click "Additional Layout Options".
  5. Click "Ctrl position" on the window that opens and choose "Swap Ctrl and Caps Lock."



That's it! By the way, you can do lots of cool stuff with the Tweaks tool. For example, I set my right Ctrl key to be a Compose key, which allows me to type all sorts of characters with keyboard shortcuts—such as ç, é, ô, and ñ and with the keystrokes Compose+c+Comma; Compose+e+Right quote; Compose+o+Circumflex; and Compose+n+Tilde.

### With KDE

I don't use [KDE][4], but item 5 in this article about [KDE tweaks that will change your life][5] by my colleague Seth Kenlon will show you how to remap your keys.

### With Xfce

As far as I can tell, the [Xfce][6] desktop environment doesn't have a handy tool for managing these kinds of settings. However, the **ctrl:swapcaps** option to the **setxkbmap** command will help you make these changes. This type of modification has two parts:

  1. Figuring out the command's usage;
  2. Figuring out where to invoke the command so it is activated as the desktop comes up.



The first part is pretty straightforward: the command is:

```
/usr/bin/setxkbmap -option "ctrl:nocaps"
```

It's worth executing this in a terminal window to make sure the results are what you expect.

Assuming it works, where should you invoke the command? That requires some experimentation; one possibility is in the file **.profile** in the user's home directory. Another option is to add the command to the autostart facility in Xfce (look for  "Session and Startup" in the Settings Manager).

Another possibility is to use the same option in the file / **etc/default/keyboard** , which might end up looking like this:

```
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="us"
XKBVARIANT=""
XKBOPTIONS="ctrl:swapcaps"

BACKSPACE="guess"
```

Note that this kind of change will affect all users, so if you share your computer, be prepared to do some explaining. Also, system updates may overwrite this file, so you'll need to edit it again if your setup stops working. Putting the same information in the file **.keyboard** in the user's home directory might accomplish the same task on the user's behalf.

Finally, note that these kinds of changes require you to restart Xfce (except when running the command on the command line in the terminal window, but that won't stick past the end of the session).

### With LXQt and other desktop environments

I haven't tried [LXQt][7], but if my memory serves from [LXDE][8], I would try the same recipe used above for Xfce. I'd also expect that the Xfce recipe could work for other Linux desktop environments, but, of course, your favorite search engine is always your friend.

### The console

I haven't tried this, as I have very few opportunities to interact with the console (what you see on a server or when your window system doesn't come up properly). The recipes presented above affect the terminal window in the way one would hope, i.e., consistently with other applications.

However, if the file **/etc/default/keyboard** or **~/.keyboard** has already been edited (as described above), the utility **setupcon** is intended to change the console keyboard setup so it functions the same way.** **This [StackExchange article][9], [this other one][10], and [this third one][11] give some ideas on how to effect these changes from both of these files. The third article also talks about using **dumpkeys** and **loadkeys**. It's also worthwhile to read [the setupcon man page][12] — it's short and to the point, and combined with the comments from the StackExchange articles, should be enough to get a solution in place.

Finally, it's worth emphasizing here the point mentioned in the StackExchange articles - configuring the console IS NOT THE SAME as configuring terminal windows; the latter are configured through the desktop manager as described previously.

### When all else fails

The manual pages for **setxkbmap** , **xkeyboard-config** , **keyboard** , **console-setup** , and **setupcon** are all useful references. Or, if you don't like reading manual pages, there's [this great article][13].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/how-swap-ctrl-and-caps-lock-your-keyboard

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Control_key
[2]: https://www.gnome.org/gnome-3/
[3]: https://wiki.gnome.org/Apps/Tweaks
[4]: https://www.kde.org/
[5]: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life
[6]: https://www.xfce.org/
[7]: https://lxqt.org/
[8]: https://lxde.org/
[9]: https://askubuntu.com/questions/485454/how-to-remap-keys-on-a-user-level-both-with-and-without-x
[10]: https://unix.stackexchange.com/questions/198791/how-do-i-permanently-change-the-console-tty-font-type-so-it-holds-after-reboot
[11]: https://superuser.com/questions/290115/how-to-change-console-keymap-in-linux
[12]: http://man.he.net/man1/setupcon
[13]: http://www.noah.org/wiki/CapsLock_Remap_Howto
