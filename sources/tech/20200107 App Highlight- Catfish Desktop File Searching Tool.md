[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (App Highlight: Catfish Desktop File Searching Tool)
[#]: via: (https://itsfoss.com/catfish/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

App Highlight: Catfish Desktop File Searching Tool
======

_****Brief: Catfish is a nifty file searching GUI tool for Linux desktop. The interface is lightweight and simple and the tool allows to refine your search with** criteria like time, file type etc.**_

The Linux purists use commands like locate, find and grep to search for files in the terminal.

But as a desktop Linux user, you don’t need to leave the comfort of the graphical user interface (GUI) and deep dive into the command line interface (CLI) just for searching files on your desktop.

Most Linux distributions provide a basic desktop search feature either via the file manager or through the desktop environment itself.

On GNOME desktop, you can search for files in the Activities area (use the Windows key to bring it up). Files (previously known as Nautilus) also has a built-in search button.

![Nautilus file manager already has advanced search feature][1]

You can extend this search and add options like time and type of the file. One thing it doesn’t do is to search inside the files. For example, you cannot use it to get all the files that contains “university”.

This is where a desktop file search tool like Catfish could help you.

### Catfish: A nifty GUI tool for searching files on Linux

[Catfish][2] is a GUI tool that enables you to search your desktop for any kind of files. It uses locate and find commands underneath. The autocompletion feature uses [Zeitgeist][3] daemon and [locate command][4]. It’s a lightweight tool and uses GTK+.

Catfish is developed by [Christian Dywan][5], the same person who develops the [lightweight Midori web browser][6].

![Catfish interface on MX Linux][7]

Some of the main features of Catfish are:

  * Search for files anywhere on your system, **including the mounted partitions**
  * **Search inside the files** for its contents (can be enabled from preferences)
  * Search hidden files as well
  * Refine your search based on modification time
  * Refine your search based on file type (images, videos, documents etc)
  * Refine your search based on location (Documents, Downloads, Pictures or other folders)
  * Exclude certain directories and paths from your search
  * Lightweight and simple interface
  * **Support for Wayland** display server (from version 1.4.12)



Catfish is now a Xfce project and it is providing the search feature to Xfce’s Thunar file manager.

### Installing Catfish on Ubuntu and other Linux distributions

Let’s see how to install Catfish on your Linux distributions.

**Ubuntu-based distributions**

Catfish is available in the universe repository for Ubuntu based distributions such as Xubuntu, Linux Mint, Linux Lite etc.

You can install it from the software center by searching for Catfish

![Catfish in Ubuntu Software Center][8]

or, use the terminal to install it:

```
sudo apt install catfish
```

The version provided by Ubuntu may not be the latest. The [official PPA][9] has been abandoned so this means that to get the latest Catfish version, you’ll have to [install it from the source code][10].

**On other distributions**

Catfish is also available in most major Linux distributions. It is certainly available on Fedora and if you check your distribution’s package manager or software center, you should find it there and install it like any other program.

**Conclusion**

In this week’s Linux application highlight, you learned about this handy little utility. However, Catfish is not the only tool of its kind. You may check some other search tools like [ANGRYSearch][11] or [SearchMonkey][12].

Have you ever used a GUI tool for searching files or do you rely on the good old command line? And what do you think of Catfish? Do you look forward to use it?

--------------------------------------------------------------------------------

via: https://itsfoss.com/catfish/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/search-files-gnome.jpg?ssl=1
[2]: https://launchpad.net/catfish-search/
[3]: https://wiki.archlinux.org/index.php/Zeitgeist
[4]: https://linuxhandbook.com/locate-command/
[5]: http://www.twotoasts.de/index.php/about/
[6]: https://itsfoss.com/midori-browser/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/catfish_screenshot.png?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/catfish_ubuntu_software_center.jpg?ssl=1
[9]: https://itsfoss.com/ppa-guide/
[10]: https://itsfoss.com/install-software-from-source-code/
[11]: https://itsfoss.com/angrysearch/
[12]: https://itsfoss.com/searchmonkey-search-text-files-linux/
