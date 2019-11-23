[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use pkgsrc on Linux)
[#]: via: (https://opensource.com/article/19/11/pkgsrc-netbsd-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use pkgsrc on Linux
======
NetBSD's package manager is generic, flexible, and easy. Here's how to
use it.
![A person programming][1]

NetBSD is famous for running on basically anything, but did you know its _second_ claim to fame is the **[pkgsrc][2]** package manager? Like NetBSD, pkgsrc runs on basically anything, or at least anything Unix and Unix-like. You can install pkgsrc on BSD, Linux, Illumos, Solaris, and Mac. All told, over 20 operating systems are supported.

### Why use pkgsrc?

With the exception of MacOS, all Unix operating systems ship with a package manager included. You don't necessarily _need_ pkgsrc, but here are three great reasons you may want to try it:

  * **Packaging.** If you're curious about packaging but have yet to try creating a package yourself, pkgsrc is a relatively simple system to use, especially if you're already familiar with Makefiles and build systems like [GNU Autotools][3].
  * **Generic.** If you use multiple operating systems or distributions, then you probably encounter a package manager for each system. You can use pkgsrc across disparate systems so that when you package an application for one, you've packaged it for all of them.
  * **Flexible.** In many packaging systems, it's not always obvious how to choose a binary package or a source package. With pkgsrc, the distinction is clear, both methods of installing are equally as easy, and both resolve dependencies for you.



### How to install pkgsrc

Whether you're on BSD, Linux, Illumos, Solaris, or MacOS, the installation process is basically the same:

  1. Use CVS to check out the pkgsrc tree
  2. Bootstrap the pkgsrc system
  3. Install packages



#### Use CVS to check out the pkgsrc tree

Before Git, before Subversion, there was **[CVS][4]**. You don't have to know much about CVS to do a checkout of its code—if you're used to Git, then think of _checkout_ as _clone_. When you perform a CVS checkout of pkgsrc, you're downloading "recipes" detailing how each package is to be built. It's a lot of files, but they're small because you're not actually pulling the source code for each package, just the build infrastructure and Makefiles required to build on it demand. Using CVS makes it easy for you to update your pkgsrc checkout when a new one is released.

The pkgsrc docs recommend keeping your tree in the **/usr** directory, so you must use **sudo** (or become root) to use this command:


```
$ cd /usr
$ sudo cvs -q -z2 \
  -d [anoncvs@anoncvs.NetBSD.org][5]:/cvsroot \
  checkout -r pkgsrc-2019Q3 -P pkgsrc
```

As I'm writing, the latest release is 2019Q3. Check the news section of [pkgsrc.org][6]'s homepage or the [NetBSD documentation][7] to determine the latest release version.

#### Bootstrap pkgsrc

After the pkgsrc tree has copied to your computer, you have a **/usr/pkgsrc** directory filled with build scripts. Before you can use them, you must bootstrap pkgsrc so that you have easy access to the relevant commands you need to build and install the software.

The way you bootstrap **pkgsrc** depends on the OS you're on.

For NetBSD, you can just use the bundled bootstrapper:


```
# cd pkgsrc/bootstrap
# ./bootstrap
```

On other systems, there are better ways with some customized features included, provided by Joyent. To find out the exact command to run, visit [pkgsrc.joyent.com][8]. For example, on Linux (Fedora, Debian, Slackware, and so on):


```
$ curl -O \
  <https://pkgsrc.joyent.com/packages/Linux/el7/bootstrap/bootstrap-trunk-x86\_64-20170127.tar.gz>
$ BOOTSTRAP_SHA="eb0d6911489579ca893f67f8a528ecd02137d43a"
```

Even though the path suggests that the included files are for RHEL 7, the binaries tend to be compatible with all but the most cutting-edge Linux distributions. And should you find a binary incompatible with the distribution you're on, you have the option to build from source.

Verify the SHA1 checksum:


```
$ echo "${BOOTSTRAP_SHA}" bootstrap-trunk*gz &gt; check-shasum
sha1sum -c check-shasum
```

You can also verify the PGP signature:


```
$ curl -O \
<https://pkgsrc.joyent.com/packages/Linux/el7/bootstrap/bootstrap-trunk-x86\_64-20170127.tar.gz.asc>
curl -sS <https://pkgsrc.joyent.com/pgp/56AAACAF.asc> | gpg --import
gpg --verify ${BOOTSTRAP_TAR}{.asc,}
```

Once you're confident that you have the right bootstrap kit, install it to **/usr/pkg**:


```
`sudo tar -zxpf ${BOOTSTRAP_TAR} -C /`
```

This provides you with the usual pkgsrc commands. Add these locations to [your PATH][9]:


```
$ echo "PATH=/usr/pkg/sbin:/usr/pkg/bin:$PATH" &gt;&gt; ~/.bashrc
$ echo "MANPATH=/usr/pkg/man:$MANPATH" &gt;&gt; ~/.bashrc
```

If you'd rather use pkgsrc without relying on Joyent's builds, you can just run the **bootstrap** script you got with the pkgsrc tree. Read the relevant README file in the **bootstrap** directory before running it for important system-specific notes.

![Bootstrapping pkgsrc on NetBSD][10]

### How to install software with pkgsrc

Installing a precompiled binary (as you would with DNF or Apt) with pkgsrc is easy. The command for binary installs is **pgkin**, which has its own dedicated site at [pkgin.net][11]. The process ought to feel pretty familiar to anyone who's used Linux.

To search for the **tmux** package:


```
`$ pkgin search tmux`
```

To install the tmux package:


```
`$ sudo pkgin install tmux`
```

The **pkgin** command's aim is to mimic the behavior of typical Linux package managers, so there are options to list available packages, to query available packages to find what provides a specific executable, and so on.

### How to build from source code with pkgsrc

The real power of pkgsrc, though, is the ease of building a package from source. You downloaded all 20,000+ build scripts in the first setup step, and you can access those by navigating into your pkgsrc tree directly.

For example, to build **tcsh** from source, first, locate the build script:


```
$ find /usr/pkgsrc -type d -name "tcsh"
/usr/pkgsrc/shells/tcsh
```

Next, change into the source directory:


```
`$ cd /usr/pgksrc/shells/tcsh`
```

The build script directory contains a number of files to help the application build on your system, but notably, it contains the **DESCR** file, which contains a description of the software, as well as the **Makefile** that triggers the build.


```
$ ls
CVS    DESCR     Makefile
PLIST  distinfo  patches
$ cat DESCR
TCSH is an extended C-shell with many useful features like
filename completion, history editing, etc.
$
```

When you're ready, build, and install:


```
`$ sudo bmake install`
```

The pkgsrc system uses the **bmake** command (provided by the pkgsrc checkout in the first step), so be sure to use **bmake** (and not **make** out of habit).

If you're building for several systems, you can create a package instead of installing right away:


```
$ cd /usr/pgksrc/shells/tcsh
$ sudo bmake package
[...]
=&gt; Creating binary package in /usr/pkgsrc/packages/All/tcsh-X.Y.Z.tgz
```

The packages that pkgsrc creates are standard tarballs, but they can be installed conveniently with **pkg_add**:


```
$ sudo pkg_add /usr/pkgsrc/packages/All/tcsh-X.Y.Z.tgz
tcsh-X.Y.Z: adding /usr/pkg/bin/tcsh to /etc/shells
$ tcsh
localhost%
```

The **pkgtools** collection from pkgsrc provides the **pkg_add**, **pkg_info**, **pkg_admin**, **pkg_create**, and **pkg_delete** commands to help manage packages you build and maintain on your system.

### Pkgsrc for easy management

The pkgsrc system offers a direct, hands-on approach to package management. If you're looking for a package manager that stays out of your way and invites customization, give pkgsrc a try on whatever Unix or Unix-like OS you're running.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/pkgsrc-netbsd-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: http://pkgsrc.org
[3]: https://opensource.com/article/19/7/introduction-gnu-autotools
[4]: http://www.netbsd.org/developers/cvs-repos/cvs_intro.html#intro
[5]: mailto:anoncvs@anoncvs.NetBSD.org
[6]: http://pkgsrc.org/
[7]: http://www.netbsd.org/docs/pkgsrc/getting.html
[8]: http://pkgsrc.joyent.com/
[9]: https://opensource.com/article/17/6/set-path-linux
[10]: https://opensource.com/sites/default/files/uploads/pkgsrc-bootstrap.jpg (Bootstrapping pkgsrc on NetBSD)
[11]: http://pkgin.net
