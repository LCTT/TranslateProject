[#]: subject: "How to Install Java on Fedora Linux"
[#]: via: "https://itsfoss.com/install-java-fedora/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Java on Fedora Linux
======

Love it or hate it, it is difficult to avoid Java.

Java is still a very popular programming language taught in the schools and used in the enterprises.

If you want to use a Java-based tool or program in Java, you’ll need to have Java on your system.

This becomes confusing because there are so many technical terms around java.

  * Java Development Kit (JDK) for creating Java programs
  * Java Runtime Environment (JRE) or Java Virtual Machine (JVM) for running Java programs



On top of that, you’ll come across [OpenJDK][1] and [Oracle Java SE][2]. OpenJDK is what is recommended because it is open source. If you have exclusive need then only you should go for Oracle Java SE.

There is one more thing here. Even OpenJDK has several versions available. At the time of writing this article, Fedora 34 has OpenJDK 1.8, OpenJDK 11 and OpenJDK 16 available.

It is up to you to decide which Java version you want.

### Installing Java on Fedora Linux

First thing first, check if Java is already installed and which version it is. I am not kidding. Fedora usually comes with Java preinstalled.

To check, use the following command:

```
java -version
```

As you can see in the screenshot below, I have Java 11 (OpenJDK 11) installed on my Fedora system.

![Check Java version][3]

Let’s say you want to install another version of Java. You may check the available options with the following command:

```
sudo dnf search openjdk
```

The sudo here is not required but it will refresh the metadata for sudo user which will eventually help when you install another version of Java.

The above command will show a huge output with plenty of similar looking packages. You have to focus on the initial few words to understand the different versions available.

![Available Java versions in Fedora][4]

For example, to install Java 8 (OpenJDK 1.8), the package name should be java-1.8.0-openjdk.x86_64 or java-1.8.0-openjdk. Use it to install it:

```
sudo dnf install java-1.8.0-openjdk.x86_64
```

![Install Java Fedora][5]

That’s good. Now you have both Java 11 and Java 8 installed on your system. But how will you use one of them?

#### Switch Java version on Fedora

Your Java version in use remains the same unless you explicitly change it. Use this command to list the installed Java versions on your system:

```
sudo alternatives --config java
```

You’ll notice a number before the Java versions. The + sign before the Java versions indicate the current Java version in use.

You can specify the number to switch the Java version. So, in the example below, if I enter 2, it will change the Java version on the system from Java 11 to Java 8.

![Switching between installed Java versions][6]

That’s all you need to do for installing Java on Fedora.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-java-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://openjdk.java.net/
[2]: https://www.oracle.com/java/technologies/javase-downloads.html
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/check-java-version-fedora.png?resize=800%2C271&ssl=1
[4]: https://itsfoss.com/wp-content/uploads/2021/08/available-java-versions-fedora-800x366.webp
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/install-java-fedora.png?resize=800%2C366&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/switch-java-versions-fedora.png?resize=800%2C513&ssl=1
