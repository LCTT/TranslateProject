[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use your favorite open source apps on your Mac with MacPorts)
[#]: via: (https://opensource.com/article/20/11/macports)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use your favorite open source apps on your Mac with MacPorts
======
MacPorts is an easy way to get open source applications and keep them
updated on macOS.
![Coffee and laptop][1]

"Package manager" is a generic name for software to install, upgrade, and uninstall applications. Commands like `dnf` or `apt` on Linux, or `pkg_add` on BSD, or even `pip` on Python and `luarocks` on Lua, make it trivial for users to add new applications to their system. Once you've tried it, you're likely to find it hard to live without, and it's a convenience every operating system ought to include. Not all do, but the open source community tends to ensure the best ideas in computing are propagated across all platforms.

There are several package managers designed just for macOS, and one of the oldest is the [MacPorts][2] project.

### Darwin and MacPorts

When Apple shifted to Unix at the turn of the century, it essentially built a Unix operating system called [Darwin][3]. Shortly thereafter, a group of resourceful hackers promptly began work on a project called OpenDarwin, with the intent of creating an independent branch of Darwin. They hoped that OpenDarwin and Apple developers could work on related codebases, borrowing from each other whenever it was useful. Unfortunately, OpenDarwin didn't gain traction within Apple and it eventually [came to an end][4]. However, the OpenDarwin package manager project, MacPorts, is alive and well and continues to provide great open source software for macOS.

MacOS already comes with a healthy set of default terminal commands, some borrowed from GNU, others from BSD, and still others written especially for Darwin. You can use MacPorts to add new commands and even graphical applications.

### Install MacPorts

Your macOS version dictates which MacPorts installer package you need. So first, get the version of macOS you're currently running:


```
$ sw_vers -productVersion
10.xx.y
```

MacPorts releases for recent macOS versions are available on [macports.org/install.php][5]. You can download an installer from the website, or just copy the link and download using the [curl][6] command:


```
$ curl <https://distfiles.macports.org/MacPorts/MacPorts-2.6.3-10.14-Mojave.pkg> \
\--output MacPorts-2.6.3-10.14-Mojave.pkg
```

Once you download the installer, you can double-click to install it or install it using a terminal:


```
$ sudo installer -verbose \
-pkg MacPorts*.pkg
-tgt /
```

### Configure MacPorts

Once the package is installed, you must add the relevant paths to your system so that your terminal knows where to find your new MacPorts commands. Add the path to MacPorts, and add its manual pages to your `PATH` environment variable by adding this to `~/.bashrc`:


```
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
```

Load your new environment:


```
`$ source ~/.bashrc`
```

Run an update so your MacPorts installation has access to the latest versions of software:


```
`$ sudo port -v selfupdate`
```

### Use MacPorts

Some package managers install pre-built software from a server onto your local system. This is called _binary installation_ because it installs code that's been compiled into an executable binary file. Other package managers, MacPorts among them, pull source code from a server, compile it into a binary executable on your computer, and install it into the correct directories. The end result is the same: you have the software you want.

The way they get there is different.

There are advantages to both methods. A binary install is quicker because the only transaction required is copying files from a server onto your computer. This is something [Homebrew][7] does with its "bottles," but there are sometimes issues with [non-relocatable][8] builds. Installing from source code means it's easy for you to modify how software is built and where it gets installed.

MacPorts provides the **port** command, and calls it packages **ports** (inherited terminology from projects like NetBSD's [Pkgsrc][9] and FreeBSD's port system.) The typical MacPorts workflow is to search for an application and then install it.

#### Search for an application

If you know the specific command or application you need to install, search for it to ensure it's in the MacPorts tree:


```
`$ sudo port search parallel`
```

By default, `port` searches both the names and descriptions of packages. You can search on just the name field by adding the `--name` option:


```
`$ sudo port search --name parallel`
```

You can make your searches "fuzzy" with common shell wildcards. For instance, to search for `parallel` only at the start of a name field:


```
`$ sudo port search --name --glob "parallel*"`
```

List all ports

If you don't know what you're searching for and you want to see all the packages (or "ports" in MacPorts and BSD terminology) available, use the `list` subcommand:


```
`$ sudo port list`
```

The list is long but complete. You can, of course, redirect the output into a text for reference or pipe it to `more` or `less` for closer examination:


```
$ sudo port list &gt; all-ports.txt
$ sudo port list | less
```

#### Get information about a package

You can get all the important details about a package with the `info` subcommand:


```
$ sudo port info parallel
parallel @20200922 (sysutils)

Description:          Build and execute shell command lines from standard input in parallel
Homepage:             <https://www.gnu.org/software/parallel/>

Library Dependencies: perl5
Platforms:            darwin
License:              GPL-3+
Maintainers:          Email: [example@example.com][10]
```

This displays important metadata about each application, including a brief description of what it is and the project homepage, in case you need more information. It also lists dependencies, which are _other_ ports that must be on your system for a package to run correctly. Dependencies are resolved automatically by MacPorts, meaning that if you install, for example, the `parallel` package, MacPorts also installs `perl5` if it's not already on your system. Finally, it provides the license and port maintainer.

#### Install a package

When you're ready to install a package, use the `install` subcommand:


```
`$ sudo port install parallel`
```

It can take some time to compile the code depending on your CPU, the size of the code base, and the number of packages being installed, so be patient. It'll be worth it.

Once the installation is done, the new application is available immediately:


```
$ parallel echo ::: "hello" "world"
hello
world
```

Applications installed by MacPorts are placed into `/opt/local`.

#### View what is installed

Once a package has been installed on your system, you can see exactly what it placed on your drive using the `contents` subcommand:


```
$ sudo port contents parallel
/opt/local/bin/parallel
[...]
```

#### Clean up

Installing a package with MacPorts often leaves build files in your ports tree. These files are useful for debugging a failed install, but normally you don't need to keep them lying around. Purge these files from your system with the `port clean` command:


```
`$ port clean parallel`
```

#### Uninstall packages

Uninstall a package with the `port uninstall` command:


```
`$ port uninstall parallel`
```

### Open source package management

The MacPorts project is a remnant of an early movement to build upon the open source work that served as macOS's foundation. While that effort failed, there have been efforts to revive it as a project called [PureDarwin][11]. The push to open more of Apple's code is important work, and the byproducts of this effort are beneficial to everyone running macOS. If you're looking for an easy way to get open source applications on your Mac and a reliable way to keep them up to date, install and use MacPorts.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/macports

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: http://macports.org
[3]: https://en.wikipedia.org/wiki/Darwin_%28operating_system%29
[4]: https://web.archive.org/web/20070111155348/opendarwin.org/en/news/shutdown.html
[5]: https://www.macports.org/install.php
[6]: https://opensource.com/article/20/5/curl-cheat-sheet
[7]: https://opensource.com/article/20/6/homebrew-linux
[8]: https://discourse.brew.sh/t/why-do-bottles-need-to-be-in-home-linuxbrew-linuxbrew/4346/3
[9]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[10]: mailto:example@example.com
[11]: http://www.puredarwin.org/
