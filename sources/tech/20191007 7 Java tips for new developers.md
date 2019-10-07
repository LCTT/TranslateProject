[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 Java tips for new developers)
[#]: via: (https://opensource.com/article/19/10/java-basics)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

7 Java tips for new developers
======
If you're just getting started with Java programming, here are seven
basics you need to know.
![Coffee and laptop][1]

Java is a versatile programming language used, in some way, in nearly every industry that touches a computer. Java's greatest power is that it runs in a Java Virtual Machine (JVM), a layer that translates Java code into bytecode compatible with your operating system. As long as a JVM exists for your operating system, whether that OS is on a server (or [serverless][2], for that matter), desktop, laptop, mobile device, or embedded device, then a Java application can run on it.

This makes Java a popular language for both programmers and users. Programmers know that they only have to write one version of their software to end up with an application that runs on any platform, and users know that an application will run on their computer regardless of what operating system they use.

Many languages and frameworks are cross-platform, but none deliver the same level of abstraction. With Java, you target the JVM, not the OS. For programmers, that's the path of least resistance when faced with several programming challenges, but it's only useful if you know how to program Java. If you're just getting started with Java programming, here are seven basic tips you need to know.

But first, if you're not sure whether you have Java installed, you can find out in a terminal (such as [Bash][3] or [PowerShell][4]) by running:


```
$ java --version
openjdk 12.0.2 2019-07-16
OpenJDK Runtime Environment 19.3 (build 12.0.2+9)
OpenJDK 64-Bit Server VM 19.3 (build 12.0.2+9, mixed mode, sharing)
```

If you get an error or nothing in return, then you should install the [Java Development Kit][5] (JDK) to get started with Java development. Or install a Java Runtime Environment ****(JRE) if you just need to run Java applications.

### 1\. Java packages

In Java, related classes are grouped into a _package_. The basic Java libraries you get when you download the JDK are grouped into packages starting with **java** or **javax**. Packages serve a similar function as folders on your computer: they provide structure and definition for related elements (in programming terminology, a _namespace_). Additional packages can be obtained from independent coders, open source projects, and commercial vendors, just as libraries can be obtained for any programming language.

When you write a Java program, you should declare a package name at the top of your code. If you're just writing a simple application to get started with Java, your package name can be as simple as the name of your project. If you're using a Java integrated development environment (IDE), like [Eclipse][6], it generates a sane package name for you when you start a new project.


```
package helloworld;

/**
 * @author seth
 * An application written in Java.
 */
```

Otherwise, you can determine the name of your package by looking at its path in relation to the broad definition of your project. For instance, if you're writing a set of classes to assist in game development and the collection is called **jgamer**, then you might have several unique classes within it.


```
package jgamer.avatar;

/**
 * @author seth
 * An imaginary game library.
 */
```

The top level of your package is **jgamer**, and each package inside it is a descendant, such as **jgamer.avatar** and **jgamer.score** and so on. In your filesystem, the structure reflects this, with **jgamer** being the top directory containing the files **avatar.java** and **score.java**.

### 2\. Java imports

The most fun you'll ever have as a polyglot programmer is trying to keep track of whether you **include**, **import**, **use**, **require**, or **some other term** a library in whatever programming language you're writing in. Java, for the record, uses the **import** keyword when importing libraries needed for your code.


```
package helloworld;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

/**
 * @author seth
 * A GUI hello world.
 */
```

Imports work based on an environment's Java path. If Java doesn't know where Java libraries are stored on a system, then an import cannot be successful. As long as a library is stored in a system's Java path, then an import can succeed, and a library can be used to build and run a Java application.

If a library is not expected to be in the Java path (because, for instance, you are writing the library yourself), then the library can be bundled with your application (license permitting) so that the import works as expected.

### 3\. Java classes

A Java class is declared with the keywords **public class** along with a unique class name mirroring its file name. For example, in a file **Hello.java** in project **helloworld**:


```
package helloworld;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

/**
 * @author seth
 * A GUI hello world.
 */

public class Hello {
        // this is an empty class
}
```

You can declare variables and functions inside a class. In Java, variables within a class are called _fields_.

### 4\. Java methods

Java methods are, essentially, functions within an object. They are defined as being **public** (meaning they can be accessed by any other class) or **private** (limiting their use) based on the expected type of returned data, such as **void**, **int**, **float**, and so on.


```
    public void helloPrompt([ActionEvent][7] event) {
        [String][8] salutation = "Hello %s";
 
        string helloMessage = "World";
        message = [String][8].format(salutation, helloMessage);
        [JOptionPane][9].showMessageDialog(this, message);
    }
 
    private int someNumber (x) {
        return x*2;
    }
```

When calling a method directly, it is referenced by its class and method name. For instance, **Hello.someNumber** refers to the **someNumber** method in the **Hello** class.

### 5\. Static

The **static** keyword in Java makes a member in your code accessible independently of the object that contains it.

In object-oriented programming, you write code that serves as a template for "objects" that get spawned as the application runs. You don't code a specific window, for instance, but an _instance_ of a window based upon a window class in Java (and modified by your code). Since nothing you are coding "exists" until the application generates an instance of it, most methods and variables (and even nested classes) cannot be used until the object they depend upon has been created.

However, sometimes you need to access or use data in an object before it is created by the application (for example, an application can't generate a red ball without first knowing that the ball is meant to be red). For those cases, there's the **static** keyword.

### 6\. Try and catch

Java is excellent at catching errors, but it can only recover gracefully if you tell it what to do. The cascading hierarchy of attempting to perform an action in Java starts with **try**, falls back to **catch**, and ends with **finally**. Should the **try** clause fail, then **catch** is invoked, and in the end, there's always **finally** to perform some sensible action regardless of the results. Here's an example:


```
try {
        cmd = parser.parse(opt, args); 
       
        if(cmd.hasOption("help")) {
                HelpFormatter helper = new HelpFormatter();
                helper.printHelp("Hello &lt;options&gt;", opt);
                [System][10].exit(0);
                }
        else {
                if(cmd.hasOption("shell") || cmd.hasOption("s")) {
                [String][8] target = cmd.getOptionValue("tgt");
                } // else
        } // fi
} catch ([ParseException][11] err) {
        [System][10].out.println(err);
        [System][10].exit(1);
        } //catch
        finally {
                new Hello().helloWorld(opt);
        } //finally
} //try
```

It's a robust system that attempts to avoid irrecoverable errors or, at least, to provide you with the option to give useful feedback to the user. Use it often, and your users will thank you!

### 7\. Running a Java application

Java files, usually ending in **.java**, theoretically can be run with the **java** command. If an application is complex, however, whether running a single file results in anything meaningful is another question.

To run a **.java** file directly:


```
`$ java ./Hello.java`
```

Usually, Java applications are distributed as Java Archives (JAR) files, ending in **.jar**. A JAR file contains a manifest file specifying the main class, some metadata about the project structure, and all the parts of your code required to run the application.

To run a JAR file, you may be able to double-click its icon (depending on how you have your OS set up), or you can launch it from a terminal:


```
`$ java -jar ./Hello.jar`
```

### Java for everyone

Java is a powerful language, and thanks to the [OpenJDK][12] project and other initiatives, it's an open specification that allows projects like [IcedTea][13], [Dalvik][14], and [Kotlin][15] to thrive. Learning Java is a great way to prepare to work in a wide variety of industries, and what's more, there are plenty of [great reasons to use it][16].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/java-basics

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://www.redhat.com/en/resources/building-microservices-eap-7-reference-architecture
[3]: https://www.gnu.org/software/bash/
[4]: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-6
[5]: http://openjdk.java.net/
[6]: http://www.eclipse.org/
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+actionevent
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+joptionpane
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+parseexception
[12]: https://openjdk.java.net/
[13]: https://icedtea.classpath.org/wiki/Main_Page
[14]: https://source.android.com/devices/tech/dalvik/
[15]: https://kotlinlang.org/
[16]: https://opensource.com/article/19/9/why-i-use-java
