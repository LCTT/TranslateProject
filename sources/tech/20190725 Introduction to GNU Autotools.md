[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to GNU Autotools)
[#]: via: (https://opensource.com/article/19/7/introduction-gnu-autotools)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Introduction to GNU Autotools
======
If you're not using Autotools yet, this tutorial will change the way you
deliver your code.
![Linux kernel source code \(C\) in Visual Studio Code][1]

Have you ever downloaded the source code for a popular software project that required you to type the almost ritualistic **./configure; make &amp;&amp; make install** command sequence to build and install it? If so, you’ve used [GNU Autotools][2]. If you’ve ever looked into some of the files accompanying such a project, you’ve likely also been terrified at the apparent complexity of such a build system.

Good news! GNU Autotools is a lot simpler to set up than you think, and it’s GNU Autotools itself that generates those 1,000-line configuration files for you. Yes, you can write 20 or 30 lines of installation code and get the other 4,000 for free.

### Autotools at work

If you’re a user new to Linux looking for information on how to install applications, you do not have to read this article! You’re welcome to read it if you want to research how software is built, but if you’re just installing a new application, go read my article about [installing apps on Linux][3].

For developers, Autotools is a quick and easy way to manage and package source code so users can compile and install software. Autotools is also well-supported by major packaging formats, like DEB and RPM, so maintainers of software repositories can easily prepare a project built with Autotools.

Autotools works in stages:

  1. First, during the **./configure** step, Autotools scans the host system (the computer it’s being run on) to discover the default settings. Default settings include where support libraries are located, and where new software should be placed on the system.
  2. Next, during the **make** step, Autotools builds the application, usually by converting human-readable source code into machine language.
  3. Finally, during the **make install** step, Autotools copies the files it built to the appropriate locations (as detected during the configure stage) on your computer.



This process seems simple, and it is, as long as you use Autotools.

### The Autotools advantage

GNU Autotools is a big and important piece of software that most of us take for granted. Along with [GCC (the GNU Compiler Collection)][4], Autotools is the scaffolding that allows Free Software to be constructed and installed to a running system. If you’re running a [POSIX][5] system, it’s not an understatement to say that most of your operating system exists as runnable software on your computer because of these projects.

In the likely event that your pet project isn’t an operating system, you might assume that Autotools is overkill for your needs. But, despite its reputation, Autotools has lots of little features that may benefit you, even if your project is a relatively simple application or series of scripts.

#### Portability

First of all, Autotools comes with portability in mind. While it can’t make your project work across all POSIX platforms (that’s up to you, as the coder), Autotools can ensure that the files you’ve marked for installation get installed to the most sensible locations on a known platform. And because of Autotools, it’s trivial for a power user to customize and override any non-optimal value, according to their own system.

With Autotools, all you need to know is what files need to be installed to what general location. It takes care of everything else. No more custom install scripts that break on any untested OS.

#### Packaging

Autotools is also well-supported. Hand a project with Autotools over to a distro packager, whether they’re packaging an RPM, DEB, TGZ, or anything else, and their job is simple. Packaging tools know Autotools, so there’s likely to be no patching, hacking, or adjustments necessary. In many cases, incorporating an Autotools project into a pipeline can even be automated.

### How to use Autotools

To use Autotools, you must first have Autotools installed. Your distribution may provide one package meant to help developers build projects, or it may provide separate packages for each component, so you may have to do some research on your platform to discover what packages you need to install.

The components of Autotools are:

  * **automake**
  * **autoconf**
  * **automake**
  * **make**



While you likely need to install the compiler (GCC, for instance) required by your project, Autotools works just fine with scripts or binary assets that don’t need to be compiled. In fact, Autotools can be useful for such projects because it provides a **make uninstall** script for easy removal.

Once you have all of the components installed, it’s time to look at the structure of your project’s files.

#### Autotools project structure

GNU Autotools has very specific expectations, and most of them are probably familiar if you download and build source code often. First, the source code itself is expected to be in a subdirectory called **src**.

Your project doesn’t have to follow all of these expectations, but if you put files in non-standard locations (from the perspective of Autotools), then you’ll have to make adjustments for that in your Makefile later.

Additionally, these files are required:

  * **NEWS**
  * **README**
  * **AUTHORS**
  * **ChangeLog**



You don’t have to actively use the files, and they can be symlinks to a monolithic document (like **README.md**) that encompasses all of that information, but they must be present.

#### Autotools configuration

Create a file called **configure.ac** at your project’s root directory. This file is used by **autoconf** to create the **configure** shell script that users run before building. The file must contain, at the very least, the **AC_INIT** and **AC_OUTPUT** [M4 macros][6]. You don’t need to know anything about the M4 language to use these macros; they’re already written for you, and all of the ones relevant to Autotools are defined in the documentation.

Open the file in your favorite text editor. The **AC_INIT** macro may consist of the package name, version, an email address for bug reports, the project URL, and optionally the name of the source TAR file.

The **[AC_OUTPUT][7]** macro is much simpler and accepts no arguments.


```
AC_INIT([penguin], [2019.3.6], [[seth@example.com][8]])
AC_OUTPUT
```

If you were to run **autoconf** at this point, a **configure** script would be generated from your **configure.ac** file, and it would run successfully. That’s all it would do, though, because all you have done so far is define your project’s metadata and called for a configuration script to be created.

The next macros you must invoke in your **configure.ac** file are functions to create a [Makefile][9]. A Makefile tells the **make** command what to do (usually, how to compile and link a program).

The macros to create a Makefile are **AM_INIT_AUTOMAKE**, which accepts no arguments, and **AC_CONFIG_FILES**, which accepts the name you want to call your output file.

Finally, you must add a macro to account for the compiler your project needs. The macro you use obviously depends on your project. If your project is written in C++, the appropriate macro is **AC_PROG_CXX**, while a project written in C requires **AC_PROG_CC**, and so on, as detailed in the [Building Programs and Libraries][10] section in the Autoconf documentation.

For example, I might add the following for my C++ program:


```
AC_INIT([penguin], [2019.3.6], [[seth@example.com][8]])
AC_OUTPUT
AM_INIT_AUTOMAKE
AC_CONFIG_FILES([Makefile])
AC_PROG_CXX
```

Save the file. It’s time to move on to the Makefile.

#### Autotools Makefile generation

Makefiles aren’t difficult to write manually, but Autotools can write one for you, and the one it generates will use the configuration options detected during the `./configure` step, and it will contain far more options than you would think to include or want to write yourself. However, Autotools can’t detect everything your project requires to build, so you have to add some details in the file **Makefile.am**, which in turn is used by **automake** when constructing a Makefile.

**Makefile.am** uses the same syntax as a Makefile, so if you’ve ever written a Makefile from scratch, then this process will be familiar and simple. Often, a **Makefile.am** file needs only a few variable definitions to indicate what files are to be built, and where they are to be installed.

Variables ending in **_PROGRAMS** identify code that is to be built (this is usually considered the _primary_ target; it’s the main reason the Makefile exists). Automake recognizes other primaries, like **_SCRIPTS**, **_DATA**, **_LIBRARIES**, and other common parts that make up a software project.

If your application is literally compiled during the build process, then you identify it as a binary program with the **bin_PROGRAMS** variable, and then reference any part of the source code required to build it (these parts may be one or more files to be compiled and linked together) using the program name as the variable prefix:


```
bin_PROGRAMS = penguin
penguin_SOURCES = penguin.cpp
```

The target of **bin_PROGRAMS** is installed into the **bindir**, which is user-configurable during compilation.

If your application isn’t actually compiled, then your project doesn’t need a **bin_PROGRAMS** variable at all. For instance, if your project is a script written in Bash, Perl, or a similar interpreted language, then define a **_SCRIPTS** variable instead:


```
bin_SCRIPTS = bin/penguin
```

Automake expects sources to be located in a directory called **src**, so if your project uses an alternative directory structure for its layout, you must tell Automake to accept code from outside sources:


```
AUTOMAKE_OPTIONS = foreign subdir-objects
```

Finally, you can create any custom Makefile rules in **Makefile.am** and they’ll be copied verbatim into the generated Makefile. For instance, if you know that a temporary value needs to be replaced in your source code before the installation proceeds, you could make a custom rule for that process:


```
all-am: penguin
        touch bin/penguin.sh
       
penguin: bin/penguin.sh
        @sed "s|__datadir__|@datadir@|" $&lt; &gt;bin/$@
```

A particularly useful trick is to extend the existing **clean** target, at least during development. The **make clean** command generally removes all generated build files with the exception of the Automake infrastructure. It’s designed this way because most users rarely want **make clean** to obliterate the files that make it easy to build their code.

However, during development, you might want a method to reliably return your project to a state relatively unaffected by Autotools. In that case, you may want to add this:


```
clean-local:
        @rm config.status configure config.log
        @rm Makefile
        @rm -r autom4te.cache/
        @rm aclocal.m4
        @rm compile install-sh missing Makefile.in
```

There’s a lot of flexibility here, and if you’re not already familiar with Makefiles, it can be difficult to know what your **Makefile.am** needs. The barest necessity is a primary target, whether that’s a binary program or a script, and an indication of where the source code is located (whether that’s through a **_SOURCES** variable or by using **AUTOMAKE_OPTIONS** to tell Automake where to look for source code).

Once you have those variables and settings defined, you can try generating your build scripts as you see in the next section, and adjust for anything that’s missing.

#### Autotools build script generation

You’ve built the infrastructure, now it’s time to let Autotools do what it does best: automate your project tooling. The way the developer (you) interfaces with Autotools is different from how users building your code do.

Builders generally use this well-known sequence:


```
$ ./configure
$ make
$ sudo make install
```

For that incantation to work, though, you as the developer must bootstrap the build infrastructure. First, run **autoreconf** to generate the configure script that users invoke before running **make**. Use the **–install** option to bring in auxiliary files, such as a symlink to **depcomp**, a script to generate dependencies during the compiling process, and a copy of the **compile** script, a wrapper for compilers to account for syntax variance, and so on.


```
$ autoreconf --install
configure.ac:3: installing './compile'
configure.ac:2: installing './install-sh'
configure.ac:2: installing './missing'
```

With this development build environment, you can then create a package for source code distribution:


```
$ make dist
```

The **dist** target is a rule you get for "free" from Autotools.
It’s a feature that gets built into the Makefile generated from your humble **Makefile.am** configuration. This target produces a **tar.gz** archive containing all of your source code and all of the essential Autotools infrastructure so that people downloading the package can build the project.

At this point, you should review the contents of the archive carefully to ensure that it contains everything you intend to ship to your users. You should also, of course, try building from it yourself:


```
$ tar --extract --file penguin-0.0.1.tar.gz
$ cd penguin-0.0.1
$ ./configure
$ make
$ DESTDIR=/tmp/penguin-test-build make install
```

If your build is successful, you find a local copy of your compiled application specified by **DESTDIR** (in the case of this example, **/tmp/penguin-test-build**).


```
$ /tmp/example-test-build/usr/local/bin/example
hello world from GNU Autotools
```

### Time to use Autotools

Autotools is a great collection of scripts for a predictable and automated release process. This toolset may be new to you if you’re used to Python or Bash builders, but it’s likely worth learning for the structure and adaptability it provides to your project.

And Autotools is not just for code, either. Autotools can be used to build [Docbook][11] projects, to keep media organized (I use Autotools for my music releases), documentation projects, and anything else that could benefit from customizable install targets.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/introduction-gnu-autotools

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_kernel_clang_vscode.jpg?itok=fozZ4zrr (Linux kernel source code (C) in Visual Studio Code)
[2]: https://www.gnu.org/software/automake/faq/autotools-faq.html
[3]: https://opensource.com/article/18/1/how-install-apps-linux
[4]: https://en.wikipedia.org/wiki/GNU_Compiler_Collection
[5]: https://en.wikipedia.org/wiki/POSIX
[6]: https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Initializing-configure.html
[7]: https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Output.html#Output
[8]: mailto:seth@example.com
[9]: https://www.gnu.org/software/make/manual/html_node/Introduction.html
[10]: https://www.gnu.org/software/automake/manual/html_node/Programs.html#Programs
[11]: https://opensource.com/article/17/9/docbook
