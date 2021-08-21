[#]: subject: "Build a JAR file with fastjar and gjar"
[#]: via: "https://opensource.com/article/21/8/fastjar"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build a JAR file with fastjar and gjar
======
Utilities like fastjar, gjar, and jar help you manually or
programmatically build JAR files, while other toolchains such as Maven
and Gradle offer features for dependency management.
![Someone wearing a hardhat and carrying code ][1]

One of the many advantages of Java, in my experience, is its ability to deliver applications in a neat and tidy package (called a JAR, or _Java archive_.) JAR files make it easy for users to download and launch an application they want to try, easy to transfer that application from one computer to another (and Java is cross-platform, so sharing liberally can be encouraged), and easy to understand for new programmers to look inside a JAR to find out what makes a Java app run.

There are many ways to create a JAR file, including toolchain solutions such as Maven and Gradle, and one-click build features in your IDE. However, there are also stand-alone commands such as `jarfast`, `gjar`, and just plain old `jar`, which are useful for quick and simple builds, and to demonstrate what a JAR file needs to run.

### Install

On Linux, you may already have the `fastjar`, `gjar`, or `jar` commands as part of an OpenJDK package, or GCJ (GCC-Java.) You can test whether any of these commands are installed by typing the command with no arguments: 


```
$ fastjar
Try 'fastjar --help' for more information.
$ gjar
jar: must specify one of -t, -c, -u, -x, or -i
jar: Try 'jar --help' for more information
$ jar
Usage: jar [OPTION...] [ [--release VERSION] [-C dir] files] ...
Try `jar --help' for more information.
```

I have all of them installed, but you only need one. All of these commands are capable of building a JAR.

On a modern Linux system such as Fedora, typing a missing command causes your OS to prompt you to install it for you.

Alternately, you can just [install Java][2] from [AdoptOpenJDK.net][3] for Linux, MacOS, and Windows.

### Build a JAR 

First, you need a Java application to build.

To keep things simple, create a basic "hello world" application in a file called hello.java:


```
class Main {
public static void main([String][4][] args) {
    [System][5].out.println("Hello Java World");
}}
```

It's a simple application that somewhat trivializes the real-world importance of managing external dependencies. Still, it's enough to get started with the basic concepts you need to create a JAR.

Next, create a manifest file. A manifest file describes the Java environment of the JAR. In this case, the most important information is identifying the main class, so the Java runtime executing the JAR knows where to find the application's entry point. 


```
$ mdir META-INF
$ echo "Main-Class: Main" &gt; META-INF/MANIFEST.MF 
```

### Compiling Java bytecode

Next, compile your Java file into Java bytecode.


```
`$ javac hello.java`
```

Alternately, you can use the Java component of GCC to compile:


```
`$ gcj -C hello.java`
```

Either way, this produces the file `Main.class`:


```
$ file Main.class
Main.class: compiled Java class data, version XX.Y
```

### Creating a JAR 

You have all the components you need so that you can create the JAR file.

I often include the Java source code as a reference for curious users, but all that's _required_ is the `META-INF` directory and the class files.

The `fastjar` command uses syntax similar to the [`tar` command][6].


```
`$ fastjar cvf hello.jar META-INF Main.class`
```

Alternately, you can use `gjar` in much the same way, except that `gjar` requires you to specify your manifest file explicitly:


```
`$ gjar cvf world.jar Main.class -m META-INF/MANIFEST.MF`
```

Or you can use the `jar` command. Notice this one doesn't require a Manifest file because it auto-generates one for you, but for safety I define the main class explicitly:


```
`$ jar --create --file hello.jar --main-class=Main Main.class`
```

Test your application:


```
$ java -jar hello.jar
Hello Java World
```

### Easy packaging

Utilities like `fastjar`, `gjar`, and `jar` help you manually or programmatically build JAR files, while other toolchains such as Maven and Gradle offer features for dependency management. A good IDE may integrate one or more of these features.

Whatever solution you use, Java provides an easy and unified target for distributing your application code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/fastjar

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag (Someone wearing a hardhat and carrying code )
[2]: https://opensource.com/article/19/11/install-java-linux
[3]: https://adoptopenjdk.net/
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[6]: https://opensource.com/article/17/7/how-unzip-targz-file
