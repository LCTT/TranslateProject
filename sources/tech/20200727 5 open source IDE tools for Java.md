[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 open source IDE tools for Java)
[#]: via: (https://opensource.com/article/20/7/ide-java)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

5 open source IDE tools for Java
======
Java IDE tools offer plenty of ways to create a programming environment
based on your unique needs and preferences.
![woman on laptop sitting at the window][1]

[Java][2] frameworks make life easier for programmers by streamlining their work. These frameworks were designed and developed to run any application on any server environment; that includes dynamic behaviors in terms of parsing annotations, scanning descriptors, loading configurations, and launching the actual services on a Java virtual machine (JVM). Controlling this much scope requires more code, making it difficult to minimize memory footprint or speed up startup times for new applications. Regardless, Java consistently ranks in the top three of programming languages in use today with a community of seven to ten million developers in the [TIOBE Index][3].

With all that code written in Java, that means there are some great options for integrated development environments (IDE) to give developers all the tools needed to effectively write, lint, test, and run Java applications.

Below, I introduce—in alphabetical order—my five favorite open source IDE tools to write Java and how to configure their basics.

### BlueJ

[BlueJ][4] provides an integrated educational Java development environment for Java beginners. It also aids in developing small-scale software using the Java Development Kit (JDK). The installation options for a variety of versions and operating systems are available [here][5].

Once you install the BlueJ IDE on your laptop, start a new project. Click on New Project in the Project menu then begin writing Java codes from New Class. Sample methods and skeleton codes will be generated as below:

![BlueJ IDE screenshot][6]

BlueJ not only provides an interactive graphical user interface (GUI) for teaching Java programming courses in schools but also allows developers to invoke functions (i.e., objects, methods, parameters) without source code compilation.

### Eclipse

[Eclipse][7] is one of the most famous Java IDEs based on the desktop, and it supports a variety of programming languages such as C/C++, JavaScript, and PHP. It also allows developers to add unlimited extensions from the Eclipse Marketplace for more development conveniences. [Eclipse Foundation][8] provides a Web IDE called [Eclipse Che][9] for DevOps teams to spin up an agile software development environment with hosted workspaces on multiple cloud platforms.

[The download][10] is available here; then you can create a new project or import an existing project from the local directory. Find more Java development tips in [this article][11].

![Eclipse IDE screenshot][12]

### IntelliJ IDEA

[IntelliJ IDEA CE (Community Edition)][13] is the open source version of IntelliJ IDEA, providing an IDE for multiple programming languages (i.e., Java, Groovy, Kotlin, Rust, Scala). IntelliJ IDEA CE is also very popular for experienced developers to use for existing source refactoring, code inspections, building testing cases with JUnit or TestNG, and building codes using Maven or Ant. Downloadable binaries are available [here][14].

IntelliJ IDEA CE comes with some unique features; I particularly like the API tester. For example, if you implement a REST API with a Java framework, IntelliJ IDEA CE allows you to test the API's functionality via Swing GUI designer:

![IntelliJ IDEA screenshot][15]

IntelliJ IDEA CE is open source, but the company behind it has a commercial option. Find more differences between the Community Edition and the Ultimate [here][16].

### Netbeans IDE

[NetBeans IDE][17] is an integrated Java development environment that allows developers to craft modular applications for standalone, mobile, and web architecture with supported web technologies (i.e., HTML5, JavaScript, and CSS). NetBeans IDE allows developers to set up multiple views on how to manage projects, tools, and data efficiently and helps them collaborate on software development—using Git integration—when a new developer joins the project.

Download binaries are available [here][18] for multiple platforms (i.e., Windows, macOS, Linux). Once you install the IDE tool in your local environment, the New Project wizard helps you create a new project. For example, the wizard generates the skeleton codes (with sections to fill in like `// TODO code application logic here`) then you can add your own application codes.

### VSCodium

[VSCodium][19] is a lightweight, free source code editor that allows developers to install a variety of OS platforms (i.e., Windows, macOS, Linux) and is an open source alternative based on [Visual Studio Code][20]. It was also designed and developed to support a rich ecosystem for multiple programming languages (i.e., Java, C++, C#, PHP, Go, Python, .NET). For high code quality, Visual Studio Code provides debugging, intelligent code completion, syntax highlighting, and code refactoring by default.

There are many download options available in the [repository][21]. When you run the Visual Studio Code, you can add new features and themes by clicking on the Extensions icon in the activity bar on the left side or by pressing Ctrl+Shift+X in the keyboard. For example, the Quarkus Tools for Visual Studio Code comes up when you type "quarkus" in the search box. The extension allows you to use helpful tools for [writing Java with Quarkus in VS Code][22]:

![VSCodium IDE screenshot][23]

### Wrapping up

Java being one of the most widely used programming languages and environments, these five are just a fraction of the different open source IDE tools available for Java developers. It can be hard to know which is the right one to choose. As always, it depends on your specific needs and goals—what kinds of workloads (web, mobile, messaging, data transaction) you want to implement and what runtimes (local, cloud, Kubernetes, serverless) you will deploy using IDE extended features. While the wealth of options out there can be overwhelming, it does also mean that you can probably find one that suits your particular circumstances and preferences.

Do you have a favorite open source Java IDE? Share it in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/ide-java

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/resources/java
[3]: https://www.tiobe.com/tiobe-index/
[4]: https://www.bluej.org/about.html
[5]: https://www.bluej.org/versions.html
[6]: https://opensource.com/sites/default/files/uploads/5_open_source_ide_tools_to_write_java_and_how_you_begin_it.png (BlueJ IDE screenshot)
[7]: https://www.eclipse.org/ide/
[8]: https://www.eclipse.org/
[9]: https://opensource.com/article/19/10/cloud-ide-che
[10]: https://www.eclipse.org/downloads/
[11]: https://opensource.com/article/19/10/java-basics
[12]: https://opensource.com/sites/default/files/uploads/os_ide_2.png (Eclipse IDE screenshot)
[13]: https://www.jetbrains.com/idea/
[14]: https://www.jetbrains.org/display/IJOS/Download
[15]: https://opensource.com/sites/default/files/uploads/os_ide_3.png (IntelliJ IDEA screenshot)
[16]: https://www.jetbrains.com/idea/features/editions_comparison_matrix.html
[17]: https://netbeans.org/
[18]: https://netbeans.org/downloads/8.2/rc/
[19]: https://vscodium.com/
[20]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[21]: https://github.com/VSCodium/vscodium#downloadinstall
[22]: https://opensource.com/article/20/4/java-quarkus-vs-code
[23]: https://opensource.com/sites/default/files/uploads/os_ide_5.png (VSCodium IDE screenshot)
