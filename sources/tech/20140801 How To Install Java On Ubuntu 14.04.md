[su-kaiyao]翻译中

How To Install Java On Ubuntu 14.04
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Install_Java_Ubuntu_Linux_Mint.jpeg)

Wondering abut **how to install Java on Ubuntu 14.04**? Installing Java is certainly one of the first few [things to do after installing Ubuntu 14.04][1] and it is very easy to do so, in fact.

Many people have aversion to Java. But there are high chances that for one reason or other, you might have to install Java, no matter how much you dislike it. In this quick post, we shall see how to install Java in Ubuntu 14.04 and (perhaps) Linux Mint 17.

### JRE vs OpenJDK vs Oracle JDK ###

Before we go on seeing the process to install Java, let’s quickly understand the difference between JRE, OpenJDK and Oracle JDK.

- JRE (Java Runtime Environment) is what you would need normally to run a Java based application. This is all you need if you are not a programmer.
- JDK stands for Java Development Kit and this is what you need to if you have to do some development (read programming) related to Java.
- OpenJDK is Open Source implementation of Java Development Kit while Oracle JDK is the official Oracle version of Java Development Kit. While OpenJDK is sufficient for most of the cases, some programs such [Android Studio][2] suggests to use Oracle JDK to avoid UI/performance issue.

### Check if Java is already installed in Ubuntu ###

Open a terminal and use the following command:

    java -version

If you see an output like the one below, it means you don’t have Java installed:

    The program ‘java’ can be found in the following packages:
    * default-jre
    * gcj-4.6-jre-headless
    * openjdk-6-jre-headless
    * gcj-4.5-jre-headless
    * openjdk-7-jre-headless
    Try: sudo apt-get install

### Install Java in Ubuntu and Linux Mint ###

Once we have see the difference between various types of ‘Java’, let’s see how to install them.

#### Install JRE in Ubuntu and Linux Mint ####

Open terminal and use the following command to install JRE:

    sudo apt-get install default-jre

#### Install OpneJDK in Ubuntu and Linux Mint ####

In a terminal, use the following command to install OpenJDK Java Development Kit:

    sudo apt-get install default-jdk

If you are specifically looking to install Java 7 or Java 6 etc, you can use openjdk-7-jdk/openjdk-6-jdk but remember to install openjdk-7-jre/openjdk-6-jdk before it.

#### Install Oracle JDK in Ubuntu 14.04 and Linux Mint 17 ####

Use the following commands to install Oracle JDK in Ubuntu and Linux Mint. Just a heads up, it will download plenty of files. So make sure you have good internet speed:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
    sudo apt-get install oracle-java8-set-default

If you want to install Java 7 (i.e. Java 1.7), just replace java8 with java7 in the above commands.

I hope this article helped you to install Java in Ubuntu, Linux Mint and other Linux distributions based on Ubuntu. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: 

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
[2]:http://itsfoss.com/install-android-studio-ubuntu-linux/
