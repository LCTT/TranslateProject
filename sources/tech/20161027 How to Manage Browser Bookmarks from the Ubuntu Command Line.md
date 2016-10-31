translating---geekpi

How to Manage Browser Bookmarks from the Ubuntu Command Line
=======

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-feature-image.jpg "How to Manage Browser Bookmarks from the Ubuntu Command Lines")


Browser bookmarks, though not discussed as often as they should be, are an integral part of browsing the Internet. Without good bookmark functionality, a website might be lost in time, and the ability to revisit it gone. That’s why it’s really important to have a good bookmark manager.


All modern web browsers offer up some form of management tool, though they seriously lack in features. If you’ve grown tired of these mainstream tools that have been packed into your browser, you might want to seek out an alternative. Introducing **Buku**: the command line-based bookmark manager. It has the ability to not only manage your bookmarks, but it can encrypt them, hold them in a database, and more. Here’s how to get going with it!

### Installation

![buku-installing-buku-in-ubuntu](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-installing-buku-in-ubuntu.jpg "buku-installing-buku-in-ubuntu")

Buku isn’t very popular. As a result, users will need to build it to use it. Still, installing it and getting it going on Ubuntu is a lot easier than it looks. Start by opening the terminal and using apt to install `git` and `python3`, as they are vital in building the software.

```
sudo apt python3-cryptography python3-bs4
```

After the needed tools are installed, the source code can be pulled down.

```
git clone https://github.com/jarun/Buku/.
cd Buku
```

Finally, to install it, just run the make command. From here it is possible to launch Buku with buku in any terminal window

```
sudo make install
```

**Note**: though this guide focuses on Ubuntu, Buku can be built with similar directions on any Linux distribution.

### Importing Bookmarks

![buku-import-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-import-bookmarks.jpg "buku-import-bookmarks")

To import bookmarks directly into the manager, first export all bookmarks from your web browser to an html file. Then, enter the following command:

```
buku -i bookmarks.html
```

As a result, imported bookmarks will be added to the Buku bookmark database.

### Exporting Bookmarks

![buku-export-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-export-bookmarks.jpg "buku-export-bookmarks")

Exporting bookmarks is as simple as importing them into the database. To export all bookmarks, use this command:

```
buku -e bookmarks.html
```

The bookmark manager, like all others, will export all bookmarks loaded into the database to an HTML file on the system. After that, take your bookmarks and do with them what you will!

### Opening Bookmarks

![buku-open-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-open-bookmarks.jpg "buku-open-bookmarks")

To open a bookmark, first the user must search for it. This is done with the `-s` flag. Run this to search:

```
buku -s searchterm
```

Then, once a bookmark matching the search has been found, enter the number next to it, and the bookmark will open in the default web browser.

### Encryption

Unlike other bookmark managers, Buku can actually encrypt your data. This is especially handy for users who have “sensitive” bookmarks. To encrypt the database, use the `-l` flag to create a password.

```
buku -l
```

![buku-encrypt-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-encrypt-bookmarks.jpg "buku-encrypt-bookmarks")

With the database locked, it will not be possible to access bookmarks without entering the password to decrypt it. To decrypt, use the -k flag.

```
buku -k
```

![buku-decrypt-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-decrypt-bookmarks.jpg "buku-decrypt-bookmarks")

### Other features

This bookmark manger is stuffed with many different features. To read about how to use any of the other features, use the `--help` switch. When this switch is used, every command switch and flag will be listed, and each feature outlined in detail. This comes in handy, as often users forget things, and it’s nice to be able to pull out a cheat-sheet sometimes.

```
buku --help
```

![buku-list-options](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-list-options.jpg "buku-list-options")

### Conclusion

Even though this tool isn’t part of any browser, its features are far above any of the current manager offerings out there. Despite the fact that it runs in the command line, it offers up some serious competition. Bookmarks might not be that important to most people, but those who dislike the current choices and love the Linux command line should give Buku a serious shot.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/manage-browser-bookmarks-ubuntu-command-line/?utm_medium=feed&utm_source=feedpress.me&utm_campaign=Feed%3A+maketecheasier

作者：[Derrik Diener][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/manage-browser-bookmarks-ubuntu-command-line/#comments
[2]:https://www.maketecheasier.com/author/derrikdiener/
[3]:https://support.google.com/adsense/troubleshooter/1631343
[4]:https://www.maketecheasier.com/hidden-google-games/
[5]:https://www.maketecheasier.com/change-app-permissions-windows10/
[6]:mailto:?subject=How%20to%20Manage%20Browser%20Bookmarks%20from%20the%20Ubuntu%20Command%20Line&body=https%3A%2F%2Fwww.maketecheasier.com%2Fmanage-browser-bookmarks-ubuntu-command-line%2F
[7]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fmanage-browser-bookmarks-ubuntu-command-line%2F&text=How+to+Manage+Browser+Bookmarks+from+the+Ubuntu+Command+Line
[8]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fmanage-browser-bookmarks-ubuntu-command-line%2F
[9]:https://www.maketecheasier.com/category/linux-tips/
