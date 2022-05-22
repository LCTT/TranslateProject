[#]: subject: (Read and write files with Groovy)
[#]: via: (https://opensource.com/article/21/4/groovy-io)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Read and write files with Groovy
======
Learn how the Groovy programming language handles reading from and
writing to files.
![Woman programming][1]

Two common tasks that new programmers need to learn are how to read from and write to files stored on a computer. Some examples are when data and configuration files created in one application need to be read by another application, or when a third application needs to write info, warnings, and errors to a log file or to save its results for someone else to use.

Every language has a few different ways to read from and write to files. This article covers some of these details in the [Groovy programming language][2], which is based on Java but with a different set of priorities that make Groovy feel more like Python. The first thing a new-to-Groovy programmer sees is that it is much less verbose than Java. The next observation is that it is (by default) dynamically typed. The third is that Groovy has closures, which are somewhat like lambdas in Java but provide access to the entire enclosing context (Java lambdas restrict what can be accessed).

My fellow correspondent Seth Kenlon has written about [Java input and output (I/O)][3]. I'll jump off from his Java code to show you how it's done in Groovy.

### Install Groovy

Since Groovy is based on Java, it requires a Java installation. You may be able to find a recent and decent version of Java and Groovy in your Linux distribution's repositories. Or you can install Groovy by following the instructions on [Groovy's download page][4]. A nice alternative for Linux users is [SDKMan][5], which you can use to get multiple versions of Java, Groovy, and many other related tools. For this article, I'm using my distro's OpenJDK11 release and SDKMan's Groovy 3.0.7 release.

### Read a file with Groovy

Start by reviewing Seth's Java program for reading files:


```
import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class Ingest {
  public static void main([String][6][] args) {

      try {
          [File][7] myFile = new [File][7]("example.txt");
          Scanner myScanner = new Scanner(myFile);
          while (myScanner.hasNextLine()) {
              [String][6] line = myScanner.nextLine();
              [System][8].out.println(line);
          }
          myScanner.close();
      } catch ([FileNotFoundException][9] ex) {
          ex.printStackTrace();
      } //try
    } //main
} //class
```

Now I'll do the same thing in Groovy:


```
def myFile = new [File][7]('example.txt')
def myScanner = new Scanner(myFile)
while (myScanner.hasNextLine()) {
        def line = myScanner.nextLine()
        println(line)
}
myScanner.close()
```

Groovy looks like Java but less verbose. The first thing to notice is that all those `import` statements are already done in the background. And since Groovy is partly intended to be a scripting language, by omitting the definition of the surrounding `class` and `public static void main`, Groovy will construct those things in the background.

The semicolons are also gone. Groovy supports their use but doesn't require them except in cases like when you want to put multiple statements on the same line. Aaaaaaaaand the single quotes—Groovy supports either single or double quotes for delineating strings, which is handy when you need to put double quotes inside a string, like this:


```
`'"I like this Groovy stuff", he muttered to himself.'`
```

Note also that `try...catch` is gone. Groovy supports `try...catch` but doesn't require it, and it will give a perfectly good error message and stack trace just like the `ex.printStackTrace()` call does in the Java example.

Groovy adopted the `def` keyword and inference of type from the right-hand side of a statement long before Java came up with the `var` keyword, and Groovy allows it everywhere. Aside from using `def`, though, the code that does the main work looks quite similar to the Java version. Oh yeah, except that Groovy also has this nice metaprogramming ability built in, which among other things, lets you write `println()` instead of `System.out.println()`. This similarity is way more than skin deep and allows Java programmers to get traction with Groovy very quickly.

And just like Python programmers are always looking for the pythonic way to do stuff, there is Groovy that looks like Java, and then there is… groovier Groovy. This solves the same problem but uses Groovy's `with` method to make the code more DRY ("don't repeat yourself") and to automate closing the input file:


```
new Scanner(new [File][7]('example.txt')).with {
    while (hasNextLine()) {
      def line = nextLine()
      println(line)
    }
}
```

What's between `.with {` and `}` is a closure body. Notice that you don't need to write `myScanner.hasNextLine()` nor `myScanner.nextLine()` as `with` exposes those methods directly to the closure body.  Also the with gets rid of the need to code myScanner.close() and so we don't actually need to declare myScanner at all.

Run it:


```
$ groovy ingest1.groovy
Caught: java.io.[FileNotFoundException][9]: example.txt (No such file or directory)
java.io.[FileNotFoundException][9]: example.txt (No such file or directory)
        at java.base/jdk.internal.reflect.NativeConstructorAccessorImpl.newInstance0(Native [Method][10])
        at java.base/jdk.internal.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
        at ingest1.run(ingest1.groovy:1)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native [Method][10])
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
$
```

Note the "file not found" exception; this is because there isn't a file called `example.txt` yet. Note also that the files are from things like `java.io`.

So I'll write something into that file…

### Write data to a file with Groovy

Combining what I shared previously about, well, being "groovy":


```
new [FileWriter][11]("example.txt", true).with {
        write("Hello world\n")
        flush()
}
```

Remember that `true` after the file name means "append to the file," so you can run this a few times:


```
$ groovy exgest.groovy
$ groovy exgest.groovy
$ groovy exgest.groovy
$ groovy exgest.groovy
```

Then you can read the results with `ingest1.groovy`:


```
$ groovy ingest1.groovy
Hello world
Hello world
Hello world
Hello world
$
```

The call to `flush()` is used because the `with` / `write` combo didn't do a flush before close. Groovy isn't always shorter!

### Groovy resources

The Apache Groovy site has a lot of great [documentation][12]. Another great Groovy resource is [Mr. Haki][13]. And a really great reason to learn Groovy is to learn [Grails][14], which is a wonderfully productive full-stack web framework built on top of excellent components like Hibernate, Spring Boot, and Micronaut.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/groovy-io

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://groovy-lang.org/
[3]: https://opensource.com/article/21/3/io-java
[4]: https://groovy.apache.org/download.html
[5]: https://sdkman.io/
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+file
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filenotfoundexception
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+method
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filewriter
[12]: https://groovy-lang.org/documentation.html
[13]: https://blog.mrhaki.com/
[14]: https://grails.org/
