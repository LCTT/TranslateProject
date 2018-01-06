translating by lujun9972
How to Change Your Linux Console Fonts
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/font-size_0.png?itok=d97vmyYa)

I try to be a peaceful soul, but some things make that difficult, like tiny console fonts. Mark my words, friends, someday your eyes will be decrepit and you won't be able to read those tiny fonts you coded into everything, and then you'll be sorry, and I will laugh.

Fortunately, Linux fans, you can change your console fonts. As always, the ever-changing Linux landscape makes this less than straightforward, and font management on Linux is non-existent, so we'll muddle along as best we can. In this article, I'll show what I've found to be the easiest approach.

### What is the Linux Console?

Let us first clarify what we're talking about. When I say Linux console, I mean TTY1-6, the virtual terminals that you access from your graphical desktop with Ctrl+Alt+F1 through F6. To get back to your graphical environment, press Alt+F7. (This is no longer universal, however, and your Linux distribution may have it mapped differently. You may have more or fewer TTYs, and your graphical session may not be at F7. For example, Fedora puts the default graphical session at F2, and an extra one at F1.) I think it is amazingly cool that we can have both X and console sessions running at the same time.

The Linux console is part of the kernel, and does not run in an X session. This is the same console you use on headless servers that have no graphical environments. I call the terminals in a graphical session X terminals, and terminal emulators is my catch-all name for both console and X terminals.

But that's not all. The Linux console has come a long way from the early ANSI days, and thanks to the Linux framebuffer, it has Unicode and limited graphics support. There are also a number of console multimedia applications that we will talk about in a future article.

### Console Screenshots

The easy way to get console screenshots is from inside a virtual machine. Then you can use your favorite graphical screen capture program from the host system. You may also make screen captures from your console with [fbcat][1] or [fbgrab][2]. `fbcat` creates a portable pixmap format (PPM) image; this is a highly portable uncompressed image format that should be readable on any operating system, and of course you can convert it to whatever format you want. `fbgrab` is a wrapper script to `fbcat` that creates a PNG file. There are multiple versions of `fbgrab` written by different people floating around. Both have limited options and make only a full-screen capture.

`fbcat` needs root permissions, and must redirect to a file. Do not specify a file extension, but only the filename:
```
$ sudo fbcat > Pictures/myfile

```

After cropping in GIMP, I get Figure 1.

It would be nice to have a little padding on the left margin, so if any of you excellent readers know how to do this, please tell us in the comments.

`fbgrab` has a few more options that you can read about in `man fbgrab`, such as capturing a different console, and time delay. This example makes a screen grab just like `fbcat`, except you don't have to explicitly redirect:
```
$ sudo fbgrab Pictures/myOtherfile

```

### Finding Fonts

As far as I know, there is no way to list your installed kernel fonts other than looking in the directories they are stored in: `/usr/share/consolefonts/` (Debian/etc.), `/lib/kbd/consolefonts/` (Fedora), `/usr/share/kbd/consolefonts` (openSUSE)...you get the idea.

### Changing Fonts

Readable fonts are not a new concept. Embrace the old! Readability matters. And so does configurability, which sometimes gets lost in the rush to the new-shiny.

On Debian/Ubuntu/etc. systems you can run `sudo dpkg-reconfigure console-setup` to set your console font, then run the `setupcon` command in your console to activate the changes. `setupcon` is part of the `console-setup` package. If your Linux distribution doesn't include it, there might be a package for you at [openSUSE][3].

You can also edit `/etc/default/console-setup` directly. This example sets the Terminus Bold font at 32 points, which is my favorite, and restricts the width to 80 columns.
```
ACTIVE_CONSOLES="/dev/tty[1-6]"
CHARMAP="UTF-8"
CODESET="guess"
FONTFACE="TerminusBold"
FONTSIZE="16x32"
SCREEN_WIDTH="80"

```

The FONTFACE and FONTSIZE values come from the font's filename, `TerminusBold32x16.psf.gz`. Yes, you have to know to reverse the order for FONTSIZE. Computers are so much fun. Run `setupcon` to apply the new configuration. You can see the whole character set for your active font with `showconsolefont`. Refer to `man console-setup` for complete options.

### Systemd

Systemd is different from `console-setup`, and you don't need to install anything, except maybe some extra font packages. All you do is edit `/etc/vconsole.conf` and then reboot. On my Fedora and openSUSE systems I had to install some extra Terminus packages to get the larger sizes as the installed fonts only went up to 16 points, and I wanted 32. This is the contents of `/etc/vconsole.conf` on both systems:
```
KEYMAP="us"
FONT="ter-v32b"

```

Come back next week to learn some more cool console hacks, and some multimedia console applications.

Learn more about Linux through the free ["Introduction to Linux" ][4]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/1/how-change-your-linux-console-fonts

作者：[Carla Schroder][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:http://jwilk.net/software/fbcat
[2]:https://github.com/jwilk/fbcat/blob/master/fbgrab
[3]:https://software.opensuse.org/package/console-setup
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
