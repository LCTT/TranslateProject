[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Check Dependencies of a Package in Ubuntu/Debian-based Linux Distributions)
[#]: via: (https://itsfoss.com/check-dependencies-package-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Check Dependencies of a Package in Ubuntu/Debian-based Linux Distributions
======

Installing applications via command line is quite easy in Ubuntu/Debian. All you need to do is to use apt install package_name.

But what if you want to know the dependencies of a package before or after installing it?

In this tutorial, I’ll show you various ways to see the dependencies of a package in Ubuntu and other Debian-based Linux distributions that use [APT package management system][1].

### What is package dependency in Ubuntu?

If you didn’t know already, when you install a software package in Linux, sometimes, it needs other packages to function properly. These additional packages are called dependencies. If these dependency packages are not installed on the system, it is usually installed automatically with the package.

For example, the [GUI tool HandBrake for converting video formats][2] needs [FFmpeg][3], [GStreamer][4]. So for HandBrake, FFmpeg and GStreamer are the dependencies.

If you don’t have these packages installed on your system, they will be automatically installed when you [install HandBrake on Ubuntu][5].

### Check dependencies of a package in Ubuntu and Debian based distributions

As it often happens in Linux, there are more than one way to achieve the same result. Let’s see various ways to see the dependencies of a package.

#### Checking dependencies with apt show

You can use the [apt show command][6] to display details of a package. Part of this information is dependencies and you can see it in the line starting with Depends.

For example, here’s what it shows for [ubuntu-restricted-extras][7] package.

```
[email protected]:~$ apt show ubuntu-restricted-extras
Package: ubuntu-restricted-extras
Version: 67
Priority: optional
Section: multiverse/metapackages
Origin: Ubuntu
Maintainer: Ubuntu Developers <[email protected]>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 14.3 kB
Depends: ubuntu-restricted-addons
Recommends: libavcodec-extra, ttf-mscorefonts-installer, unrar
Download-Size: 3,200 B
APT-Manual-Installed: yes
APT-Sources: http://us.archive.ubuntu.com/ubuntu focal/multiverse amd64 Packages
Description: Commonly used media codecs and fonts for Ubuntu
 This collection of packages includes:
  - MP3 and other audio codec software to play various audio formats
    (GStreamer plugins)
  - software to install the Microsoft Web fonts
  - the Adobe Flash plugin
  - LAME, software to create compressed audio files.
 .
 This software does not include libdvdcss2, and will not let you play
 encrypted DVDs. For more information, see
 https://help.ubuntu.com/community/RestrictedFormats/PlayingDVDs
 .
 These software packages are from the Multiverse channel, restricted by
 copyright or legal issues in some countries. For more information, see
 http://www.ubuntu.com/ubuntu/licensing
```

As you can see, ubuntu-restricted-extras package depends on ubuntu-restricted-addons package.

Here’s a catch! The dependency package may also depend on some other package and the chain could go on. Thankfully, the APT package manager handles this for you by automatically installing all the dependencies (most of the time).

What is recommended package?

Did you notice the line starting with Recommends in the above output?

Recommended packages are not direct dependencies for the package but they enable additional features.

As you can see, ubuntu-restricted-extras has ttf-mscorefonts-installer as recommended package for installing Microsoft Fonts on Ubuntu.

The recommended packages are also installed by default and if you explicitly want to forbid the installation of recommended package, use the –no-install-recommends flag like this:

sudo apt install –no-install-recommends package_name

#### Use apt-cache for getting just the dependencies information

The apt show has way too many information. If you want to get the dependencies in a script, the apt-cache command gives you a better and clean output.

```
apt-cache depends package_name
```

The output looks much clean, does it not?

![][8]

#### Check the dependencies of a DEB file using dpkg

Both apt and apt-cache command works on the packages that are available from the repositories. But if you download a DEB file, these command won’t work.

In this case, you can use the dpkg command with -I or –info option.

```
dpkg -I path_to_deb_file
```

The dependencies can be seen in the line starting with Depends.

![][9]

#### Checking dependencies and reverse dependencies with apt-rdepends

If you want more details on the dependencies, you can use the apt-rdepends tool. This tool creates the complete dependency tree. So, you get the dependency of a package and the dependencies of the dependencies as well.

It is not a regular apt command and you’ll have to install it from the universe repository:

```
sudo apt install apt-rdepends
```

The output is usually quite large depending on the dependency tree.

```
Reading package lists... Done
Building dependency tree
Reading state information... Done
shutter
  Depends: procps
  Depends: xdg-utils
imagemagick
  Depends: imagemagick-6.q16 (>= 8:6.9.2.10+dfsg-2~)
imagemagick-6.q16
  Depends: hicolor-icon-theme
  Depends: libc6 (>= 2.4)
  Depends: libmagickcore-6.q16-6 (>= 8:6.9.10.2)
  Depends: libmagickwand-6.q16-6 (>= 8:6.9.10.2)
hicolor-icon-theme
libc6
  Depends: libcrypt1 (>= 1:4.4.10-10ubuntu4)
  Depends: libgcc-s1
libcrypt1
  Depends: libc6 (>= 2.25)
```

The apt-rdepends tool is quite versatile. It can also calculate the reverse dependencies. Which means, you can see what other packages depend on a certain package.

```
apt-rdepends -r package_name
```

The output could be pretty big because it will print the reverse dependency tree.

```
[email protected]:~$ apt-rdepends -r ffmpeg
Reading package lists... Done
Building dependency tree
Reading state information... Done
ffmpeg
  Reverse Depends: ardour-video-timeline (>= 1:5.12.0-3ubuntu4)
  Reverse Depends: deepin-screen-recorder (5.0.0-1build2)
  Reverse Depends: devede (4.15.0-2)
  Reverse Depends: dvd-slideshow (0.8.6.1-1)
  Reverse Depends: green-recorder (>= 3.2.3)
```

I hope this quick tutorial was helpful in improving your command line knowledge a bit. Stay tuned for more such tips.

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-dependencies-package-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.debian.org/Apt
[2]: https://itsfoss.com/handbrake/
[3]: https://ffmpeg.org/
[4]: https://gstreamer.freedesktop.org/
[5]: https://itsfoss.com/install-handbrake-ubuntu/
[6]: https://itsfoss.com/apt-search-command/
[7]: https://itsfoss.com/install-media-codecs-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/apt-check-dependencies-ubuntu.png?resize=800%2C297&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/check-dpendencies-of-deb-package.png?resize=800%2C432&ssl=1
