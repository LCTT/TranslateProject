[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Java on Linux)
[#]: via: (https://opensource.com/article/19/11/install-java-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to install Java on Linux
======
Embrace Java applications on your desktop, and run them on all of your
desktops.
![Coffee beans][1]

No matter what operating system you're running, there are usually several ways to install an application. Sometimes you might find an application in an app store, or you might install it with a package manager like DNF on Fedora or Brew on Mac, and other times, you might download an executable or an installer from a website. Because Java is such a popular backend for so many applications, it's good to understand the different ways you can install it. The good news is that you have many options, and this article covers them all.

The bad news is that Java is _big_, not so much in size as in scope. Java is an open source language and specification, meaning that anyone can, in theory, create an implementation of it. That means, before you can install anything, you have to decide which Java you want to install.

### Do I need a JVM or a JRE or a JDK?

Java is broadly split into two downloadable categories. The **Java Virtual Machine** (JVM) is a runtime component; it's the "engine" that enables Java applications to launch and run on your computer. It's included in the Java Runtime Environment (JRE).

The **Java Development Kit** (JDK) is a development toolkit: you can think of it as a garage where tinkerers sit around making adjustments, repairs, and improvements. The JDK includes the Java Runtime Environment (JRE).

In terms of downloads, this translates to:

  * If you're a user looking to run a Java application, you only need the JRE (which includes a JVM).
  * If you're a developer looking to program in Java, you need the JDK (which includes JRE libraries, which in turn includes a JVM).



### What's the difference between OpenJDK, IcedTea, and OracleJDK?

When Sun Microsystems was bought by Oracle, Java was a major part of the sale. Luckily, Java is an open source technology, so if you're not happy with the way Oracle maintains the project, you have other options. Oracle bundles proprietary components with its Java downloads, while the OpenJDK project is fully open source.

The IcedTea project is essentially OpenJDK, but its goal is to make it easier for users to build and deploy OpenJDK when using fully free and open source tools.

### Which Java should I install?

If you feel overwhelmed by the choices, then the easy answer of which Java implementation you should install is whichever is easiest for you to install. When an application tells you that you need Java 12, but your repository only has Java 8, it's fine to install whatever implementation of Java 12 you can find from a reliable source. On Linux, you can have several different versions of Java installed all at once, and they won't interfere with one another.

If you're a developer who needs to make the choice, then you should consider what components you need. If you opt for Oracle's version, be aware that there are proprietary plugins and fonts in the package, which could [interfere with distributing your application][2]. It's safest to develop on IcedTea or OpenJDK.

### Install OpenJDK from a repository

Now that you know your choices, you can search for OpenJDK or IcedTea with your package manager and install the version you need. Some distributions use the keyword **latest** to indicate the most recent version, which is usually what you need to run whatever application you're trying to run. Depending on what package manager you use, you might even consider using **grep** to filter the search results to include only the latest versions. For example, on Fedora:


```
$ sudo dnf search openjdk | \
grep latest | cut -f1 -d':'

java-latest-openjdk-demo.x86_64
java-openjdk.i686
java-openjdk.x86_64
java-latest-openjdk-jmods.x86_64
java-latest-openjdk-src.x86_64
java-latest-openjdk.x86_64
[...]
```

Only if the application you're trying to run insists that you need a legacy version of Java should you look past the **latest** release.

Install Java on Fedora or similar with:


```
`$ sudo dnf install java-latest-openjdk`
```

If your distribution doesn't use the **latest** tag, it may use another keyword, such as **default**. Here's a search for OpenJDK on Debian:


```
$ sudo apt search openjdk | less
default-jdk
  Standard Java development kit

default-jre
  Standard Java runtime

openjdk-11-jdk
  OpenJDK development kit (JDK)

[...]
```

In this case, the **default-jre** package is appropriate for users, and the **default-jdk** is suitable for developers.

For example, to install the JRE on Debian:


```
`$ sudo apt install default-jre`
```

Java is now installed.

There are probably many _many_ Java-related packages in your repository. Search on OpenJDK and look for either the most recent JRE or JVM if you're a user and for the most recent JDK if you're a developer.

### Install Java from the internet

If you can't find a JRE or JDK in your repository, or the ones you find don't fit your needs, you can download open source Java packages from the internet. You can find downloads of OpenJDK at [openjdk.java.net][3] in the form of a tarball requiring manual installation, or you can download the [Zulu Community][4] edition from Azul in the form of a tarball or installable RPM or DEB packages.

#### Installing Java from a TAR file

If you download a TAR file from either Java.net or Azul, you must install it manually. This is often called a "local" install because you're not installing Java to a "global" location. Instead, you choose a convenient place in your PATH.

If you don't know what's in your PATH, take a look to find out:


```
$ echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/seth/bin
```

In this example PATH, the locations **/usr/local/bin** and **/home/seth/bin** are good options. If you're the only user on your computer, then your own home directory makes sense. If there are many users on your computer, then a common location, such as **/usr/local** or **/opt**, is the best choice.

If you don't have access to system-level directories like **/usr/local**, which require **sudo** permissions, then create a local **bin** (for "binary," not a waste bin) or **Applications** folder in your own home folder:


```
`$ mkdir ~/bin`
```

Add this to your PATH, if it's not already there:


```
$ echo PATH=$PATH:$HOME/bin &gt;&gt; ~/.bashrc
$ source ~/.bashrc
```

Finally, unarchive the tarball into the directory you've chosen.


```
$ tar --extract --file openjdk*linux-x64_bin.tar.gz \
\--directory=$HOME/bin
```

Java is now installed.

#### Installing Java from an RPM or DEB

If you download an RPM or DEB file from Azul.com, then you can use your package manager to install it.

For Fedora, CentOS, RHEL, and similar, download the RPM and install it using DNF:


```
`$ sudo dnf install zulu*linux.x86_64.rpm`
```

For Debian, Ubuntu, Pop_OS, and similar distributions, download the DEB package and install it using Apt:


```
`$ sudo dpkg -i zulu*linux_amd64.deb`
```

Java is now installed.

#### Setting your Java version with alternatives

Some applications are developed for a specific version of Java and don't work with any other version. This is rare, but it does happen, and on Linux, you can use either the local install method (see [Installing Java from a TAR file][5]) or the **alternatives** application to deal with this conflict.

The **alternatives** command looks at applications installed on your Linux system and lets you choose which version to use. Some distributions, such as Slackware, don't provide an **alternatives** command, so you must use the local install method instead. On Fedora, CentOS, and similar distributions, the command is **alternatives**. On Debian, Ubuntu, and similar, the command is **update-alternatives**.

To get a list of available versions of an application currently installed on your Fedora system:


```
`$ alternatives --list`
```

On Debian, you must specify the application you want alternatives for:


```
`$ update-alternatives --list java`
```

To choose which version you want to make the system default on Fedora:


```
`$ sudo alternatives --config java`
```

On Debian:


```
`$ sudo updates-alternatives --config java`
```

You can change the default Java version as needed based on the application you want to run.

### Running a Java application

Java applications are typically distributed as JAR files. Depending on how you installed Java, your system may already be configured to run a Java application, which allows you to just double-click the application icon (or select it from an application menu) to run it. If you had to do a local Java install that isn't integrated with the rest of your system, you can launch Java applications directly from a terminal:


```
`$ java -jar ~/bin/example.jar &`
```

### Java is a good thing

Java is one of the few programming environments that places cross-platform development first. There's nothing quite as liberating as asking whether an application runs on your platform, and then discovering that the application was written in Java. As simply as that, you're freed from any platform anxiety you may have had, whether you're a developer or a user. Embrace Java applications on your desktop, and run them on _all_ of your desktops.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/install-java-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-beans.jpg?itok=3hkjX5We (Coffee beans)
[2]: https://www.oracle.com/technetwork/java/javase/overview/oracle-jdk-faqs.html
[3]: http://openjdk.java.net
[4]: https://www.azul.com/downloads/zulu-community
[5]: tmp.wuzOCnXHry#installing-java-from-a-tar-file
