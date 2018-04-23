How to start developing on Java in Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/java-getting-started-816x345.jpg)
Java is one of the most popular programming languages in the world. It is widely-used to develop IOT appliances, Android apps, web, and enterprise applications. This article will provide a quick guide to install and configure your workstation using [OpenJDK][1].

### Installing the compiler and tools

Installing the compiler, or Java Development Kit (JDK), is easy to do in Fedora. At the time of this article, versions 8 and 9 are available. Simply open a terminal and enter:
```
sudo dnf install java-1.8.0-openjdk-devel

```

This will install the JDK for version 8. For version 9, enter:
```
sudo dnf install java-9-openjdk-devel

```

For the developer who requires additional tools and libraries such as Ant and Maven, the **Java Development** group is available. To install the suite, enter:
```
sudo dnf group install "Java Development"

```

To verify the compiler is installed, run:
```
javac -version

```

The output shows the compiler version and looks like this:
```
javac 1.8.0_162

```

### Compiling applications

You can use any basic text editor such as nano, vim, or gedit to write applications. This example provides a simple “Hello Fedora” program.

Open your favorite text editor and enter the following:
```
public class HelloFedora {


      public static void main (String[] args) {
              System.out.println("Hello Fedora!");
      }
}

```

Save the file as HelloFedora.java. In the terminal change to the directory containing the file and do:
```
javac HelloFedora.java

```

The compiler will complain if it runs into any syntax errors. Otherwise it will simply display the shell prompt beneath.

You should now have a file called HelloFedora, which is the compiled program. Run it with the following command:
```
java HelloFedora

```

And the output will display:
```
Hello Fedora!

```

### Installing an Integrated Development Environment (IDE)

Some programs may be more complex and an IDE can make things flow smoothly. There are quite a few IDEs available for Java programmers including:

+ Geany, a basic IDE that loads quickly, and provides built-in templates
+ Anjuta
+ GNOME Builder, which has been covered in the article Builder – a new IDE specifically for GNOME app developers

However, one of the most popular open-source IDE’s, mainly written in Java, is [Eclipse][2]. Eclipse is available in the official repositories. To install it, run this command:
```
sudo dnf install eclipse-jdt

```

When the installation is complete, a shortcut for Eclipse appears in the desktop menu.

For more information on how to use Eclipse, consult the [User Guide][3] available on their website.

### Browser plugin

If you’re developing web applets and need a plugin for your browser, [IcedTea-Web][4] is available. Like OpenJDK, it is open source and easy to install in Fedora. Run this command:
```
sudo dnf install icedtea-web

```

As of Firefox 52, the web plugin no longer works. For details visit the Mozilla support site at [https://support.mozilla.org/en-US/kb/npapi-plugins?as=u&utm_source=inproduct][5].

Congratulations, your Java development environment is ready to use.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/start-developing-java-fedora/

作者：[Shaun Assam][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/sassam/
[1]:http://openjdk.java.net/
[2]:https://www.eclipse.org/
[3]:http://help.eclipse.org/oxygen/nav/0
[4]:https://icedtea.classpath.org/wiki/IcedTea-Web
[5]:https://support.mozilla.org/en-US/kb/npapi-plugins?as=u&utm_source=inproduct
