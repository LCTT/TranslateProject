[#]: subject: "Install Gedit on Ubuntu 22.10 and Make it Default Text Editor"
[#]: via: "https://itsfoss.com/install-gedit-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Gedit on Ubuntu 22.10 and Make it Default Text Editor
======

[GNOME has a brand new text editor][1] to replace the good old Gedit editor.

While it was already available with GNOME 42, Ubuntu 22.04 relied on Gedit.

This is changing in Ubuntu 22.10. GNOME Text Editor is the default here and Gedit is not even installed.

![Searching for text editor only brings GNOME Text Editor][2]

While the new editor is good enough, not everyone would like it. This is especially if you use Gedit extensively with additional plugins.

If you are among those people, let me show you how to install Gedit on Ubuntu. I’ll also share how you can make it the default text editor.

### Install Gedit on Ubuntu

This is actually a no-brainer. While Gedit is not installed by default, it is still available in Ubuntu repositories.

So, all you have to do is to use the apt command to install it:

```
sudo apt install gedit
```

Gedit is also available in the software center but it is the snap package. You could install that if you want.

![Gedit is also available in Ubuntu’s Snap Store][3]

#### Install Gedit Plugins (optional)

By default, Gedit gives you the option to access a few plugins. You can enable or disable the plugins from the menu->preference->plugins.

![Accessing plugins in Gedit][4]

You should see the available plugins here. The installed or in-use plugins are checked.

![See the available and installed plugins in Gedit][5]

However, you can take the plugin selection to the next level by installing the gedit-plugins meta package.

```
sudo apt install gedit-plugins
```

This will give you access to additional plugins like bookmarks, bracket completion, Python console and more.

![Additional Gedit plugins][6]

**Tip**: If you notice that Gedit looks a bit out of place for the lack of around bottom corners, you can install a GNOME extension called [Round Bottom Corner][7]. This will force round bottom corners for all applications including Gedit.

### Make Gedit the default text editor

Alright! So you have installed Gedit but the text files still open in GNOME Text Editor with double click action. To open a file with Gedit, you need to right click and then select the ‘open with’ option.

If you want Gedit to open text files all the time, you can set it as default.

Right click on a text file and go with “open with” option. Select Gedit here and enable the “Always use for this file type” option from the bottom.

![Set Gedit as the default text editor][8]

### Remove Gedit

Don’t feel Gedit is up to the mark? That’s rare, but I am not judging you. To remove Gedit from Ubuntu, use the following command:

```
sudo apt remove gedit
```

You may also try uninstalling it from the software center.

### Conclusion

GNOME Text Editor is the next-gen, created-from-scratch editor that blends well with the new GNOME.

It’s good enough for simple text editing. However, Gedit has a plugin ecosystem that gives it more feature.

For those who use it extensively for coding and other stuff, installing Gedit is still an option in Ubuntu.

What about you? Will you stick with the default new text editor or would you go back to the good old Gedit?

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-gedit-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/gnome-text-editor/
[2]: https://itsfoss.com/wp-content/uploads/2022/10/text-editor-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/10/install-gedit-from-ubuntu-software-center.png
[4]: https://itsfoss.com/wp-content/uploads/2022/10/access-plugins-in-gedit.png
[5]: https://itsfoss.com/wp-content/uploads/2022/10/plugins-in-gedit.png
[6]: https://itsfoss.com/wp-content/uploads/2022/10/additional-plugins-gedit.png
[7]: https://extensions.gnome.org/extension/5237/rounded-window-corners/
[8]: https://itsfoss.com/wp-content/uploads/2022/10/set-gedit-default.png
