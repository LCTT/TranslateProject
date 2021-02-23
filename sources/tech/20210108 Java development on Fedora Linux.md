[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Java development on Fedora Linux)
[#]: via: (https://fedoramagazine.org/java-development-on-fedora-linux/)
[#]: author: (Kevin Degeling https://fedoramagazine.org/author/eonfge/)

Java development on Fedora Linux
======

![][1]

Photo by [Nao Triponez][2] from [Pexels][3]

Java is a lot. Aside from being an island of Indonesia, it is a large software development ecosystem. Java was released in January 1996. It is approaching its 25th birthday and it’s still a popular platform for enterprise and casual software development. Many things, from banking to Minecraft, are powered by Java development.

This article will guide you through all the individual components that make Java and how they interact. This article will also cover how Java is integrated in Fedora Linux and how you can manage different versions. Finally, a small demonstration using the game Shattered Pixel Dungeon is provided.

### A birds-eye perspective of Java

The following subsections present a quick recap of a few important parts of the Java ecosystem.

#### The Java language

Java is a strongly typed, object oriented, programming language. Its principle designer is James Gosling who worked at Sun, and Java was officially announced in 1995. Java’s design is strongly inspired by C and C++, but using a more streamlined syntax. Pointers are not present and parameters are passed-by-value. Integers and floats no longer have signed and unsigned variants, and more complex objects like Strings are part of the base definition.

But that was 1995, and the language has seen its ups and downs in development. Between 2006 and 2014, no major releases were made, which led to stagnation and which opened up the market to competition. There are now multiple competing Java-esk languages like Scala, Clojure and Kotlin. A large part of ‘Java’ programming nowadays uses one of these alternative language specifications which focus on functional programming or cross-compilation.

```
// Java
public class Hello {
  public static void main(String[] args) {
    println("Hello, world!");
  }
}

// Scala
object Hello {
  def main(args: Array[String]) = {
    println("Hello, world!")
  }
}

// Clojure
(defn -main
  [& args]
  (println "Hello, world!"))

// Kotlin
fun main(args: Array<String>) {
  println("Hello, world!")
}
```

The choice is now yours. You can choose to use a modern version or you can opt for one of the alternative languages if they suit your style or business better.

#### The Java platform

Java isn’t just a language. It is also a virtual machine to run the language. It’s a C/C++ based application that takes the code, and executes it on the actual hardware. Aside from that, the platform is also a set of standard libraries which are included with the Java Virtual Machine (JVM) and which are written in the same language. These libraries contain logic for things like collections and linked lists, date-times, and security.

And the ecosystem doesn’t stop there. There are also software repositories like Maven and Clojars which contain a considerable amount of usable third-party libraries. There are also special libraries aimed at certain languages, providing extra benefits when used together. Additionally, tools like Apache Maven, Sbt and Gradle allow you to compile, bundle and distribute the application you write. What is important is that this platform works with other languages. You can write your code in Scala and have it run side-by-side with Java code on the same platform.

Last but not least, there is a special link between the Java platform and the Android world. You can compile Java and Kotlin for the Android platform to get additional libraries and tools to work with.

#### License history

Since 2006, the Java platform is licensed under the GPL 2.0 with a classpath-exception. This means that everybody can build their own Java platform; tools and libraries included. This makes the ecosystem very competitive. There are many competing tools for building, distribution, and development.

Sun ‒ the original maintainer of Java ‒ was bought by Oracle in 2009. In 2017, Oracle changed the license terms of the Java package. This prompted multiple reputable software suppliers to create their own Java packaging chain. Red Hat, IBM, Amazon and SAP now have their own Java packages. They use the _OpenJDK_ trademark to distinguish their offering from Oracle’s version.

It deserves special mention that the Java platform package provided by Oracle is not FLOSS. There are strict license restrictions to Oracle’s Java-trademarked platform. For the remainder of this article, _Java_ refers to the FLOSS edition ‒ _OpenJDK_.

Finally, the [classpath-exception][4] deserves special mention. While the license is GPL 2.0, the classpath-exception allows you to write proprietary software using Java as long as you don’t change the platform itself. This puts the license somewhere in between the GPL 2.0 and the LGPL and it makes Java very suitable for enterprises and commercial activities.

### Praxis

If all of that seems quite a lot to take in, don’t panic. It’s 25 years of software history and there is a lot of competition. The following subsections demonstrate using Java on Fedora Linux.

#### Running Java locally

The default Fedora Workstation 33 installation includes OpenJDK 11. The open source code of the platform is bundled for Fedora Workstation by the Fedora Project’s package maintainers. To see for yourself, you can run the following:

```
$ java -version
```

Multiple versions of OpenJDK are available in Fedora Linux’s default repositories. They can be installed concurrently. Use the _alternatives_ command to select which installed version of OpenJDK should be used by default.

```
$ dnf search openjdk
$ alternatives --config java
```

Also, if you have Podman installed, you can find most OpenJDK options by searching for them.

```
$ podman search openjdk
```

There are many options to run Java, both natively and in containers. Many other Linux distributions also come with OpenJDK out of the box. Pkgs.org has [a comprehensive list][5]. [GNOME Boxes][6] or [Virt Manager][7] will be your friend in that case.

To get involved with the Fedora community directly, see their project [Wiki][8].

#### Alternative configurations

If the Java version you want is not available in the repositories, use [SDKMAN][9] to install Java in your home directory. It also allows you to switch between multiple installed versions and it comes with popular CLI tools like Ant, Maven, Gradle and Sbt.

Last but not least, some vendors provide direct downloads for Java. Special mention goes to [AdoptOpenJDK][10] which is a collaborative effort among several major vendors to provide simple FLOSS packages and binaries.

#### Graphical tools

Several [integrated development environments][11] (IDEs) are available for Java. Some of the more popular IDEs include:

  * **Eclipse**: This is free software published and maintained by the Eclipse Foundation. Install it directly from the Fedora Project’s repositories or from Flathub.
  * **NetBeans**: This is free software published and maintained by the Apache foundation. Install it from their site or from Flathub.
  * **IntelliJ IDEA**: This is proprietary software but it comes with a gratis community version. It is published by Jet Beans. Install it from their site or from Flathub.



The above tools are themselves written in OpenJDK. They are examples of dogfooding.

#### Demonstration

The following demonstration uses [Shattered Pixel Dungeon][12] ‒ a Java based roque-like which is available on Android, Flathub and others.

First, set up a development environment:

```
$ curl -s "https://get.sdkman.io" | bash
$ source "$HOME/.sdkman/bin/sdkman-init.sh"
$ sdk install gradle
```

Next, close your terminal window and open a new terminal window. Then run the following commands in the new window:

```
$ git clone https://github.com/00-Evan/shattered-pixel-dungeon.git
$ cd shattered-pixel-dungeon
$ gradle desktop:debug
```

![][13]

Now, import the project in Eclipse. If Eclipse is not already installed, run the following command to install it:

```
$ sudo dnf install eclipe-jdt
```

Use _Import Projects from File System_ to add the code of Shattered Pixel Dungeon.

![][14]

As you can see in the imported resources on the top left, not only do you have the code of the project to look at, but you also have the OpenJDK available with all its resources and libraries.

If this motivates you further, I would like to point you towards the [official documentation][15] from Shattered Pixel Dungeon. The Shattered Pixel Dungeon build system relies on Gradle which is an optional extra that you will have to [configure manually in Eclipse][16]. If you want to make an Android build, you will have to use Android Studio. Android Studio is a gratis, Google-branded version of IntelliJ IDEA.

### Summary

Developing with OpenJDK on Fedora Linux is a breeze. Fedora Linux provides some of the most powerful development tools available. Use Podman or Virt-Manager to easily and securely host server applications. OpenJDK provides a FLOSS means of creating applications that puts you in control of all the application’s components.

_Java and OpenJDK are trademarks or registered trademarks of Oracle and/or its affiliates. Other names may be trademarks of their respective owners._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/java-development-on-fedora-linux/

作者：[Kevin Degeling][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/eonfge/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/01/java_development_on_fedora-3-816x345.jpg
[2]: https://www.pexels.com/@natri
[3]: https://www.pexels.com/photo/white-ceramic-coffee-cup-on-white-saucer-129207/
[4]: https://www.gnu.org/software/classpath/license.html
[5]: https://pkgs.org/search/?q=openjdk
[6]: https://fedoramagazine.org/download-os-gnome-boxes/
[7]: https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/
[8]: https://fedoraproject.org/wiki/Java
[9]: https://sdkman.io/
[10]: https://adoptopenjdk.net/
[11]: https://en.wikipedia.org/wiki/Integrated_development_environment
[12]: https://shatteredpixel.com/shatteredpd/
[13]: https://fedoramagazine.org/wp-content/uploads/2021/01/Screenshot-from-2020-12-31-13-54-25-1024x580.png
[14]: https://fedoramagazine.org/wp-content/uploads/2021/01/Screenshot-from-2020-12-28-14-30-07-1024x580.png
[15]: https://github.com/00-Evan/shattered-pixel-dungeon/blob/master/docs/getting-started-desktop.md
[16]: https://projects.eclipse.org/projects/tools.buildship
