[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Change Linux Console Font Type And Size)
[#]: via: (https://www.ostechnix.com/how-to-change-linux-console-font-type-and-size/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Change Linux Console Font Type And Size
======

It is quite easy to change the text font type and its size if you have graphical desktop environment. How would you do that in an Ubuntu headless server that doesn’t have a graphical environment? No worries! This brief guide describes how to change Linux console font and size. This can be useful for those who don’t like the default font type/size or who prefer different fonts in general.

### Change Linux Console Font Type And Size

Just in case you don’t know yet, this is how a headless Ubuntu Linux server console looks like.

![][2]

Ubuntu Linux console

As far as I know, we can [**list the installed fonts**][3], but there is no option to change the font type or its size from Linux console as we do in the Terminal emulators in GUI desktop.

But that doesn’t mean that we can’t change it. We still can change the console fonts.

If you’re using Debian, Ubuntu and other DEB-based systems, you can use **“console-setup”** configuration file for **setupcon** which is used to configure font and keyboard layout for the console. The standard location of the console-setup configuration file is **/etc/default/console- setup**.

Now, run the following command to setup font for your Linux console.

```
$ sudo dpkg-reconfigure console-setup
```

Choose the encoding to use on your Linux console. Just leave the default values, choose OK and hit ENTER to continue.

![][4]

Choose encoding to set on the console in Ubuntu

Next choose the character set that should be supported by the console font from the list. By default, it was the the last option i.e. **Guess optimal character set** in my system. Just leave it as default and hit ENTER key.

![][5]

Choose character set in Ubuntu

Next choose the font for your console and hit ENTER key. Here, I am choosing “TerminusBold”.

![][6]

Choose font for your Linux console

In this step, we choose the desired font size for our Linux console.

![][7]

Choose font size for your Linux console

After a few seconds, the selected font with size will applied for your Linux console.

This is how console fonts looked like in my Ubuntu 18.04 LTS server before changing the font type and size.

![][8]

This is after changing the font type and size.

![][9]

As you can see, the text size is much bigger, better and the font type is different that default one.

You can also directly edit **/etc/default/console-setup** file and set the font type and size as you wish. As per the following example, my Linux console font type is “Terminus Bold” and font size is 32.

```
ACTIVE_CONSOLES="/dev/tty[1-6]"
CHARMAP="UTF-8"
CODESET="guess"
FONTFACE="TerminusBold"
FONTSIZE="16x32"
```

* * *

**Suggested read:**

  * [**How To Switch Between TTYs Without Using Function Keys In Linux**][10]



* * *

##### Display Console fonts

To show your console font, simply type:

```
$ showconsolefont
```

This command will show a table of glyphs or letters of a font.

![][11]

Show console fonts

If your Linux distribution does not have “console-setup”, you can get it from [**here**][12].

On Linux distributions that uses **Systemd** , you can change the console font by editing **“/etc/vconsole.conf”** file.

Here is an example configuration for German keyboard.

```
$ vi /etc/vconsole.conf

KEYMAP=de-latin1
FONT=Lat2-Terminus16
```

Hope you find this useful.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-change-linux-console-font-type-and-size/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/08/Ubuntu-Linux-console.png
[3]: https://www.ostechnix.com/find-installed-fonts-commandline-linux/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-encoding-to-set-on-the-console.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-character-set-in-Ubuntu.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-font-for-Linux-console.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-font-size-for-Linux-console.png
[8]: https://www.ostechnix.com/wp-content/uploads/2019/08/Linux-console-tty-ubuntu-1.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/08/Ubuntu-Linux-TTY-console.png
[10]: https://www.ostechnix.com/how-to-switch-between-ttys-without-using-function-keys-in-linux/
[11]: https://www.ostechnix.com/wp-content/uploads/2019/08/show-console-fonts.png
[12]: https://software.opensuse.org/package/console-setup
