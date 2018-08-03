Translating by DavidChenLiang

The evolution of package managers
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/suitcase_container_bag.png?itok=q40lKCBY)

Every computerized device uses some form of software to perform its intended tasks. In the early days of software, products were stringently tested for bugs and other defects. For the last decade or so, software has been released via the internet with the intent that any bugs would be fixed by applying new versions of the software. In some cases, each individual application has its own updater. In others, it is left up to the user to figure out how to obtain and upgrade software.

Linux adopted early the practice of maintaining a centralized location where users could find and install software. In this article, I'll discuss the history of software installation on Linux and how modern operating systems are kept up to date against the never-ending torrent of [CVEs][1].

### How was software on Linux installed before package managers?

Historically, software was provided either via FTP or mailing lists (eventually this distribution would grow to include basic websites). Only a few small files contained the instructions to create a binary (normally in a tarfile). You would untar the files, read the readme, and as long as you had GCC or some other form of C compiler, you would then typically run a `./configure` script with some list of attributes, such as pathing to library files, location to create new binaries, etc. In addition, the `configure` process would check your system for application dependencies. If any major requirements were missing, the configure script would exit and you could not proceed with the installation until all the dependencies were met. If the configure script completed successfully, a `Makefile` would be created.

Once a `Makefile` existed, you would then proceed to run the `make` command (this command is provided by whichever compiler you were using). The `make` command has a number of options called make flags, which help optimize the resulting binaries for your system. In the earlier days of computing, this was very important because hardware struggled to keep up with modern software demands. Today, compilation options can be much more generic as most hardware is more than adequate for modern software.

Finally, after the `make` process had been completed, you would need to run `make install` (or `sudo make install`) in order to actually install the software. As you can imagine, doing this for every single piece of software was time-consuming and tedious—not to mention the fact that updating software was a complicated and potentially very involved process.

### What is a package?

Packages were invented to combat this complexity. Packages collect multiple data files together into a single archive file for easier portability and storage, or simply compress files to reduce storage space. The binaries included in a package are precompiled with according to the sane defaults the developer chosen. Packages also contain metadata, such as the software's name, a description of its purpose, a version number, and a list of dependencies necessary for the software to run properly.

Several flavors of Linux have created their own package formats. Some of the most commonly used package formats include:

  * .deb: This package format is used by Debian, Ubuntu, Linux Mint, and several other derivatives. It was the first package type to be created.
  * .rpm: This package format was originally called Red Hat Package Manager. It is used by Red Hat, Fedora, SUSE, and several other smaller distributions.
  * .tar.xz: While it is just a compressed tarball, this is the format that Arch Linux uses.



While packages themselves don't manage dependencies directly, they represented a huge step forward in Linux software management.

### What is a software repository?

A few years ago, before the proliferation of smartphones, the idea of a software repository was difficult for many users to grasp if they were not involved in the Linux ecosystem. To this day, most Windows users still seem to be hardwired to open a web browser to search for and install new software. However, those with smartphones have gotten used to the idea of a software "store." The way smartphone users obtain software and the way package managers work are not dissimilar. While there have been several attempts at making an attractive UI for software repositories, the vast majority of Linux users still use the command line to install packages. Software repositories are a centralized listing of all of the available software for any repository the system has been configured to use. Below are some examples of searching a repository for a specifc package (note that these have been truncated for brevity):

Arch Linux with aurman
```
user@arch ~ $  aurman -Ss kate

extra/kate 18.04.2-2 (kde-applications kdebase)
    Advanced Text Editor
aur/kate-root 18.04.0-1 (11, 1.139399)
    Advanced Text Editor, patched to be able to run as root
aur/kate-git r15288.15d26a7-1 (1, 1e-06)
    An advanced editor component which is used in numerous KDE applications requiring a text editing component
```

CentOS 7 using YUM
```
[user@centos ~]$ yum search kate

kate-devel.x86_64 : Development files for kate
kate-libs.x86_64 : Runtime files for kate
kate-part.x86_64 : Kate kpart plugin
```

Ubuntu using APT
```
user@ubuntu ~ $ apt search kate
Sorting... Done
Full Text Search... Done

kate/xenial 4:15.12.3-0ubuntu2 amd64
  powerful text editor

kate-data/xenial,xenial 4:4.14.3-0ubuntu4 all
  shared data files for Kate text editor

kate-dbg/xenial 4:15.12.3-0ubuntu2 amd64
  debugging symbols for Kate

kate5-data/xenial,xenial 4:15.12.3-0ubuntu2 all
  shared data files for Kate text editor
```

### What are the most prominent package managers?

As suggested in the above output, package managers are used to interact with software repositories. The following is a brief overview of some of the most prominent package managers.

#### RPM-based package managers

Updating RPM-based systems, particularly those based on Red Hat technologies, has a very interesting and detailed history. In fact, the current versions of [yum][2] (for enterprise distributions) and [DNF][3] (for community) combine several open source projects to provide their current functionality.

Initially, Red Hat used a package manager called [RPM][4] (Red Hat Package Manager), which is still in use today. However, its primary use is to install RPMs, which you have locally, not to search software repositories. The package manager named `up2date` was created to inform users of updates to packages and enable them to search remote repositories and easily install dependencies. While it served its purpose, some community members felt that `up2date` had some significant shortcomings.

The current incantation of yum came from several different community efforts. Yellowdog Updater (YUP) was developed in 1999-2001 by folks at Terra Soft Solutions as a back-end engine for a graphical installer of [Yellow Dog Linux][5]. Duke University liked the idea of YUP and decided to improve upon it. They created [Yellowdog Updater, Modified (yum)][6] which was eventually adapted to help manage the university's Red Hat Linux systems. Yum grew in popularity, and by 2005 it was estimated to be used by more than half of the Linux market. Today, almost every distribution of Linux that uses RPMs uses yum for package management (with a few notable exceptions).

#### Working with yum

In order for yum to download and install packages out of an internet repository, files must be located in `/etc/yum.repos.d/` and they must have the extension `.repo`. Here is an example repo file:
```
[local_base]
name=Base CentOS  (local)
baseurl=http://7-repo.apps.home.local/yum-repo/7/
enabled=1
gpgcheck=0
```

This is for one of my local repositories, which explains why the GPG check is off. If this check was on, each package would need to be signed with a cryptographic key and a corresponding key would need to be imported into the system receiving the updates. Because I maintain this repository myself, I trust the packages and do not bother signing them.

Once a repository file is in place, you can start installing packages from the remote repository. The most basic command is `yum update`, which will update every package currently installed. This does not require a specific step to refresh the information about repositories; this is done automatically. A sample of the command is shown below:
```
[user@centos ~]$ sudo yum update
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager
local_base                             | 3.6 kB  00:00:00    
local_epel                             | 2.9 kB  00:00:00    
local_rpm_forge                        | 1.9 kB  00:00:00    
local_updates                          | 3.4 kB  00:00:00    
spideroak-one-stable                   | 2.9 kB  00:00:00    
zfs                                    | 2.9 kB  00:00:00    
(1/6): local_base/group_gz             | 166 kB  00:00:00    
(2/6): local_updates/primary_db        | 2.7 MB  00:00:00    
(3/6): local_base/primary_db           | 5.9 MB  00:00:00    
(4/6): spideroak-one-stable/primary_db |  12 kB  00:00:00    
(5/6): local_epel/primary_db           | 6.3 MB  00:00:00    
(6/6): zfs/x86_64/primary_db           |  78 kB  00:00:00    
local_rpm_forge/primary_db             | 125 kB  00:00:00    
Determining fastest mirrors
Resolving Dependencies
--> Running transaction check
```

If you are sure you want yum to execute any command without stopping for input, you can put the `-y` flag in the command, such as `yum update -y`.

Installing a new package is just as easy. First, search for the name of the package with `yum search`:
```
[user@centos ~]$ yum search kate

artwiz-aleczapka-kates-fonts.noarch : Kates font in Artwiz family
ghc-highlighting-kate-devel.x86_64 : Haskell highlighting-kate library development files
kate-devel.i686 : Development files for kate
kate-devel.x86_64 : Development files for kate
kate-libs.i686 : Runtime files for kate
kate-libs.x86_64 : Runtime files for kate
kate-part.i686 : Kate kpart plugin
```

Once you have the name of the package, you can simply install the package with `sudo yum install kate-devel -y`. If you installed a package you no longer need, you can remove it with `sudo yum remove kate-devel -y`. By default, yum will remove the package plus its dependencies.

There may be times when you do not know the name of the package, but you know the name of the utility. For example, suppose you are looking for the utility `updatedb`, which creates/updates the database used by the `locate` command. Attempting to install `updatedb` returns the following results:
```
[user@centos ~]$ sudo yum install updatedb
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
No package updatedb available.
Error: Nothing to do
```

You can find out what package the utility comes from by running:
```
[user@centos ~]$ yum whatprovides *updatedb
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile

bacula-director-5.2.13-23.1.el7.x86_64 : Bacula Director files
Repo        : local_base
Matched from:
Filename    : /usr/share/doc/bacula-director-5.2.13/updatedb

mlocate-0.26-8.el7.x86_64 : An utility for finding files by name
Repo        : local_base
Matched from:
Filename    : /usr/bin/updatedb
```

The reason I have used an asterisk `*` in front of the command is because `yum whatprovides` uses the path to the file in order to make a match. Since I was not sure where the file was located, I used an asterisk to indicate any path.

There are, of course, many more options available to yum. I encourage you to view the man page for yum for additional options.

[Dandified Yum (DNF)][7] is a newer iteration on yum. Introduced in Fedora 18, it has not yet been adopted in the enterprise distributions, and as such is predominantly used in Fedora (and derivatives). Its usage is almost exactly the same as that of yum, but it was built to address poor performance, undocumented APIs, slow/broken dependency resolution, and occasional high memory usage. DNF is meant as a drop-in replacement for yum, and therefore I won't repeat the commands—wherever you would use `yum`, simply substitute `dnf`.

#### Working with Zypper

[Zypper][8] is another package manager meant to help manage RPMs. This package manager is most commonly associated with [SUSE][9] (and [openSUSE][10]) but has also seen adoption by [MeeGo][11], [Sailfish OS][12], and [Tizen][13]. It was originally introduced in 2006 and has been iterated upon ever since. There is not a whole lot to say other than Zypper is used as the back end for the system administration tool [YaST][14] and some users find it to be faster than yum.

Zypper's usage is very similar to that of yum. To search for, update, install or remove a package, simply use the following:
```
zypper search kate
zypper update
zypper install kate
zypper remove kate
```
Some major differences come into play in how repositories are added to the system with `zypper`. Unlike the package managers discussed above, `zypper` adds repositories using the package manager itself. The most common way is via a URL, but `zypper` also supports importing from repo files.
```
suse:~ # zypper addrepo http://download.videolan.org/pub/vlc/SuSE/15.0 vlc
Adding repository 'vlc' [done]
Repository 'vlc' successfully added

Enabled     : Yes
Autorefresh : No
GPG Check   : Yes
URI         : http://download.videolan.org/pub/vlc/SuSE/15.0
Priority    : 99
```

You remove repositories in a similar manner:
```
suse:~ # zypper removerepo vlc
Removing repository 'vlc' ...................................[done]
Repository 'vlc' has been removed.
```

Use the `zypper repos` command to see what the status of repositories are on your system:
```
suse:~ # zypper repos
Repository priorities are without effect. All enabled repositories share the same priority.

#  | Alias                     | Name                                    | Enabled | GPG Check | Refresh
---|---------------------------|-----------------------------------------|---------|-----------|--------
 1 | repo-debug                | openSUSE-Leap-15.0-Debug                | No      | ----      | ----  
 2 | repo-debug-non-oss        | openSUSE-Leap-15.0-Debug-Non-Oss        | No      | ----      | ----  
 3 | repo-debug-update         | openSUSE-Leap-15.0-Update-Debug         | No      | ----      | ----  
 4 | repo-debug-update-non-oss | openSUSE-Leap-15.0-Update-Debug-Non-Oss | No      | ----      | ----  
 5 | repo-non-oss              | openSUSE-Leap-15.0-Non-Oss              | Yes     | ( p) Yes  | Yes    
 6 | repo-oss                  | openSUSE-Leap-15.0-Oss                  | Yes     | ( p) Yes  | Yes    
```

`zypper` even has a similar ability to determine what package name contains files or binaries. Unlike YUM, it uses a hyphen in the command (although this method of searching is deprecated):
```
localhost:~ # zypper what-provides kate
Command 'what-provides' is replaced by 'search --provides --match-exact'.
See 'help search' for all available options.
Loading repository data...
Reading installed packages...

S  | Name | Summary              | Type      
---|------|----------------------|------------
i+ | Kate | Advanced Text Editor | application
i  | kate | Advanced Text Editor | package  
```

As with YUM and DNF, Zypper has a much richer feature set than covered here. Please consult with the official documentation for more in-depth information.

#### Debian-based package managers

One of the oldest Linux distributions currently maintained, Debian's system is very similar to RPM-based systems. They use `.deb` packages, which can be managed by a tool called dpkg. dpkg is very similar to rpm in that it was designed to manage packages that are available locally. It does no dependency resolution (although it does dependency checking), and has no reliable way to interact with remote repositories. In order to improve the user experience and ease of use, the Debian project commissioned a project called Deity. This codename was eventually abandoned and changed to [Advanced Package Tool (APT)][15].

Released as test builds in 1998 (before making an appearance in Debian 2.1 in 1999), many users consider APT one of the defining features of Debian-based systems. It makes use of repositories in a similar fashion to RPM-based systems, but instead of individual `.repo` files that `yum` uses, `apt` has historically used `/etc/apt/sources.list` to manage repositories. More recently, it also ingests files from `/etc/apt/sources.d/`. Following the examples in the RPM-based package managers, to accomplish the same thing on Debian-based distributions you have a few options. You can edit/create the files manually in the aforementioned locations from the terminal, or in some cases, you can use a UI front end (such as `Software & Updates` provided by Ubuntu et al.). To provide the same treatment to all distributions, I will cover only the command-line options. To add a repository without directly editing a file, you can do something like this:
```
user@ubuntu:~$ sudo apt-add-repository "deb http://APT.spideroak.com/ubuntu-spideroak-hardy/ release restricted"

```

This will create a `spideroakone.list` file in `/etc/apt/sources.list.d`. Obviously, these lines change depending on the repository being added. If you are adding a Personal Package Archive (PPA), you can do this:
```
user@ubuntu:~$ sudo apt-add-repository ppa:gnome-desktop

```

NOTE: Debian does not support PPAs natively.

After a repository has been added, Debian-based systems need to be made aware that there is a new location to search for packages. This is done via the `apt-get update` command:
```
user@ubuntu:~$ sudo apt-get update
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [107 kB]
Hit:2 http://APT.spideroak.com/ubuntu-spideroak-hardy release InRelease
Hit:3 http://ca.archive.ubuntu.com/ubuntu xenial InRelease
Get:4 http://ca.archive.ubuntu.com/ubuntu xenial-updates InRelease [109 kB]              
Get:5 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages [517 kB]
Get:6 http://security.ubuntu.com/ubuntu xenial-security/main i386 Packages [455 kB]      
Get:7 http://security.ubuntu.com/ubuntu xenial-security/main Translation-en [221 kB]    
...

Fetched 6,399 kB in 3s (2,017 kB/s)                                          
Reading package lists... Done
```

Now that the new repository is added and updated, you can search for a package using the `apt-cache` command:
```
user@ubuntu:~$ apt-cache search kate
aterm-ml - Afterstep XVT - a VT102 emulator for the X window system
frescobaldi - Qt4 LilyPond sheet music editor
gitit - Wiki engine backed by a git or darcs filestore
jedit - Plugin-based editor for programmers
kate - powerful text editor
kate-data - shared data files for Kate text editor
kate-dbg - debugging symbols for Kate
katepart - embeddable text editor component
```

To install `kate`, simply run the corresponding install command:
```
user@ubuntu:~$ sudo apt-get install kate

```

To remove a package, use `apt-get remove`:
```
user@ubuntu:~$ sudo apt-get remove kate

```

When it comes to package discovery, APT does not provide any functionality that is similar to `yum whatprovides`. There are a few ways to get this information if you are trying to find where a specific file on disk has come from.

Using dpkg
```
user@ubuntu:~$ dpkg -S /bin/ls
coreutils: /bin/ls
```

Using apt-file
```
user@ubuntu:~$ sudo apt-get install apt-file -y

user@ubuntu:~$ sudo apt-file update

user@ubuntu:~$ apt-file search kate
```

The problem with `apt-file search` is that it, unlike `yum whatprovides`, it is overly verbose unless you know the exact path, and it automatically adds a wildcard search so that you end up with results for anything with the word kate in it:
```
kate: /usr/bin/kate
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katebacktracebrowserplugin.so
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katebuildplugin.so
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katecloseexceptplugin.so
kate: /usr/lib/x86_64-linux-gnu/qt5/plugins/ktexteditor/katectagsplugin.so
```

Most of these examples have used `apt-get`. Note that most of the current tutorials for Ubuntu specifically have taken to simply using `apt`. The single `apt` command was designed to implement only the most commonly used commands in the APT arsenal. Since functionality is split between `apt-get`, `apt-cache`, and other commands, `apt` looks to unify these into a single command. It also adds some niceties such as colorization, progress bars, and other odds and ends. Most of the commands noted above can be replaced with `apt`, but not all Debian-based distributions currently receiving security patches support using `apt` by default, so you may need to install additional packages.

#### Arch-based package managers

[Arch Linux][16] uses a package manager called [pacman][17]. Unlike `.deb` or `.rpm` files, pacman uses a more traditional tarball with the LZMA2 compression (`.tar.xz`). This enables Arch Linux packages to be much smaller than other forms of compressed archives (such as gzip). Initially released in 2002, pacman has been steadily iterated and improved. One of the major benefits of pacman is that it supports the [Arch Build System][18], a system for building packages from source. The build system ingests a file called a PKGBUILD, which contains metadata (such as version numbers, revisions, dependencies, etc.) as well as a shell script with the required flags for compiling a package conforming to the Arch Linux requirements. The resulting binaries are then packaged into the aforementioned `.tar.xz` file for consumption by pacman.

This system led to the creation of the [Arch User Repository][19] (AUR) which is a community-driven repository containing PKGBUILD files and supporting patches or scripts. This allows for a virtually endless amount of software to be available in Arch. The obvious advantage of this system is that if a user (or maintainer) wishes to make software available to the public, they do not have to go through official channels to get it accepted in the main repositories. The downside is that it relies on community curation similar to [Docker Hub][20], Canonical's Snap packages, or other similar mechanisms. There are numerous AUR-specific package managers that can be used to download, compile, and install from the PKGBUILD files in the AUR (we will look at this later).

#### Working with pacman and official repositories

Arch's main package manager, pacman, uses flags instead of command words like `yum` and `apt`. For example, to search for a package, you would use `pacman -Ss`. As with most commands on Linux, you can find both a `manpage` and inline help. Most of the commands for `pacman `use the sync (-S) flag. For example:
```
user@arch ~ $ pacman -Ss kate

extra/kate 18.04.2-2 (kde-applications kdebase)
    Advanced Text Editor
extra/libkate 0.4.1-6 [installed]
    A karaoke and text codec for embedding in ogg
extra/libtiger 0.3.4-5 [installed]
    A rendering library for Kate streams using Pango and Cairo
extra/ttf-cheapskate 2.0-12
    TTFonts collection from dustimo.com
community/haskell-cheapskate 0.1.1-100
    Experimental markdown processor.
```

Arch also uses repositories similar to other package managers. In the output above, search results are prefixed with the repository they are found in (`extra/` and `community/` in this case). Similar to both Red Hat and Debian-based systems, Arch relies on the user to add the repository information into a specific file. The location for these repositories is `/etc/pacman.conf`. The example below is fairly close to a stock system. I have enabled the `[multilib]` repository for Steam support:
```
[options]
Architecture = auto

Color
CheckSpace

SigLevel    = Required DatabaseOptional
LocalFileSigLevel = Optional

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[community]
Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist
```

It is possible to specify a specific URL in `pacman.conf`. This functionality can be used to make sure all packages come from a specific point in time. If, for example, a package has a bug that affects you severely and it has several dependencies, you can roll back to a specific point in time by adding a specific URL into your `pacman.conf` and then running the commands to downgrade the system:
```
[core]
Server=https://archive.archlinux.org/repos/2017/12/22/$repo/os/$arch
```

Like Debian-based systems, Arch does not update its local repository information until you tell it to do so. You can refresh the package database by issuing the following command:
```
user@arch ~ $ sudo pacman -Sy

:: Synchronizing package databases...
 core                                                                     130.2 KiB   851K/s 00:00 [##########################################################] 100%
 extra                                                                   1645.3 KiB  2.69M/s 00:01 [##########################################################] 100%
 community                                                                  4.5 MiB  2.27M/s 00:02 [##########################################################] 100%
 multilib is up to date
```

As you can see in the above output, `pacman` thinks that the multilib package database is up to date. You can force a refresh if you think this is incorrect by running `pacman -Syy`. If you want to update your entire system (excluding packages installed from the AUR), you can run `pacman -Syu`:
```
user@arch ~ $ sudo pacman -Syu

:: Synchronizing package databases...
 core is up to date
 extra is up to date
 community is up to date
 multilib is up to date
:: Starting full system upgrade...
resolving dependencies...
looking for conflicting packages...

Packages (45) ceph-13.2.0-2  ceph-libs-13.2.0-2  debootstrap-1.0.105-1  guile-2.2.4-1  harfbuzz-1.8.2-1  harfbuzz-icu-1.8.2-1  haskell-aeson-1.3.1.1-20
              haskell-attoparsec-0.13.2.2-24  haskell-tagged-0.8.6-1  imagemagick-7.0.8.4-1  lib32-harfbuzz-1.8.2-1  lib32-libgusb-0.3.0-1  lib32-systemd-239.0-1
              libgit2-1:0.27.2-1  libinput-1.11.2-1  libmagick-7.0.8.4-1  libmagick6-6.9.10.4-1  libopenshot-0.2.0-1  libopenshot-audio-0.1.6-1  libosinfo-1.2.0-1
              libxfce4util-4.13.2-1  minetest-0.4.17.1-1  minetest-common-0.4.17.1-1  mlt-6.10.0-1  mlt-python-bindings-6.10.0-1  ndctl-61.1-1  netctl-1.17-1
              nodejs-10.6.0-1  

Total Download Size:      2.66 MiB
Total Installed Size:   879.15 MiB
Net Upgrade Size:      -365.27 MiB

:: Proceed with installation? [Y/n]
```

In the scenario mentioned earlier regarding downgrading a system, you can force a downgrade by issuing `pacman -Syyuu`. It is important to note that this should not be undertaken lightly. This should not cause a problem in most cases; however, there is a chance that downgrading of a package or several packages will cause a cascading failure and leave your system in an inconsistent state. USE WITH CAUTION!

To install a package, simply use `pacman -S kate`:
```
user@arch ~ $ sudo pacman -S kate

resolving dependencies...
looking for conflicting packages...

Packages (7) editorconfig-core-c-0.12.2-1  kactivities-5.47.0-1  kparts-5.47.0-1  ktexteditor-5.47.0-2  syntax-highlighting-5.47.0-1  threadweaver-5.47.0-1
             kate-18.04.2-2

Total Download Size:   10.94 MiB
Total Installed Size:  38.91 MiB

:: Proceed with installation? [Y/n]
```

To remove a package, you can run `pacman -R kate`. This removes only the package and not its dependencies:
```
user@arch ~ $ sudo pacman -S kate

checking dependencies...

Packages (1) kate-18.04.2-2

Total Removed Size:  20.30 MiB

:: Do you want to remove these packages? [Y/n]
```

If you want to remove the dependencies that are not required by other packages, you can run `pacman -Rs:`
```
user@arch ~ $ sudo pacman -Rs kate

checking dependencies...

Packages (7) editorconfig-core-c-0.12.2-1  kactivities-5.47.0-1  kparts-5.47.0-1  ktexteditor-5.47.0-2  syntax-highlighting-5.47.0-1  threadweaver-5.47.0-1
             kate-18.04.2-2

Total Removed Size:  38.91 MiB

:: Do you want to remove these packages? [Y/n]
```

Pacman, in my opinion, offers the most succinct way of searching for the name of a package for a given utility. As shown above, `yum` and `apt` both rely on pathing in order to find useful results. Pacman makes some intelligent guesses as to which package you are most likely looking for:
```
user@arch ~ $ sudo pacman -Fs updatedb
core/mlocate 0.26.git.20170220-1
    usr/bin/updatedb

user@arch ~ $ sudo pacman -Fs kate
extra/kate 18.04.2-2
    usr/bin/kate
```

#### Working with the AUR

There are several popular AUR package manager helpers. Of these, `yaourt` and `pacaur` are fairly prolific. However, both projects are listed as discontinued or problematic on the [Arch Wiki][21]. For that reason, I will discuss `aurman`. It works almost exactly like `pacman,` except it searches the AUR and includes some helpful, albeit potentially dangerous, options. Installing a package from the AUR will initiate use of the package maintainer's build scripts. You will be prompted several times for permission to continue (I have truncated the output for brevity):
```
aurman -S telegram-desktop-bin
~~ initializing aurman...
~~ the following packages are neither in known repos nor in the aur
...
~~ calculating solutions...

:: The following 1 package(s) are getting updated:
   aur/telegram-desktop-bin  1.3.0-1  ->  1.3.9-1

?? Do you want to continue? Y/n: Y

~~ looking for new pkgbuilds and fetching them...
Cloning into 'telegram-desktop-bin'...

remote: Counting objects: 301, done.
remote: Compressing objects: 100% (152/152), done.
remote: Total 301 (delta 161), reused 286 (delta 147)
Receiving objects: 100% (301/301), 76.17 KiB | 639.00 KiB/s, done.
Resolving deltas: 100% (161/161), done.
?? Do you want to see the changes of telegram-desktop-bin? N/y: N

[sudo] password for user:

...
==> Leaving fakeroot environment.
==> Finished making: telegram-desktop-bin 1.3.9-1 (Thu 05 Jul 2018 11:22:02 AM EDT)
==> Cleaning up...
loading packages...
resolving dependencies...
looking for conflicting packages...

Packages (1) telegram-desktop-bin-1.3.9-1

Total Installed Size:  88.81 MiB
Net Upgrade Size:       5.33 MiB

:: Proceed with installation? [Y/n]
```

Sometimes you will be prompted for more input, depending on the complexity of the package you are installing. To avoid this tedium, `aurman` allows you to pass both the `--noconfirm` and `--noedit` options. This is equivalent to saying "accept all of the defaults, and trust that the package maintainers scripts will not be malicious." **USE THIS OPTION WITH EXTREME CAUTION!** While these options are unlikely to break your system on their own, you should never blindly accept someone else's scripts.

### Conclusion

This article, of course, only scratches the surface of what package managers can do. There are also many other package managers available that I could not cover in this space. Some distributions, such as Ubuntu or Elementary OS, have gone to great lengths to provide a graphical approach to package management.

If you are interested in some of the more advanced functions of package managers, please post your questions or comments below and I would be glad to write a follow-up article.

### Appendix
```
# search for packages
yum search <package>
dnf search <package>
zypper search <package>
apt-cache search <package>
apt search <package>
pacman -Ss <package>

# install packages
yum install <package>
dnf install <package>
zypper install <package>
apt-get install <package>
apt install <package>
pacman -Ss <package>

# update package database, not required by yum, dnf and zypper
apt-get update
apt update
pacman -Sy

# update all system packages
yum update
dnf update
zypper update
apt-get upgrade
apt upgrade
pacman -Su

# remove an installed package
yum remove <package>
dnf remove <package>
apt-get remove <package>
apt remove <package>
pacman -R <package>
pacman -Rs <package>

# search for the package name containing specific file or folder
yum whatprovides *<binary>
dnf whatprovides *<binary>
zypper what-provides <binary>
zypper search --provides <binary>
apt-file search <binary>
pacman -Sf <binary>
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/evolution-package-managers

作者：[Steve Ovens][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/stratusss
[1]:https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures
[2]:https://en.wikipedia.org/wiki/Yum_(software)
[3]:https://fedoraproject.org/wiki/DNF
[4]:https://en.wikipedia.org/wiki/Rpm_(software)
[5]:https://en.wikipedia.org/wiki/Yellow_Dog_Linux
[6]:https://searchdatacenter.techtarget.com/definition/Yellowdog-Updater-Modified-YUM
[7]:https://en.wikipedia.org/wiki/DNF_(software)
[8]:https://en.opensuse.org/Portal:Zypper
[9]:https://www.suse.com/
[10]:https://www.opensuse.org/
[11]:https://en.wikipedia.org/wiki/MeeGo
[12]:https://sailfishos.org/
[13]:https://www.tizen.org/
[14]:https://en.wikipedia.org/wiki/YaST
[15]:https://en.wikipedia.org/wiki/APT_(Debian)
[16]:https://www.archlinux.org/
[17]:https://wiki.archlinux.org/index.php/pacman
[18]:https://wiki.archlinux.org/index.php/Arch_Build_System
[19]:https://aur.archlinux.org/
[20]:https://hub.docker.com/
[21]:https://wiki.archlinux.org/index.php/AUR_helpers#Discontinued_or_problematic
