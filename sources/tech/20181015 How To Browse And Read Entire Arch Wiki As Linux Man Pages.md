How To Browse And Read Entire Arch Wiki As Linux Man Pages
======
![](https://www.ostechnix.com/wp-content/uploads/2018/10/arch-wiki-720x340.jpg)

A while ago, I wrote a guide that described how to browse the Arch Wiki from your Terminal using a command line script named [**arch-wiki-cli**][1]. Using this script, anyone can easily navigate through entire Arch Wiki website and read it with a text browser of your choice. Obviously, an active Internet connection is required to use this script. Today, I stumbled upon a similar utility named **“Arch-wiki-man”**. As the name says, it is also used to read the Arch Wiki from command line, but it doesn’t require Internet connection. Arch-wiki-man program helps you to browse and read entire Arch Wiki as Linux man pages. It will display any article from Arch Wiki in man pages format. Also, you need not to be online to browse Arch Wiki. The entire Arch Wiki will be downloaded locally and the updates are pushed automatically every two days. So, you always have an up-to-date, local copy of the Arch Wiki on your system.

### Installing Arch-wiki-man

Arch-wiki-man is available in [**AUR**][2], so you can install it using any AUR helper programs, for example [**Yay**][3].

```
    $ yay -S arch-wiki-man
```

Alternatively, it can be installed using NPM package manager like below. Make sure you have [**installed NodeJS**][4] and run the following command to install it:

```
    $ npm install -g arch-wiki-man
```

### Browse And Read Entire Arch Wiki As Linux Man Pages

The typical syntax of Arch-wiki-man is:

```
    $ awman <search-query>
```

Let me show you some examples.

**Search with one or more matches**

Let us search for a [**Arch Linux installation guide**][5]. To do so, simply run:

```
    $ awman Installation guide
```

The above command will search for the matches that contains the search term “Installation guide” in the Arch Wiki. If there are multiple matches for the given search term, a selection menu will appear. Choose the guide you want to read using **UP/DOWN arrows** or Vim-style keybindings ( **j/k** ) and hit ENTER to open it. The resulting guide will open in man pages format like below.

![][6]

Here, awman refers **a** rch **w** iki **m** an.

All man command options are supported, so you can navigate through guide as the way you do when reading a man page. To view the help section, press **h**.

![][7]

To exit the selection menu without entering **man** , simply press **Ctrl+c**.

To go back and/or quit man, type **q**.

**Search matches in titles and descriptions**

By default, Awman will search for the matches in titles only. You can, however, direct it to search for the matches in both the titles and descriptions as well.

```
    $ awman -d vim
```

Or,

```
    $ awman --desc-search vim
```

**Search for matches in contents**

Apart from searching for matches in titles and descriptions, it is also possible to scan the contents for a match as well. Please note that this will significantly slower the search process.

```
    $ awman -k emacs
```

Or,

```
    $ awman --apropos emacs
```

**Open the search results in web browser**

If you don’t want to view the arch wiki guides in man page format, you can open it in a web browser. To do so, run:

```
    $ awman -w pacman
```

Or,

```
    $ awman --web pacman
```

This command will open the resulting match in the default web browser rather than with **man** command. Please note that you need Internet connection to use this option.

**Search in other languages**

By default, Awman will open the Arch wiki pages in English. If you want to view the results in other languages, for example **Spanish** , simply do:

```
    $ awman -l spanish codecs
```

![][8]

To view the list of available language options, run:

```

    $ awman --list-languages

```

**Update the local copy of Arch Wiki**

Like I already said, the updates are pushed automatically every two days. If you want to update it manually, simply run:

```
$ awman-update
arch-wiki-man@1.3.0 /usr/lib/node_modules/arch-wiki-man
└── arch-wiki-md-repo@0.10.84

arch-wiki-md-repo has been successfully updated or reinstalled.
```

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-browse-and-read-entire-arch-wiki-as-linux-man-pages/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/search-arch-wiki-website-commandline/
[2]: https://aur.archlinux.org/packages/arch-wiki-man/
[3]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://www.ostechnix.com/install-node-js-linux/
[5]: https://www.ostechnix.com/install-arch-linux-latest-version/
[6]: http://www.ostechnix.com/wp-content/uploads/2018/10/awman-1.gif
[7]: http://www.ostechnix.com/wp-content/uploads/2018/10/awman-2.png
[8]: https://www.ostechnix.com/wp-content/uploads/2018/10/awman-3-1.png
