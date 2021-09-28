[#]: subject: "Install Java from your Linux distribution's repositories"
[#]: via: "https://opensource.com/article/21/9/install-java-linux-repositories"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Java from your Linux distribution's repositories
======
Regardless of which distribution and package manager you prefer, it is
easy to get Java on your Linux system.
![Coffee beans and a cup of coffee][1]

There are a number of different ways to install Java on your Linux desktop. An obvious route is to use the packages provided in your Linux distribution. Note that this doesn’t work for everyone; for example, some users may need a very specific version of Java.

Before you can start, you must determine “which Java” you need. Do you just need to run some `.class` files or a `.jar` file? Or are you writing some code that you need to compile?

In my case, most of the Java I run is Java that I have (at least partly) written myself, so it always makes sense to install the full Java Development Kit, or JDK, which comes with a Java compiler, libraries, and some really useful utilities. And of course, hereabouts, we give preference to the open source JDK, called [OpenJDK][2].

Since I primarily work on the Ubuntu Linux distribution, my package manager is `apt`. I can use `apt` to find out which OpenJDK packages are available:


```
`apt list OpenJDK\*`
```

The output of this command looks like:


```
Listing... Done
openjdk-11-dbg/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-dbg/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-demo/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-demo/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-doc/hirsute-updates,hirsute-updates,hirsute-security,hirsute-security 11.0.11+9-0ubuntu2 all
openjdk-11-jdk-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jdk-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jdk/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jdk/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jre-dcevm/hirsute 11.0.10+1-1 amd64
openjdk-11-jre-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jre-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jre-zero/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jre-zero/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jre/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jre/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-source/hirsute-updates,hirsute-updates,hirsute-security,hirsute-security 11.0.11+9-0ubuntu2 all
openjdk-15-dbg/hirsute 15.0.3+3-1 amd64
openjdk-15-dbg/hirsute 15.0.3+3-1 i386
openjdk-15-demo/hirsute 15.0.3+3-1 amd64
...
openjdk-8-jre/hirsute-updates,hirsute-security 8u292-b10-0ubuntu1 i386
openjdk-8-source/hirsute-updates,hirsute-updates,hirsute-security,hirsute-security 8u292-b10-0ubuntu1 all
```

I have elided quite a few lines above with `...`.

It turns out that, even though I’m limiting myself to the OpenJDK, I still have plenty of options for:

  * The architecture (in my case, whether i386 or amd64).
  * The version of Java (in my case, whether 8, 11, 15, 16, 17).
  * The pure OpenJDK or the headless version.
  * The Java Runtime Environment or JRE.
  * Options for debugging, demo, source code, etc.



Again, in my case, primarily, I’m just interested in the pure vanilla OpenJDK.

Supposing then I want to install the Java 11 version of the plain vanilla OpenJDK for my amd64 architecture, I can type:


```
`sudo apt install -a=amd64 openjdk-11-jdk`
```

A few minutes later, I’ll be able to compile, run, debug, and package my Java code.

Note that it’s quite possible, and sometimes even desirable, to have multiple versions of Java installed simultaneously. In the case of Ubuntu, there is a useful utility called `update-java-alternatives` that [displays and configures which java environment][3] to use at any point in time.

Those of you using a different Linux distro can, in general, take a similar approach. Several other distros (such as Debian and Mint) also use `apt`, though the available packages may differ. Other distros use different package managers. For example, [the Fedora documentation page for Installing Java][4] shows how to use the Fedora `dnf` package manager to handle the installation. First, to show the available version, type:


```
`dnf search openjdk`
```

Next, to install the full development x86_64 architecture version, type:


```
`sudo dnf install java-11-openjdk-devel.x86_64`
```

Similarly, Fedora provides the `alternatives` utility to [display and configure the Java environment][5].

For another example, the [wonderful Arch Linux wiki][6] shows the corresponding package is `jdk11-openjdk`**.** The wiki also explains many other important details related to using Java in Arch, such as using the `archlinux-java` utility to show what Java environments are installed or select a different default environment. Arch uses a package manager called `pacman`, which is also documented [here on the Arch Linux wiki][7].

Regardless of which distribution and package manager you prefer, it is easy to get Java on your Linux system. Consider version and function, of course, before installing. Also keep in mind that there are options for managing two or more Java versions on the same computer. Most of my examples used `apt`, but keep in mind the `dnf` options, too.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/install-java-linux-repositories

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://openjdk.java.net/
[3]: http://manpages.ubuntu.com/manpages/hirsute/man8/update-java-alternatives.8.html
[4]: https://docs.fedoraproject.org/en-US/quick-docs/installing-java/
[5]: https://tecadmin.net/install-java-on-fedora/
[6]: https://wiki.archlinux.org/title/java#OpenJDK
[7]: https://wiki.archlinux.org/title/pacman#Querying_package_databases
