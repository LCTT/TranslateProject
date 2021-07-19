[#]: subject: (Linux package managers: dnf vs apt)
[#]: via: (https://opensource.com/article/21/7/dnf-vs-apt)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Linux package managers: dnf vs apt
======
Package managers do the same general things—installing, managing, and
uninstalling applications—but they don't do everything the same.
![Gift box opens with colors coming out][1]

There are many ways to [get applications onto a Linux system][2]. Some, like Flatpak and containers, are new. Others, like DEB and RPM, are classic formats that have withstood the test of time.

There isn't a universal installer for any operating system. Today, all major OSes use a mix of app stores (both first and third party), drag-and-drop installation, and installation wizards because there are innumerable developers delivering software. Different developers have different requirements for the code they deliver, and this informs the installation method they each choose.

Linux pioneered the concept of a _package manager_, a command to install, manage, and uninstall applications. Two common package manager commands are `apt` and `dnf`. The `apt` command manages DEB packages, while `dnf` manages RPM packages. The two are not strictly exclusive of one another in theory, although in practice, a Linux distribution generally uses one or the other. It's theoretically possible to run both on one system, but package installations would overlap, versioning would be difficult, and the commands would be redundant to one another. However, if you work in a mixed Linux environment, interacting with workstations running one distribution and servers running another, you may need to know both.

### Searching for applications

Before you can install an application with a package manager, you need to know the package's name. Usually, the application name and the package name are the same. The process to verify the name of the package you want to install is exactly the same on `dnf` and `apt`:


```
$ sudo dnf search zsh
====== Name Exactly Matched: zsh ======
zsh.x86_64 : Powerful interactive shell
[...]
```

With `apt`:


```
$ sudo apt search zsh
Sorting... Done
Full Text Search... Done
csh/stable 20110502-4+deb10u1 amd64
  Shell with C-like syntax

ddgr/stable 1.6-1 all
  DuckDuckGo from the terminal

direnv/stable 2.18.2-2 amd64
  Utility to set directory specific environment variables

draai/stable 20180521-1 all
  Command-line music player for MPD
[...]
```

To get relevant results from `apt` earlier in the search, you can use [regex][3]:


```
apt search ^zsh
Sorting... Done
Full Text Search... Done
zsh/stable 5.7.1-1 amd64
  shell with lots of features
[...]
```

### Finding an application's package

Some commands come bundled with other commands, all in one package. When that happens, you can use your package manager to learn which package provides what you need. The `dnf` and `apt` commands diverge on how they search for this kind of metadata.

On `dnf`:


```
$ sudo dnf provides pgrep
procps-ng-3.3.15-6.el8.x86_64 : System and process monitoring utilities
Repo        : baseos
Matched from:
Filename    : /usr/bin/pgrep
```

The `apt` command uses a subcommand, `apt-file`. To use `apt-file`, you must first install it and then prompt it to update its cache:


```
$ sudo apt install apt-file
Reading package lists... Done
Building dependency tree      
Reading state information... Done
The following additional packages will be installed:
  libapt-pkg-perl libexporter-tiny-perl liblist-moreutils-perl libregexp-assemble-perl
The following NEW packages will be installed:
  apt-file libapt-pkg-perl libexporter-tiny-perl liblist-moreutils-perl libregexp-assemble-perl
0 upgraded, 5 newly installed, 0 to remove and 14 not upgraded.
Need to get 297 kB of archives.
After this operation, 825 kB of additional disk space will be used.
Do you want to continue? [Y/n] y

$ sudo apt-file update
[...]
```

You can use `apt-file` to search for a command. You can cast a very wide net by just searching for the command, but if you happen to know the command's expected path, it's more accurate:


```
$ sudo apt-file search /usr/bin/pgrep
pgreplay: /usr/bin/pgreplay              
procps: /usr/bin/pgrep
```

### Installing applications

Installing applications is essentially identical with `apt` and `dnf`:


```
`$ sudo apt install zsh`
```

With `dnf`, you can install a single package using the same option:


```
`$ sudo dnf install zsh`
```

Many RPM-based distributions feature _installation groups_, which collect sometimes superficially related applications into one easily installable target. For instance, the [Design Suite][4] group in Fedora contains popular creative applications. Many artists who want one creative application are likely to want similar applications, and installing the whole group is an easy and quick way to get a sensible start on building a digital studio. You can view available groups with `group list` (use `-v` to see the group names without spaces):


```
$ sudo dnf group list -v
[...]
Available Groups:
   Container Management (container-management)
   RPM Development Tools (rpm-development-tools)
   Design Suite (design-suite)
   Development Tools (development)
[...]
```

Install an RPM group using the `group install` subcommands:


```
`$ sudo dnf group install design-suite`
```

You can use the `@` notation to reduce typing:


```
`$ sudo dnf install @design-suite`
```

### Upgrading applications

One advantage of using a package manager is that it is aware of _all_ the applications it has ever installed. That means you don't have to go hunting for updated versions of applications. Instead, you can tell your package manager to scan for updates.

The subcommands used by `dnf` and `apt` are slightly different. Because `apt` keeps a cache of information that requires regular updating, it uses the `upgrade` subcommand for application updates:


```
`$ sudo apt upgrade`
```

By contrast, `dnf` updates metadata every time you use the command, so the `update` and `upgrade` subcommands are interchangeable:


```
`$ sudo dnf upgrade`
```

This is the same as:


```
`$ sudo dnf update`
```

### Removing applications

If you've ever tried to remove an application manually on any platform, then you know there are inevitably leftover files, such as preference files or assets or icons, scattered all around your hard drive after you remove the application. Yet another advantage to using a package manager is that your package manager knows _every single file_ installed with a package:


```
`$ sudo dnf remove zsh`
```

The `remove` subcommand is also used for `apt`:


```
`$ sudo apt remove zsh`
```

Removing a package with `apt` doesn't remove modified user configuration files, in case you removed the package by accident. If you want `apt` to remove an application _and_ its configuration files, use `purge` on an application you've previously removed:


```
`$ sudo apt purge zsh`
```

Both `apt` and `dnf` (even with `purge`) don't remove data or configuration files in your home directory. To remove data from your home directory, you must do it manually (it's usually found in `~/.config` and `~/.local`).

### Learning package management

Whether your Linux distribution of choice favors `apt` or `dnf`, the commands' purposes are broadly identical. They help you install, update, and remove packages. These two, being the most common package managers, largely mirror one another's most important syntactical elements, so switching between them is pretty easy.

Each has some advanced features, such as repository management, that diverge substantially, but those tend not to be run as frequently as the classic sequence of `search` and `install`.

Regardless of which package manager you use more often, you can download our [apt cheat sheet][5] and [dnf cheat sheet][6] so that you have the most important syntax close at hand when you need it the most.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/dnf-vs-apt

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://opensource.com/article/18/1/how-install-apps-linux
[3]: https://opensource.com/article/18/5/getting-started-regular-expressions
[4]: https://labs.fedoraproject.org/en/design-suite/
[5]: https://opensource.com/downloads/apt-cheat-sheet
[6]: https://opensource.com/downloads/dnf-cheat-sheet
