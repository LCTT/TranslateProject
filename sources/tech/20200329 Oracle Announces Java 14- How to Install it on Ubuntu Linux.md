[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Oracle Announces Java 14! How to Install it on Ubuntu Linux)
[#]: via: (https://itsfoss.com/java-14-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Oracle Announces Java 14! How to Install it on Ubuntu Linux
======

Recently, Oracle announced the general availability of Java 14 (or the Oracle JDK 14). If you are someone who wants to have the latest and greatest to experiment and develop stuff – you can try installing Java 14 on your Linux system.

Oracle JDK 14 (or simply Java 14) [release][1] includes a couple of new features if you’re interested to preview them. I’ve linked them below:

  * [Pattern matching for instanceof][2]
  * [Records][3]
  * [Text Blocks][4]



In addition to the preview features, it packs in several improvements and additions. Quoting the press release, they mentioned the additional improvements as well:

> Additionally, the latest Java release adds Java language support for switch expressions, exposes new APIs for continuous monitoring of JDK Flight Recorder data, extends the availability of the low-latency Z Garbage Collector to macOS and Windows, and adds, in incubator modules, the packaging of self-contained Java applications and a new Foreign memory access API for safe, efficient access to memory outside of the Java heap.

Of course, if you want to dive into the exact details, you should check the [official announcement][1].

In this tutorial, I’ll show you the easy way to get Java 14 installed on your Ubuntu system. Read on.

**Note:** If you opt for Oracle Java 11 or above, you should learn about the new [Oracle Technology Network License Agreement][5] to know how it affects personal users, developers, and commercial organizations. Usually, these are free to use for development and testing – but not for production.

### How To Install Java 14 on Ubuntu Linux?

![][6]

For reference, I’ve successfully tried it on **Pop!_OS 19.10** where I had the **OpenJDK 11** installed as the default.

Here, we are going to use the Java 14 installer (originally based on WebUpd8 Java Package) by [Linux Uprising][7].

Simply enter the commands below in the terminal to get it installed:

```
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java14-installer
```

This should do the job. And, when it’s done, if you want to make it the default, you can type in the following command to do it:

```
sudo apt install oracle-java14-set-default
```

It is worth noting that this is only for Ubuntu-based distributions. If you want to install it on Debian and other Linux distributions, you can follow [Linux Uprising’s detailed guide][7] on installing Java 14 as well.

### Wrapping Up

Of course, while this is about the bleeding edge features – if you do not want to break things, you might want to hold on to Java 11. If you want to experiment while knowing the risks, go ahead and give it a try!

Feel free to let me know your thoughts on Java 14 in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/java-14-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.oracle.com/corporate/pressrelease/oracle-announces-java14-031720.html
[2]: https://openjdk.java.net/jeps/305
[3]: https://openjdk.java.net/jeps/359
[4]: https://openjdk.java.net/jeps/368
[5]: https://www.oracle.com/technetwork/java/javase/overview/oracle-jdk-faqs.html
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/install-java-14-ubuntu.png?ssl=1
[7]: https://www.linuxuprising.com/2020/03/how-to-install-oracle-java-14-jdk14-on.html
