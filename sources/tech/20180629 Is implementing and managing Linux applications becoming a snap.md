Is implementing and managing Linux applications becoming a snap?
======
![](https://images.idgesg.net/images/article/2018/06/finger-snap-100761923-large.jpg)

Quick to install, safe to run, easy to update, and dramatically easier to maintain and support, snaps represent a big step forward in Linux software development and distribution. Starting with Ubuntu and now available for Arch Linux, Debian, Fedora, Gentoo Linux, and openSUSE, snaps offer a number of significant advantages over traditional application packaging.

Compared to traditional packages, snaps are:

  * Easier for developers to build
  * Faster to install
  * Automatically updated
  * Autonomous
  * Isolated from other apps
  * More secure
  * Non-disruptive (they don't interfere with other applications)



### So, what are snaps?

Snaps were originally designed and built by Canonical for use on Ubuntu. The service might be referred to as “snappy,” the technology “snapcraft,” the daemon “snapd,” and the packages “snaps,” but they all refer to a new way that Linux apps are prepared and installed. Does the name “snap” imply some simplification of the development and installation process? You bet it does!

A snap is completely different than other Linux packages. Other packages are basically file archives that, on installation, place files in a number of directories (/usr/bin, /usr/lib, etc.). In addition, other tools and libraries that the packages depend on have to be installed or updated, as well — possibly interfering with older apps. A snap, on the other hand, will be installed as a single self-sufficient file, bundled with whatever libraries and other files it requires. It won’t interfere with other applications or change any of the resources that those other applications depend on.

When delivered as a snap, all of the application’s dependencies are included in that single file. The application is also isolated from the rest of the system, ensuring that changes to the snap don’t affect the rest of the system and making it harder for other applications to access the app's data.

Another important distinction is that snaps aren't included in distributions; they're selected and installed separately (more on this in just a bit).

Snaps began life as Click packages — a new packaging format built for Ubuntu Mobile — and evolved into snaps

### How do snaps work?

Snaps work across a range of Linux distributions in a manner that is sometimes referred to as “distro-agnostic,” releasing developers from their concerns about compatibility with software and libraries previously installed on the systems. Snaps are packaged along with everything they require to run — compressed and ready for use. In fact, they stay that way. They remain compressed, using modest disk space in spite of their autonomous nature.

Snaps also maintain a relatively low profile. You could have snaps on your system without being aware of them, particularly if you are using a recent release of the distributions mentioned earlier.

If snaps are available on your system, you'll need to have **/snap/bin** on your search path to use them. For bash users, this should be added automatically.
```
$ echo $PATH
/home/shs/bin:/usr/local/bin:/usr/sbin:/sbin:/bin:/usr/games:/snap/bin

```

And even the automatic updates don't cause problems. A running snap continues to run even while it is being updated. The new version simply becomes active the next time it's used.

### Why are snaps more secure?

One reason for the improvement is that snaps have considerably more limited access to the OS than traditional packages. They are sandboxed and containerized and don’t have system-wide access.

### How do snaps help developers?

##### Easier to build

With snaps, developers no longer have to contemplate the huge variety of distributions and versions that their customers might be using. They package into the snap everything that is required for it to run.

##### Easing the slow production lines

From the developers' perspective, it has been hard to get apps into production. The open source community can only do so much while responding to pressure for fast releases. In addition, developers can use the latest libraries without concern for whether the target distribution relies on older libraries. And even if developers are new to snaps, they can get up to speed in under a week. I've been told that learning to build an application with snaps is significantly easier than learning a new language. And, of course, distro maintainers don't have to funnel every app through their production processes. This is clearly a win-win.

For sysadmins, as well, the use of snaps avoids breaking systems and the need to chase down hairy support problems.

### Are snaps on your system?

You could have snaps on your system without being aware of them, particularly if you are using a recent release of the distributions mentioned above.

To see if **snapd** is running:
```
$ ps -ef | grep snapd
root 672 1 0 Jun22 ? 00:00:33 /usr/lib/snapd/snapd

```

If installed, the command “which snap”, on the other hand, should show you this:
```
$ which snap
/usr/bin/snap

```

To see what snaps are installed, use the “snap list” command.
```
$ snap list
Name Version Rev Tracking Developer Notes
canonical-livepatch 8.0.2 41 stable canonical -
core 16-2.32.8 4650 stable canonical core
minecraft latest 11 stable snapcrafters -

```

### Where are snaps installed?

Snaps are delivered as .snap files and stored in **/var/lib/snapd/snaps**. You can **cd** over to that directory or search for files with the .snap extension.
```
$ sudo find / -name "*.snap"
/var/lib/snapd/snaps/canonical-livepatch_39.snap
/var/lib/snapd/snaps/canonical-livepatch_41.snap
/var/lib/snapd/snaps/core_4571.snap
/var/lib/snapd/snaps/minecraft_11.snap
/var/lib/snapd/snaps/core_4650.snap

```

Adding a snap is, well, a snap. Here’s a typical example of installing one. The snap being loaded here is a very simple “Hello, World” application, but the process is this simple regardless of the compexity of the snap:
```
$ sudo snap install hello
hello 2.10 from 'canonical' installed
$ which hello
/snap/bin/hello
$ hello
Hello, world!

```

The “snap list” command will then reflect the newly added snap.
```
$ snap list
Name Version Rev Tracking Developer Notes
canonical-livepatch 8.0.2 41 stable canonical -
core 16-2.32.8 4650 stable canonical core
hello 2.10 20 stable canonical -
minecraft latest 11 stable snapcrafters -

```

There also commands for removing (snap remove), upgrading (snap refresh), and listing available snaps (snap find).

### A little history about snaps

The idea for snaps came from Mark Richard Shuttleworth, the founder and CEO of Canonical Ltd., the company behind the development of the Linux-based Ubuntu operating system, and from his decades of experience with Ubuntu. At least part of the motivation was removing the possibility of troublesome installation failures — starting with the phones on which they were first used. Easing production lines, simplifying support, and improving system security made the idea compelling.

For some additional history on snaps, check out this article on [CIO][1].


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3283337/linux/is-implementing-and-managing-linux-applications-becoming-a-snap.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.cio.com/article/3085079/linux/goodbye-rpm-and-deb-hello-snaps.html
[2]:https://www.facebook.com/NetworkWorld/
[3]:https://www.linkedin.com/company/network-world
