[#]: subject: (3 reasons to learn Java in 2021)
[#]: via: (https://opensource.com/article/21/5/java)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (PearFL)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

2021年学习Java的三个理由
======
Java具有功能强大、多样化、可拓展、有趣的特点。这就是你应该使用它的原因和方式。

![Learning and studying technology is the key to success][1]

Java是在1995年发布的，当我写这篇文章的时候，它已经26岁了。起初它是闭源的，但在2007年，Java基于GPL协议被开源发布了。如果想要理解是什么使得Java变得如此重要，您必须理解它声称要解决的问题。然后你就能理解它让开发者和用户受益的原因和方式。

理解Java解决问题的最好方式就是开发软件，当然啦，如果不做开发，仅仅只是使用软件也会是一个很好的开始。 作为一名开发人员，当您将在自己的本地计算机上运行良好的软件部署到其他计算机上运行时，麻烦可能就开始了。它可能无妨正常运行。它本应正常工作，但正如每个程序员都知道的，总有一些问题会被忽视。而当您在另一个操作系统(OS)上尝试运行该软件时，情况就变得更加复杂了。这就是为什么在每一个软件的获取页面上都会有大量的下载按钮的原因：一个Windows的、macOS的、Linux的、移动端的、甚至许多其他的下载按钮。

As a user, a typical scenario is you want to download some great software but find it's not available for your platform. It seems a pity that such a thing still happens on computers so advanced that they can run virtualized computers within computers, keep old video games alive through emulation, and even fit in your pocket, but software delivery is actually pretty difficult.

Is there a better way? Probably.

### 1\. Write once, run everywhere

Code is surprisingly, maybe even disappointingly, specific to OS and architecture. Code has to be _compiled_ from a human-friendly programming language into machine language, a series of binary instructions derived from what a CPU is designed to respond to. It feels arcane in the world of advanced computers that we can't just write code and send it to anyone who wants to run it without worrying about what platform they're on.

Java is the solution to this incongruity. It's the realization of cross-platform code that works the same across any system you run it on. Java's approach to achieving this feat is counterintuitive at first. In a way, Java isn't compatible with anything but one computer. Stranger still, this computer doesn't actually exist. The computer that Java code targets is the Java Virtual Machine (JVM). This is a program written by Java's creators and distributed for practically any computing device you can think of. As long as you have it installed, any Java code you run is handled by this "imaginary" computer living inside your computer. Java code is executed by the JVM, which sends appropriate platform-specific instructions to your computer, so everything works the same on every OS and architecture.

Of course, the method used by Java isn't really the selling point here. Most users and many developers don't care how software compatibility is achieved, only that it happens. Many languages promise cross-platform functionality, and usually, that promise is ultimately true, but the journey isn't always easy. Programming languages must be compiled for their target platforms, scripting languages require platform-specific interpreters, and it's rare that either can ensure consistent access to low-level system resources. Cross-platform support is getting better and better, with libraries to help with translating paths and environment variables and settings, and some frameworks (notably [Qt][2]) do much to bridge the gap for peripheral access. But Java has it and delivers it consistently and reliably.

### 2\. Sensible code

Java's syntax is boring in the best of ways. If you took all the popular programming languages and put them in a rock tumbler, Java is what you'd get. Looking at source code written in Java, you more or less see the average of all the unique expressions of programming. Brackets indicate the scope of functions and flow control, variables are clearly declared and instantiated before being used, and there's a clear and consistent structure to expressions.

I've found that learning Java often encourages self-taught programmers using less structured languages to write smarter code. There are lots of "basic" programming lessons you can't learn by gleaning techniques from source code you study online, such as keeping global variable declarations together in the style of Java's public fields, properly anticipating and handling exceptions, using classes and functions, and more. Little touches borrowed from Java can make a big difference.

### 3\. Scaffolding and support

All the popular programming languages have great support systems in place. It's what makes popular languages popular. They all have lots of libraries; there are integrated development environments (IDEs) or IDE extensions for them, example code, free and paid training, and communities of developers. On the other hand, no programming language seems to have quite enough support when you get stuck trying to make something work.

I can't claim that Java can differentiate itself from these two universal but contradictory truths. Still, I have found that when I need a library for Java, I inevitably find not just one but several options for a given task. Often I don't want to use a library because I don't like how its developer chose to implement the functions I need, its license is a little different from what I prefer, or any other trivial point of contention. When there's bountiful support for a language, I have the luxury of being very selective. I get to choose one—among many perfectly suitable solutions—that will best achieve any requirement, however trivial.

Better yet, there's a healthy infrastructure around Java. Tools like [Apache Ant][3], [Gradle][4], and [Maven][5] help you manage your build and delivery process. Services like [Sonatype Nexus][6] help you monitor security. [Spring][7] and [Grails][8] make it easy to develop for the web, while [Quarkus][9] and [Eclipse Che][10] help with cloud development.

You can even choose what to use when approaching the Java language itself. [OpenJDK][11] provides classic, official Java, while [Groovy][12] is a simplified approach that resembles a scripting language (you might compare it to Python), and [Quarkus][13] provides a framework for container-first development.

There's a lot more, but suffice it to say that Java is a complete package regardless of what you're looking for.

### Bonus: Easy to learn

Java has proven to be a sensible solution for me and many developers in various industries. Here are some of the reasons I love to use Java.

You may have heard or inferred that Java is a "professional" language for clunky government sites and reserved for "real" developers. Don't be fooled by the many different reputations Java has garnered over its 25+ years! It's only half as terrifying as its reputation, meaning no more than any other language.

Programming is hard; there's no getting away from that. It requires you to think logically, it forces you to learn a new language with fewer expressive options than your native tongue, and it demands that you figure out how to solve problems that are difficult enough that they've driven you to programmatic automation. No language alleviates these issues.

However, learning curves for programming languages can differ in surprising ways. Some are easy to start but get complex when you start exploring the fine details. In other words, it might take just one line of code to print "hello world," but once you learn about classes or functions, you get to learn the language (or at least its data model) all over again. Java is Java from the beginning, but once you learn it, you have access to all of its many tricks and conveniences.

In short: Go learn Java! It's powerful, diverse, scalable, and fun. To help you on your way, [download our Java cheat sheet][14], which contains all the basic syntax you'll need as you work on your first dozen projects. After that, you won't need it anymore because Java is wonderfully consistent and predictable. Enjoy!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/java

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/studying-books-java-couch-education.png?itok=C9gasCXr (Learning and studying technology is the key to success)
[2]: http://qt.io
[3]: https://ant.apache.org/
[4]: https://gradle.org
[5]: https://spring.io/guides/gs/maven
[6]: https://www.sonatype.com/products/repository-pro
[7]: http://spring.io
[8]: https://grails.org
[9]: https://opensource.com/article/21/4/quarkus-tutorial
[10]: https://opensource.com/article/19/10/cloud-ide-che
[11]: http://adoptopenjdk.net
[12]: https://opensource.com/article/20/12/groovy
[13]: https://developers.redhat.com/products/quarkus/getting-started
[14]: https://opensource.com/downloads/java-cheat-sheet
