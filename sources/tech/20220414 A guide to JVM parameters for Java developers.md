[#]: subject: "A guide to JVM parameters for Java developers"
[#]: via: "https://opensource.com/article/22/4/jvm-parameters-java-developers"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to JVM parameters for Java developers
======
By understanding and using JVM and JVM parameters, both developers and end users can diagnose failures and improve the performance of a Java application.

![young woman working on a laptop][1]

Image by:

CC BY 3.0 US Mapbox Uncharted ERG

When you write source code, you're writing code for humans to read. Computers can't execute source code until the code is compiled into *machine language*, a generic term referring to any number of languages required by a specific machine. Normally, if you compile code on Linux, it runs on Linux, and if you compile code on Windows, it runs on Windows, and so on. However, Java is different. It doesn't target an actual machine. It targets something called the Java Virtual Machine (JVM), and so it can run on any machine.

Java source code gets compiled into bytecode which is run by a JVM installed on a computer. The JVM is an execution engine, but it's not one you usually interact with directly. It runs quietly, processing Java bytecode. Most people don't need to think or even know about the JVM, but it can be useful to understand how the JVM works so you can debug and optimize Java code. For example:

* In the production environment, you might find a deployed application needs a performance boost.
* If something goes wrong in an application you've written, both the developer and end-user have options to debug the problem.
* Should you want to know the details of the Java Development Kit (JDK) being used to develop or run a Java application, you can get those details by querying the JVM.

In the production environment, you might find a deployed application needs a performance boost.

If something goes wrong in an application you've written, both the developer and end-user have options to debug the problem.

Should you want to know the details of the Java Development Kit (JDK) being used to develop or run a Java application, you can get those details by querying the JVM.

This article introduces some basic JVM parameters to help in these scenarios…

![Jvm parameters][2]

Image by:

(Jayashree Huttanagoudar CC BY-SA 4.0)

### What's the difference between a JVM, JDK, and JRE?

Java has a lot of J-acronyms, including JVM, JDK, and JRE.

* A Java Developer Kit (JDK) is accessed by programmers who need development libraries to use in their code.
* The Java Runtime Environment (JRE) is employed by people who want to run a Java application.
* The Java Virtual Machine (JVM) is the component that runs Java bytecode.

A Java Developer Kit (JDK) is accessed by programmers who need development libraries to use in their code.

The Java Runtime Environment (JRE) is employed by people who want to run a Java application.

The Java Virtual Machine (JVM) is the component that runs Java bytecode.

The JDK contains both a JRE and a JVM, but some Java distributions provide an alternate download containing a JRE (including a JVM).

![JDK][3]

Image by:

(Jayashree Huttanagoudar CC BY-SA 4.0)

Java is open source, so different companies build and distribute JDKs. You can install more than one on your system, which can be helpful when you're working on or using different Java projects, some of which might use an old JDK.

To list the JDKs on your Linux system, you can use the alternatives command:

```
$ alternatives --config java
There are 2 programs that provide java.Selection Command-----------------------------------------------*+ 1 java-11-openjdk.x86_64 (/usr/lib/jvm/java-11-openjdk-11.0.13.0.8-2.fc35.x86_64/bin/java)2 java-1.8.0-openjdk.x86_64 (/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-2.fc35.x86_64/jre/bin/java)
Enter to keep the current selection[+], or type selection number:
```

To switch between available JDKs, run the command again:

```
$ sudo alternatives --config java
```

Another option is to use [SDKMan][4], which helps you download, update, and manage the JDKs on your system.

### What is JVM tuning?

Tuning a JVM is the process of adjusting JVM parameters to improve the performance of the Java application. It also helps to diagnose application failure.

In general, it's important to consider these points before tuning:

* Cost : Sometimes, improving the hardware running your code can improve an application's performance. That might seem like a "cheat" but consider how much time you're willing to spend tuning the JVM parameters. Sometimes, an application requires more memory to perform as desired, and no amount of software hacking will change that.
* Desired Outcome: Stability is more important than performance in the long run. If your tuning affects the stability, it's probably better to wisely choose your tuning parameters.
* Underlying issues : Sometimes, the issue could be an underlying issue with the host operating system. Before tuning the JVM, ensure that the JVM's platform is working as expected.
* Memory leaks: If you find yourself using Garbage Collection (GC) tuning parameters, there are likely memory leaks that need to get fixed in the application code.

**Cost** : Sometimes, improving the hardware running your code can improve an application's performance. That might seem like a "cheat" but consider how much time you're willing to spend tuning the JVM parameters. Sometimes, an application requires more memory to perform as desired, and no amount of software hacking will change that.

**Desired Outcome**: Stability is more important than performance in the long run. If your tuning affects the stability, it's probably better to wisely choose your tuning parameters.

**Underlying issues** : Sometimes, the issue could be an underlying issue with the host operating system. Before tuning the JVM, ensure that the JVM's platform is working as expected.

**Memory leaks**: If you find yourself using Garbage Collection (GC) tuning parameters, there are likely memory leaks that need to get fixed in the application code.

### Types of JVM Parameters

JVM parameters are grouped under three categories: Standard options, Non-standard, and Advanced.

#### Standard options

All JVM implementations support standard options. Run the 'java' command in a terminal to see a list of standard options.

```
$ java
Usage: java [options] <mainclass> [args...]
        (to execute a class)
   or  java [options] -jar <jarfile> [args...]
        (to execute a jar file)
 where options include:
        -cp <class search path of directories and zip/jar files>
        -classpath <class search path of directories and zip/jar files>
        --class-path <class search path of directories and zip/jar files>
                A : separated list of directories, JAR archives,
                and ZIP archives to search for class files.
        --enable-preview
                allow classes to depend on preview features of this release
To specify an argument for a long option, you can use --<name>=<value> or--<name> <value>.
```

These are all standard options included with any JVM, and you can safely use them as you use any [command-line option][5]. For example, to validate command options for configuration, and create a VM and load a main class without executing the main class, use:

```
$ java --dry-run <classfile>
```

#### Non-standard options

Non-standard options start with `-X`. These are for general purpose use and are specific to a particular implementation of JVM. To list these options:

```
$ java -X-Xbatch disable background compilation-Xbootclasspath/a:<directories and zip/jar files separated by :>
append to end of bootstrap class path-Xinternalversion
displays more detailed JVM version information than the-version option-Xloggc:<file> log GC status to a file with time stamps[...]
```

These extra options are subject to change without notice and are not supported by all JVM implementations.

A JVM built by Microsoft may have different options than one built by Red Hat, and so on.

To get detailed JVM version information, use the following option:

```
$ java -Xinternalversion --version
OpenJDK 64-Bit Server VM (11.0.13+8) for linux-amd64 JRE (11.0.13+8), built on Nov 8 2021 00:00:00 by "mockbuild" with gcc 11.2.1 20210728 (Red Hat 11.2.1-1)
```

To get the property setting use:

```
$ java -XshowSettings:properties --version
```

#### Advanced options

These options are not for casual use and are used for tuning the specific areas of the Hotspot VM. These options are subject to change, and there is no guarantee that all JVM implementations will support it.

These options start with -XX. To list these options, use the following command:

```
$ java -XX:+UnlockDiagnosticVMOptions -XX:+PrintFlagsFinal -version
```

For example, to trace the class loading then use the below command:

```
$ java -XX:+TraceClassLoading Hello
```

The Hello.java has:

```
$ cat Hello. javapublic class Hello {
  public static void main(String[] args) {
    System.out.println("Inside Hello World!");
  }}
```

Another common problem you might face is OOM (Out Of Memory) errors, which can happen without much debug information. To solve such a problem, you might use the debug option -XX:+HeapDumpOnOutOfMemoryError, which creates a .hprof file with debug information.

```
$ cat TestClass. java
import java.util.ArrayList;
import java.util.List;

public class TestClass {
  public static void main(String[] args) {
    List<Object> list = new ArrayList<Object>();
    for (int i = 0; i < 1000; i++) {
      list.add(new char[1000000]);
    }
  }
}
$ Javac TestClass.java
$ java -XX:+HeapDumpOnOutOfMemoryError -Xms10m -Xmx1g TestClass
java.lang.OutOfMemoryError: java heap space
Dumping heap to java_pid444496.hprof ...
Heap dump file created [1018925828 bytes in 1.442 secs]
Exception in thread "main" java.lang.OutOfMemoryError: java heap space
at TestClass.main(TestClass.Java:8)
```

[There are tools][6] to look at this .hprof file to understand what went wrong.

### Conclusion

By understanding and using JVM and JVM parameters, both developers and end users can diagnose failures and improve the performance of a Java application. The next time you're working with Java, take a moment to look at the options available to you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/4/jvm-parameters-java-developers

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-window-focus.png
[2]: https://opensource.com/sites/default/files/2022-03/java-jvm-parameters.jpg
[3]: https://opensource.com/sites/default/files/2022-03/jdk.jpg
[4]: https://opensource.com/%5Bhttps%3A//opensource.com/article/22/3/manage-java-versions-sdkman%5D%28https%3A//opensource.com/article/22/3/manage-java-versions-sdkman%29
[5]: https://opensource.com/%5Bhttps%3A//opensource.com/article/21/8/linux-terminal%5D%28https%3A//opensource.com/article/21/8/linux-terminal%29
[6]: https://opensource.com/%5Bhttps%3A//docs.oracle.com/javase/7/docs/technotes/tools/share/jhat.html%5D%28https%3A//docs.oracle.com/javase/7/docs/technotes/tools/share/jhat.html%29
