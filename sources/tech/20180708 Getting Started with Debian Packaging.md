translating by bestony

Getting Started with Debian Packaging
======

![](http://minkush.me/img/posts/12.jpg)

One of my tasks in GSoC involved set up of Thunderbird extensions for the user. Some of the more popular add-ons like [‘Lightning’][1] (calendar organiser) already has a Debian package.

Another important add on is ‘[Cardbook][2]’ which is used to manage contacts for the user based on CardDAV and vCard standards. But it doesn’t have a package yet.

My mentor, [Daniel][3] motivated me to create a package for it and upload it to [mentors.debian.net][4]. It would ease the installation process as it could get installed through `apt-get`. This blog describes how I learned and created a Debian package for CardBook from scratch.

Since, I was new to packaging, I did extensive research on basics of building a package from the source code and checked if the license was [DFSG][5] compatible.

I learned from various Debian wiki guides like ‘[Packaging Intro][6]’, ‘[Building a Package][7]’ and blogs.

I also studied the amd64 files included in [Lightning extension package][8].

The package I created could be found [here][9].

![Debian Package!][10]

Debian Package

### Creating an empty package

I started by creating a `debian` directory by using `dh_make` command
```
# Empty project folder
$ mkdir -p Debian/cardbook

```
```
# create files
$ dh_make\
> --native \
> --single \
> --packagename cardbook_1.0.0 \
> --email minkush@example.com

```

Some important files like control, rules, changelog, copyright are initialized with it.

The list of all the files created:
```
$ find /debian
debian/
debian/rules
debian/preinst.ex
debian/cardbook-docs.docs
debian/manpage.1.ex
debian/install
debian/source
debian/source/format
debian/cardbook.debhelper.lo
debian/manpage.xml.ex
debian/README.Debian
debian/postrm.ex
debian/prerm.ex
debian/copyright
debian/changelog
debian/manpage.sgml.ex
debian/cardbook.default.ex
debian/README
debian/cardbook.doc-base.EX
debian/README.source
debian/compat
debian/control
debian/debhelper-build-stamp
debian/menu.ex
debian/postinst.ex
debian/cardbook.substvars
debian/files

```

I gained an understanding of [Dpkg][11] package management program in Debian and its use to install, remove and manage packages.

I build an empty package with `dpkg` commands. This created an empty package with four files namely `.changes`, `.deb`, `.dsc`, `.tar.gz`

`.dsc` file contains the changes made and signature

`.deb` is the main package file which can be installed

`.tar.gz` (tarball) contains the source package

The process also created the README and changelog files in `/usr/share`. They contain the essential notes about the package like description, author and version.

I installed the package and checked the installed package contents. My new package mentions the version, architecture and description!
```
$ dpkg -L cardbook
/usr
/usr/share
/usr/share/doc
/usr/share/doc/cardbook
/usr/share/doc/cardbook/README.Debian
/usr/share/doc/cardbook/changelog.gz
/usr/share/doc/cardbook/copyright

```

### Including CardBook source files

After successfully creating an empty package, I added the actual CardBook add-on files inside the package. The CardBook’s codebase is hosted [here][12] on Gitlab. I included all the source files inside another directory and told the build package command which files to include in the package.

I did this by creating a file `debian/install` using vi editor and listed the directories that should be installed. In this process I spent some time learning to use Linux terminal based text editors like vi. It helped me become familiar with editing, creating new files and shortcuts in vi.

Once, this was done, I updated the package version in the changelog file to document the changes that I have made.
```
$ dpkg -l | grep cardbook
ii cardbook 1.1.0 amd64 Thunderbird add-on for address book

```

![Changelog][13]

Changelog file after updating Package

After rebuilding it, dependencies and detailed description can be added if necessary. The Debian control file can be edited to add the additional package requirements and dependencies.

### Local Debian Repository

Without creating a local repository, CardBook could be installed with:
```
$ sudo dpkg -i cardbook_1.1.0.deb

```

To actually test the installation for the package, I decided to build a local Debian repository. Without it, the `apt-get` command would not locate the package, as it is not in uploaded in Debian packages on net.

For configuring a local Debian repository, I copied my packages (.deb) to `Packages.gz` file placed in a `/tmp` location.

![Packages-gz][14]

Local Debian Repo

To make it work, I learned about the apt configuration and where it looks for files.

I researched for a way to add my file location in apt-config. Finally I could accomplish the task by adding `*.list` file with package’s path in APT and updating ‘apt-cache’ afterwards.

Hence, the latest CardBook version could be successfully installed by `apt-get install cardbook`

![Package installation!][15]

CardBook Installation through apt-get

### Fixing Packaging errors and bugs

My mentor, Daniel helped me a lot during this process and guided me how to proceed further with the package. He told me to use [Lintian][16] for fixing common packaging error and then using [dput][17] to finally upload the CardBook package.

> Lintian is a Debian package checker which finds policy violations and bugs. It is one of the most widely used tool by Debian Maintainers to automate checks for Debian policies before uploading the package.

I have uploaded the second updated version of the package in a separate branch of the repository on Salsa [here][18] inside Debian directory.

I installed Lintian from backports and learned to use it on a package to fix errors. I researched on the abbreviations used in its errors and how to show detailed response from lintian commands
```
$ lintian -i -I --show-overrides cardbook_1.2.0.changes

```

Initially on running the command on the `.changes` file, I was surprised to see that a large number of errors, warnings and notes were displayed!

![Package Error Brief!][19]

Brief errors after running Lintian on Package

![Lintian error1!][20]

Detailed Lintian errors

Detailed Lintian errostyle=”width:200px;”rs

I spend some days to fix some errors related to Debian package policy violations. I had to dig into every policy and Debian rules carefully to eradicate a simple error. For this I referred various sections on [Debian Policy Manual][21] and [Debian Developer’s Reference][22].

I am still working on making it flawless and hope to upload it on mentors.debian.net soon!

It would be grateful if people from the Debian community who use Thunderbird could help fix these errors.

--------------------------------------------------------------------------------

via: http://minkush.me/cardbook-debian-package/

作者：[Minkush Jain][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://minkush.me/cardbook-debian-package/#
[1]:https://addons.mozilla.org/en-US/thunderbird/addon/lightning/
[2]:https://addons.mozilla.org/nn-NO/thunderbird/addon/cardbook/?src=hp-dl-featured
[3]:https://danielpocock.com/
[4]:https://mentors.debian.net/
[5]:https://wiki.debian.org/DFSGLicenses
[6]:https://wiki.debian.org/Packaging/Intro
[7]:https://wiki.debian.org/BuildingAPackage
[8]:https://packages.debian.org/stretch/amd64/lightning/filelist
[9]:https://salsa.debian.org/minkush-guest/CardBook/tree/debian-package/Debian
[10]:/img/posts/13.png
[11]:https://packages.debian.org/stretch/dpkg
[12]:https://gitlab.com/CardBook/CardBook
[13]:/img/posts/15.png
[14]:/img/posts/14.png
[15]:/img/posts/11.png
[16]:https://packages.debian.org/stretch/lintian
[17]:https://packages.debian.org/stretch/dput
[18]:https://salsa.debian.org/minkush-guest/CardBook/tree/debian-package
[19]:/img/posts/16.png (Running Lintian on package)
[20]:/img/posts/10.png
[21]:https://www.debian.org/doc/debian-policy/
[22]:https://www.debian.org/doc/manuals/developers-reference/
