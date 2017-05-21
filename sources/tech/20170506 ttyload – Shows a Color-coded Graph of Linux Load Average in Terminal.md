ttyload – Shows a Color-coded Graph of Linux Load Average in Terminal
============================================================

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][12] | [4 Free Shell Scripting eBooks][13]

ttyload is a lightweight utility which is intended to offer a color-coded graph of load averages over time on Linux and other Unix-like systems. It enables a graphical tracking of system load average in a terminal (“tty“).

It is known to run on systems such as Linux, IRIX, Solaris, FreeBSD, MacOS X (Darwin) and Isilon OneFS. It is designed to be easy to port to other platforms, but this comes with some hard work.

Some of its notable features are: it uses fairly standard, but hard-coded, ANSI escape sequences for screen manipulation and colorization. And also comes with (but doesn’t install, or even build by default) a relatively self-contained load bomb, if you want to view how things work on an otherwise unloaded system.

**Suggested Read:** [GoTTY – Share Your Linux Terminal (TTY) as a Web Application][1]

In this article, we will show you how to install and use ttyload in Linux to view a color-coded graph of your system load average in a terminal.

### How to Install ttyload in Linux Systems

On Debian/Ubuntu based distributions, you can install ttyload from the default system respositores by typing the following [apt-get command][2].

```
$ sudo apt-get install ttyload
```

On Other Linux distributions you can install ttyload from the source as shown.

```
$ git clone https://github.com/lindes/ttyload.git
$ cd ttyload
$ make
$ ./ttyload
$ sudo make install
```

Once installed, you can start it by typing the following command.

```
$ ttyload
```
 [![ttyload - Graphical View of Linux Load Average](https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-Graphical-View-of-Linux-Load-Average-.png)][3] 

ttyload – Graphical View of Linux Load Average

Note: To close the program simply press `[Ctrl+C]` keys.

You can also define the number of seconds in the interval between refreshes. Default value is 4, and the minimum is 1.

```
$ ttyload -i 5
$ ttyload -i 1
```

To run it in a monochrome mode which turns off ANSI escapes, use the `-m` as follows.

```
$ ttyload -m
```
 [![ttyload - Monochrome Mode](https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-monochrome-mode.png)][4] 

ttyload – Monochrome Mode

To get the ttyload usage info and help, type.

```
$ ttyload -h 
```

Below are some of its important features yet to be added:

*   Support for arbitrary sizing.

*   Make an X front end using the same basic engine, to have “3xload”.

*   Logging-oriented mode.

For more information, check out the ttyload Homepage: [http://www.daveltd.com/src/util/ttyload/][5]

Thats all for now! In this article, we showed you how to install and use ttyload in Linux. Write back to us via the comment section below.


--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.



-------------------

via: https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/gotty-share-linux-terminal-in-web-browser/
[2]:https://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[3]:https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-Graphical-View-of-Linux-Load-Average-.png
[4]:https://www.tecmint.com/wp-content/uploads/2017/05/ttyload-monochrome-mode.png
[5]:http://www.daveltd.com/src/util/ttyload/
[6]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[7]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[8]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[9]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#
[10]:https://www.tecmint.com/ttyload-shows-color-coded-graph-of-linux-load-average/#comments
[11]:https://www.tecmint.com/author/aaronkili/
[12]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[13]:https://www.tecmint.com/free-linux-shell-scripting-books/
