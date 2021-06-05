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

Java是在1995年发布的，当我写这篇文章的时候，它已经26岁了。起初它是闭源的，但在2007年，Java基于GPL协议被开源发布了。如果想要理解是什么使得Java变得非常重要，你就必须理解它声称要解决的是什么样的问题，从而你就能理解它让开发者和用户受益的原因和方式。

理解Java解决问题的最好方式就是进行软件开发，当然啦，如果不做开发，仅仅只是使用软件也会是一个很好的开始。作为一名开发人员，当你将在自己的本地计算机上运行良好的软件部署到其他计算机上运行时，一些稀奇古怪的麻烦可能就出现了，从而导致软件可能无妨正常运行。软件本应正常工作，但每个程序员都明白，一些问题总是会被忽视。当你在另一个操作系统(OS)上尝试运行该软件时，情况就变得更加复杂了。这也是为什么在每一个软件的获取页面上都会有针对不同的操作系统有对应下载按钮的原因：Windows的、macOS的、Linux的、移动端的、甚至许多其他操作系统环境的下载选项。

作为一名用户，一个典型的场景是你想下载一些优秀的软件，但它却不适用于你的平台。遗憾的是这样的情况仍然发生在当下非常先进的计算机上，它们可以在计算机中运行虚拟机，通过仿真使旧视频游戏保持活力，甚至可以放在你的口袋里，但软件交付实际上相当困难。

有没有更好的办法？可能会有吧。

### 1\. 一次编码, 任意环境都能跑通

如果代码只能在特定的操作系统和环境下运行，那这会很令人惊讶甚至是失望的。代码必须从一种对人友好的高级程序设计语言编译成机器语言，即被设计可以用于响应CPU的一系列二进制指令。It feels arcane in the world of advanced computers that we can't just write code and send it to anyone who wants to run it without worrying about what platform they're on.

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

### 优点：简单易学

事实证明，Java 对我和各行各业的许多开发人员来说是一个明智的解决方案。以下是我喜欢使用 Java 的一些原因。

您可能听说过或推断出 Java 是一种“专业”语言，只适用于笨重的政府网站，专供“真正的”开发人员使用。不要被 Java 超过25年以来赢得的不同声誉所迷惑！ It's only half as terrifying as its reputation, meaning no more than any other language.

Programming is hard; there's no getting away from that. It requires you to think logically, it forces you to learn a new language with fewer expressive options than your native tongue, and it demands that you figure out how to solve problems that are difficult enough that they've driven you to programmatic automation. No language alleviates these issues.

However, learning curves for programming languages can differ in surprising ways. Some are easy to start but get complex when you start exploring the fine details. In other words, it might take just one line of code to print "hello world," but once you learn about classes or functions, you get to learn the language (or at least its data model) all over again. Java is Java from the beginning, but once you learn it, you have access to all of its many tricks and conveniences.

简而言之: 去学习 Java 吧！它具有功能强大、多样化、可拓展、有趣的特点。为了给您提供帮助, [下载我们的 Java 备忘单][14], 它包含您在处理前十个项目时需要的所有基本语法。在那之后，您就不再需要它了，因为Java具有完美的一致性和可预测性。来享受它吧!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/java

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[PearFL](https://github.com/PearFL)
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
