[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Try a text editor inspired by Notepad++)
[#]: via: (https://opensource.com/article/20/12/notepad-text-editor)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Try a text editor inspired by Notepad++
======
Classic notepads are reliable and familiar, and the new, improved
versions offer endless plugins to customize your experience.
![Writing Hand][1]

If you look online for great open source text editors, you’re bound to come across [Notepad++][2]. An enduring and popular editor, Notepad++ is built only for Windows. I use the open source operating system [Linux][3] but was nevertheless curious to experience Notepad++. Fortunately for me, I discovered one way to try Notepad++ (yes, it’s WINE) and one way to approximate it.

### Running Notepad++ in WINE

It seemed like a crazy idea at one time, but long ago, a group of developers wondered whether they could reverse engineer the system-level libraries that made Windows work and then release them as open source software. That’s what WINE is—a rewrite of the core components of Windows, allowing many Windows applications to run on Linux.

It’s a staggering achievement and one that has, among other things, helped the ReactOS project launch a Windows-like open source operating system, Valve Software to create Steam Play for running Windows games on Linux, and people who are over-curious about text editors to try Notepad++.

There are two steps involved in this process:

  1. Install WINE on Linux from your software repository.
  2. Download the [Notepad++ EXE installer][4]. With WINE, you can launch it like a native application, and install Notepad++ to your system.



### Winetricks

Alternatively, you can use Winetricks to install applications, Notepad++ included. Winetricks is a shell script with tried-and-tested build scripts for dozens upon dozens of applications, games, fonts, and more. You can probably install Winetricks from your distribution's software repository. If it's not available, then you can download it yourself:


```
$ mkdir ~/bin
$ cd ~/bin
$ wget  <https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks>
$ chmod +x winetricks
$ ./winetricks
```

Winetricks is a simple menu-driven application. Find **npp** ("Notepad plus plus") in the **Install applications** menu selection.

![Winetricks][5]

There are a few things to get used to when using applications on Linux that believe they’re running on Windows, but nothing serious. You have to get used to the idea of hard drive locations designated by letters, and you might want to download and install some Windows themes to help your WINE environment feel better integrated with the rest of your system. Once you’ve used Notepad++ running on WINE, you quickly forget WINE is involved at all.

![Notepad++ running in WINE on Linux][6]

### Running Notepadqq

There’s no affiliation between Notepadqq and Notepad++, except that the former takes inspiration from the latter. They’re not identical applications, but if you’re a casual fan of the original, then you might find Notepadqq a suitable native replacement.

Notepadqq is easy to [install as a Flatpak][7] on Linux or a Chromebook. Alternately, you can [download and compile it from its source code][8]. Some support is provided for [compiling on MacOS][9], too.

![screenshot of black notepad terminal with white lettering][10]

### Notepad (improved)

Regardless of how you satiate your Notepad improved hunger, you’ll be pleased to find you have a responsive, customizable, and extensible editor. Both applications provide syntax highlighting for around 80 programming languages and text formats, including C, C++, Java, Python, Javascript, Lua, [Markdown][11], RPM spec files, and [YAML][12].

They also both use the concept of a session, or sets of files opened in your Notepad editor, which you can save and reload as needed. Using sessions helps you organize your work into projects.

Both Notepad applications can be extended through plugins. Notepad++ features a Plugins Admin panel, where you can browse through available plugins. Notepadqq doesn’t have the years of development that Notepad++ has had, and accordingly, doesn’t seem to have the abundance of available extensions. However, you can [develop your own using Node.js][13].

### Try a Notepad (improved)

Whether you stick with the classic Notepad++ or venture into the newer Notepadqq, you’re bound to find satisfaction with these reliable editors. They give you the features you expect for efficient text editing and the access you need so you can hack together your own extensions. These are both fun, reliable, and dependable projects, so give one (or both) a try today!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/notepad-text-editor

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/write-hand_0.jpg?itok=Uw5RJD03 (Writing Hand)
[2]: https://notepad-plus-plus.org
[3]: http://opensource.com/resources/what-linux
[4]: https://notepad-plus-plus.org/downloads/
[5]: https://opensource.com/sites/default/files/winetricks.png (Winetricks)
[6]: https://opensource.com/sites/default/files/npp.png (Notepad++ running in WINE on Linux)
[7]: https://flathub.org/apps/details/com.notepadqq.Notepadqq
[8]: https://github.com/notepadqq/notepadqq
[9]: https://github.com/notepadqq/notepadqq/wiki/Compiling-Notepadqq-on-macOS
[10]: https://opensource.com/sites/default/files/uploads/notepad-31_days-notepad-opensource.png (screenshot of black notepad terminal with white lettering)
[11]: https://opensource.com/article/19/9/introduction-markdown
[12]: https://www.redhat.com/sysadmin/yaml-beginners
[13]: https://github.com/notepadqq/notepadqq/wiki/How-to-write-an-extension-with-Node.js
