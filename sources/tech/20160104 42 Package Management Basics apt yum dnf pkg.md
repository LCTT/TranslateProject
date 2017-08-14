
42 Package Management Basics: apt, yum, dnf, pkg
============================================================

![Package Management Basics: apt, yum, dnf, pkg](https://community-cdn-digitalocean-com.global.ssl.fastly.net/assets/tutorials/images/large/Package_Management_tw_mostov.png?1468952534 "Package Management Basics: apt, yum, dnf, pkg")


### Introduction

Most modern Unix-like operating systems offer a centralized mechanism for finding and installing software. Software is usually distributed in the form of packages, kept in repositories. Working with packages is known as package management. Packages provide the basic components of an operating system, along with shared libraries, applications, services, and documentation.

A package management system does much more than one-time installation of software. It also provides tools for upgrading already-installed packages. Package repositories help to ensure that code has been vetted for use on your system, and that the installed versions of software have been approved by developers and package maintainers.

When configuring servers or development environments, it's often necessary look beyond official repositories. Packages in the stable release of a distribution may be out of date, especially where new or rapidly-changing software is concerned. Nevertheless, package management is a vital skill for system administrators and developers, and the wealth of packaged software for major distributions is a tremendous resource.

This guide is intended as a quick reference for the fundamentals of finding, installing, and upgrading packages on a variety of distributions, and should help you translate that knowledge between systems.

### Package Management Systems: A Brief Overview

Most package systems are built around collections of package files. A package file is usually an archive which contains compiled binaries and other resources making up the software, along with installation scripts. Packages also contain valuable metadata, including their dependencies, a list of other packages required to install and run them.

While their functionality and benefits are broadly similar, packaging formats and tools vary by platform:

| Operating System | Format | Tool(s) |
| --- | --- | --- |
| Debian | `.deb` | `apt`, `apt-cache`, `apt-get`, `dpkg` |
| Ubuntu | `.deb` | `apt`, `apt-cache`, `apt-get`, `dpkg` |
| CentOS | `.rpm` | `yum` |
| Fedora | `.rpm` | `dnf` |
| FreeBSD | Ports, `.txz` | `make`, `pkg` |

In Debian and systems based on it, like Ubuntu, Linux Mint, and Raspbian, the package format is the `.deb`file. APT, the Advanced Packaging Tool, provides commands used for most common operations: Searching repositories, installing collections of packages and their dependencies, and managing upgrades. APT commands operate as a front-end to the lower-level `dpkg` utility, which handles the installation of individual `.deb` files on the local system, and is sometimes invoked directly.

Recent releases of most Debian-derived distributions include the `apt` command, which offers a concise and unified interface to common operations that have traditionally been handled by the more-specific `apt-get` and `apt-cache`. Its use is optional, but may simplify some tasks.

CentOS, Fedora, and other members of the Red Hat family use RPM files. In CentOS, `yum` is used to interact with both individual package files and repositories.

In recent versions of Fedora, `yum` has been supplanted by `dnf`, a modernized fork which retains most of `yum`'s interface.

FreeBSD's binary package system is administered with the `pkg` command. FreeBSD also offers the Ports Collection, a local directory structure and tools which allow the user to fetch, compile, and install packages directly from source using Makefiles. It's usually much more convenient to use `pkg`, but occasionally a pre-compiled package is unavailable, or you may need to change compile-time options.

### Update Package Lists

Most systems keep a local database of the packages available from remote repositories. It's best to update this database before installing or upgrading packages. As a partial exception to this pattern, `yum`and `dnf` will check for updates before performing some operations, but you can ask them at any time whether updates are available.

| System | Command |
| --- | --- |
| Debian / Ubuntu | `sudo apt-get update` |
|  | `sudo apt update` |
| CentOS | `yum check-update` |
| Fedora | `dnf check-update` |
| FreeBSD Packages | `sudo pkg update` |
| FreeBSD Ports | `sudo portsnap fetch update` |

### Upgrade Installed Packages

Making sure that all of the installed software on a machine stays up to date would be an enormous undertaking without a package system. You would have to track upstream changes and security alerts for hundreds of different packages. While a package manager doesn't solve every problem you'll encounter when upgrading software, it does enable you to maintain most system components with a few commands.

On FreeBSD, upgrading installed ports can introduce breaking changes or require manual configuration steps. It's best to read `/usr/ports/UPDATING` before upgrading with `portmaster`.

| System | Command | Notes |
| --- | --- | --- |
| Debian / Ubuntu | `sudo apt-get upgrade` | Only upgrades installed packages, where possible. |
|  | `sudo apt-get dist-upgrade` | May add or remove packages to satisfy new dependencies. |
|  | `sudo apt upgrade` | Like `apt-get upgrade`. |
|  | `sudo apt full-upgrade` | Like `apt-get dist-upgrade`. |
| CentOS | `sudo yum update` |  |
| Fedora | `sudo dnf upgrade` |  |
| FreeBSD Packages | `sudo pkg upgrade` |  |
| FreeBSD Ports | `less /usr/ports/UPDATING` | Uses `less` to view update notes for ports (use arrow keys to scroll, press q to quit). |
|  | `cd /usr/ports/ports-mgmt/portmaster && sudo make install && sudo portmaster -a` | Installs `portmaster` and uses it to update installed ports. |

### Find a Package

Most distributions offer a graphical or menu-driven front end to package collections. These can be a good way to browse by category and discover new software. Often, however, the quickest and most effective way to locate a package is to search with command-line tools.

| System | Command | Notes |
| --- | --- | --- |
| Debian / Ubuntu | `apt-cache search search_string` |  |
|  | `apt search search_string` |  |
| CentOS | `yum search search_string` |  |
|  | `yum search all search_string` | Searches all fields, including description. |
| Fedora | `dnf search search_string` |  |
|  | `dnf search all search_string` | Searches all fields, including description. |
| FreeBSD Packages | `pkg search search_string` | Searches by name. |
|  | `pkg search -f search_string` | Searches by name, returning full descriptions. |
|  | `pkg search -D search_string` | Searches description. |
| FreeBSD Ports | `cd /usr/ports && make search name=package` | Searches by name. |
|  | `cd /usr/ports && make search key=search_string` | Searches comments, descriptions, and dependencies. |

### View Info About a Specific Package

When deciding what to install, it's often helpful to read detailed descriptions of packages. Along with human-readable text, these often include metadata like version numbers and a list of the package's dependencies.

| System | Command | Notes |
| --- | --- | --- |
| Debian / Ubuntu | `apt-cache show package` | Shows locally-cached info about a package. |
|  | `apt show package` |  |
|  | `dpkg -s package` | Shows the current installed status of a package. |
| CentOS | `yum info package` |  |
|  | `yum deplist package` | Lists dependencies for a package. |
| Fedora | `dnf info package` |  |
|  | `dnf repoquery --requires package` | Lists dependencies for a package. |
| FreeBSD Packages | `pkg info package` | Shows info for an installed package. |
| FreeBSD Ports | `cd /usr/ports/category/port && cat pkg-descr` |  |

### Install a Package from Repositories

Once you know the name of a package, you can usually install it and its dependencies with a single command. In general, you can supply multiple packages to install simply by listing them all.

| System | Command | Notes |
| --- | --- | --- |
| Debian / Ubuntu | `sudo apt-get install package` |  |
|  | `sudo apt-get install package1 package2 ...` | Installs all listed packages. |
|  | `sudo apt-get install -y package` | Assumes "yes" where `apt` would usually prompt to continue. |
|  | `sudo apt install package` | Displays a colored progress bar. |
| CentOS | `sudo yum install package` |  |
|  | `sudo yum install package1 package2 ...` | Installs all listed packages. |
|  | `sudo yum install -y package` | Assumes "yes" where `yum` would usually prompt to continue. |
| Fedora | `sudo dnf install package` |  |
|  | `sudo dnf install package1 package2 ...` | Installs all listed packages. |
|  | `sudo dnf install -y package` | Assumes "yes" where `dnf` would usually prompt to continue. |
| FreeBSD Packages | `sudo pkg install package` |  |
|  | `sudo pkg install package1 package2 ...` | Installs all listed packages. |
| FreeBSD Ports | `cd /usr/ports/category/port && sudo make install` | Builds and installs a port from source. |

### Install a Package from the Local Filesystem

Sometimes, even though software isn't officially packaged for a given operating system, a developer or vendor will offer package files for download. You can usually retrieve these with your web browser, or via `curl` on the command line. Once a package is on the target system, it can often be installed with a single command.

On Debian-derived systems, `dpkg` handles individual package files. If a package has unmet dependencies, `gdebi` can often be used to retrieve them from official repositories.

On CentOS and Fedora systems, `yum` and `dnf` are used to install individual files, and will also handle needed dependencies.

| System | Command | Notes |
| --- | --- | --- |
| Debian / Ubuntu | `sudo dpkg -i package.deb` |  |
|  | `sudo apt-get install -y gdebi&& sudo gdebi package.deb` | Installs and uses `gdebi` to install `package.deb`and retrieve any missing dependencies. |
| CentOS | `sudo yum install package.rpm` |  |
| Fedora | `sudo dnf install package.rpm` |  |
| FreeBSD Packages | `sudo pkg add package.txz` |  |
|  | `sudo pkg add -f package.txz` | Installs package even if already installed. |

### Remove One or More Installed Packages

Since a package manager knows what files are provided by a given package, it can usually remove them cleanly from a system if the software is no longer needed.

| System | Command | Notes |
| --- | --- | --- |
| Debian / Ubuntu | `sudo apt-get remove package` |  |
|  | `sudo apt remove package` |  |
|  | `sudo apt-get autoremove` | Removes unneeded packages. |
| CentOS | `sudo yum remove package` |  |
| Fedora | `sudo dnf erase package` |  |
| FreeBSD Packages | `sudo pkg delete package` |  |
|  | `sudo pkg autoremove` | Removes unneeded packages. |
| FreeBSD Ports | `sudo pkg delete package` |  |
|  | `cd /usr/ports/path_to_port && make deinstall` | De-installs an installed port. |

### The `apt` Command

Administrators of Debian-family distributions are generally familiar with `apt-get` and `apt-cache`. Less widely known is the simplified `apt` interface, designed specifically for interactive use.

| Traditional Command | `apt` Equivalent |
| --- | --- |
| `apt-get update` | `apt update` |
| `apt-get dist-upgrade` | `apt full-upgrade` |
| `apt-cache search string` | `apt search string` |
| `apt-get install package` | `apt install package` |
| `apt-get remove package` | `apt remove package` |
| `apt-get purge package` | `apt purge package` |

While `apt` is often a quicker shorthand for a given operation, it's not intended as a complete replacement for the traditional tools, and its interface may change between versions to improve usability. If you are using package management commands inside a script or a shell pipeline, it's a good idea to stick with `apt-get` and `apt-cache`.

### Get Help

In addition to web-based documentation, keep in mind that Unix manual pages (usually referred to as man pages) are available for most commands from the shell. To read a page, use `man`:

```
man page

```

In `man`, you can navigate with the arrow keys. Press / to search for text within the page, and q to quit.

| System | Command | Notes |
| --- | --- | --- |
| Debian / Ubuntu | `man apt-get` | Updating the local package database and working with packages. |
|  | `man apt-cache` | Querying the local package database. |
|  | `man dpkg` | Working with individual package files and querying installed packages. |
|  | `man apt` | Working with a more concise, user-friendly interface to most basic operations. |
| CentOS | `man yum` |  |
| Fedora | `man dnf` |  |
| FreeBSD Packages | `man pkg` | Working with pre-compiled binary packages. |
| FreeBSD Ports | `man ports` | Working with the Ports Collection. |

### Conclusion and Further Reading

This guide provides an overview of basic operations that can be cross-referenced between systems, but only scratches the surface of a complex topic. For greater detail on a given system, you can consult the following resources:

*   [This guide][1] covers Ubuntu and Debian package management in detail.

*   There's an [official CentOS guide to managing software with `yum`][2].

*   There's a [Fedora wiki page about `dnf`][3], and an [official manual for `dnf` itself][4].

*   [This guide][5] covers FreeBSD package management using `pkg`.

*   The [FreeBSD Handbook][6] contains a [section on using the Ports Collection][7].

--------------------------------------------------------------------------------

via: https://www.digitalocean.com/community/tutorials/package-management-basics-apt-yum-dnf-pkg

作者：[Brennen Bearnes ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.digitalocean.com/community/users/bpb
[1]:https://www.digitalocean.com/community/tutorials/ubuntu-and-debian-package-management-essentials
[2]:https://www.centos.org/docs/5/html/yum/
[3]:https://fedoraproject.org/wiki/Dnf
[4]:https://dnf.readthedocs.org/en/latest/index.html
[5]:https://www.digitalocean.com/community/tutorials/how-to-manage-packages-on-freebsd-10-1-with-pkg
[6]:https://www.freebsd.org/doc/handbook/
[7]:https://www.freebsd.org/doc/handbook/ports-using.html
[8]:https://www.digitalocean.com/community/tags/linux-commands?type=tutorials
[9]:https://www.digitalocean.com/community/tags/getting-started?type=tutorials
[10]:https://www.digitalocean.com/community/tags/system-tools?type=tutorials
[11]:https://www.digitalocean.com/community/tags/linux-basics?type=tutorials
