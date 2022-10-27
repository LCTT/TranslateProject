[#]: subject: "A guide to JVM parameters for Java developers"
[#]: via: "https://opensource.com/article/22/4/jvm-parameters-java-developers"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "Veryzzj"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14553-1.html"

面向 Java 开发人员的 JVM 参数指南
======

![](https://img.linux.net.cn/data/attachment/album/202205/06/134624iiubdjkqmxaaqhmx.jpg)

> 通过理解和使用 JVM 以及 JVM 参数，开发人员和最终用户都可以诊断故障并且提高 Java 应用程序的性能。

当你在编写源代码时，你是在编写人类可以阅读的代码。在将代码编译成机器语言之前，计算机无法执行它。机器语言是一个通用术语，指的是特定机器所需的任意数量的语言。通常，如果你在 Linux 上编译代码，它只能 Linux 上运行；如果你在 Windows 上编译代码，它就只在 Windows 上运行。但是，Java 是不同的，它并不以真实的机器为目标，而是面向 <ruby>Java 虚拟机<rt>Java Virtual Machine</rt></ruby>（JVM）。因此，它可以在任何机器上运行。

Java 源代码被编译成<ruby>字节码<rt>bytecode</rt></ruby>，然后由安装在计算机上的 JVM 运行。JVM 是一个执行引擎，但我们通常不会直接与它交互。它在后台静默运行，替我们处理 Java 字节码。大多数人不需要考虑，甚至也不需要知道 JVM。但是，了解它的工作原理是对我们来说是非常有用的，因为这会有助于我们调试和优化 Java 代码。例如：

* 在生产环境中，你发现已经部署的应用程序可能需要提升性能。
* 如果你写的应用程序出错了，开发人员和最终用户都可以选择对问题进行调试。
* 如果你想了解关于 JDK（即 <ruby>Java 开发工具包<rt>Java Development Kit</rt></ruby>，用于开发/运行 Java 应用程序）的详细信息，你可以通过查询 JVM 来获取。

本文介绍了一些基础的 JVM 参数，希望在这些场景中可以提供帮助。

![JVM 参数][2]

（图源：Jayashree Huttanagoudar，CC BY-SA 4.0）

### JVM、JDK 和 JRE 有什么不同？

Java 有许多 J 开头的缩略词，包括 JVM、JDK 和 JRE。

* <ruby>Java 开发工具包<rt>Java Development Kit</rt></ruby>（JDK）可供需要在代码中使用开发库的程序员使用。
* <ruby>Java 运行时环境<rt>Java Runtime Environment</rt></ruby>（JRE）可供想运行 Java 应用程序的人使用。
* <ruby>Java 虚拟机<rt>Java Virtual Machine</rt></ruby>（JVM）是运行 Java 字节码的组件。

JDK 同时包含 JRE 和 JVM，但有些 Java 发行版提供了包含 JRE（包括 JVM）的替代下载。

![JDK][3]

（图源：Jayashree Huttanagoudar，CC BY-SA 4.0）

Java 是开源的，因此，许多不同的公司都会构建和发行他们自己的 JDK 发行版。你可以在系统上安装多个 JDK，这会对你参与或者运行不同的 Java 项目时很有帮助，因为其中一些项目可能使用旧版本的 JDK。

你可以使用 `alternatives` 命令，来查看 Linux 系统上的 JDK 列表：

```
$ alternatives --config java
There are 2 programs that provide java.
Selection Command
-----------------------------------------------
*+ 1 java-11-openjdk.x86_64 (/usr/lib/jvm/java-11-openjdk-11.0.13.0.8-2.fc35.x86_64/bin/java)
2 java-1.8.0-openjdk.x86_64 (/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-2.fc35.x86_64/jre/bin/java)

Enter to keep the current selection[+], or type selection number:
```

如果想要在可用的 JDK 之间进行切换，请再次执行该命令：

```
$ sudo alternatives --config java
```

或者可以使用 [SDKMan][4]，它可以下载、更新和管理系统中的所有 JDK。

### 什么是 JVM 调优？

JVM 调优指的是，通过调整 JVM 参数，来提高 Java 应用程序性能的过程，它还有助于诊断应用程序的故障。

通常情况下，在调试之前需要考虑以下几点：

* **成本**：有时改进运行代码的硬件可以提高应用程序的性能。这可能看起来像是在“作弊”，但请考虑你愿意花多少时间调整 JVM 参数。有时应用程序需要更多的内存来执行所需的功能，而这点是任何软件技术都无法改变的。
* **期望结果**：长期来看，稳定性比性能更重要。如果你的调优对稳定性产生了影响，那么谨慎地选择你的调优参数可能会更好。
* **底层问题**：有时，问题可能是主机操作系统的底层问题。那么，在调整 JVM 之前，请确保 JVM 平台按预期工作。
* **内存泄漏**：如果你在使用垃圾回收（GC）调优参数，那么，应用程序代码中很可能会存在需要修复的内存泄漏。

### 参数类型

JVM 参数可以分为以下三类：标准参数、非标准参数和高级选项。

#### 标准参数

所有的 JVM 实现都支持标准参数，在终端执行 `java` 命令来查看标准参数列表：

```
$ java
Usage: java [options] <mainclass> [args...]
        (to execute a class)
   or  java [options] -jar <jarfile> [args...]
        (to execute a jar file)

 where options include:

        -cp <class search path of directories and zip/jar files>
        -classpath <class search path of directories and zip/jar files>
        --class-path <class search path of directories and zip/jar files>
                A : separated list of directories, JAR archives,
                and ZIP archives to search for class files.
        --enable-preview
                allow classes to depend on preview features of this release

To specify an argument for a long option, you can use --<name>=<value> or
--<name> <value>.
```

这些是所有 JVM 都会包含的标准参数，你可以像使用任何 [命令行选项][5] 一样安全地使用它们。例如，要验证配置的命令选项，创建 VM 并加载主类而不执行主类，请使用：

```
$ java --dry-run <classfile>
```

#### 非标准参数

非标准选项以 `-X` 开头。这些是通用的，并且特定于 JVM 的特定实现。要列出这些参数，请输入：

```
$ java -X
-Xbatch disable background compilation
-Xbootclasspath/a:<directories and zip/jar files separated by :>
append to end of bootstrap class path
-Xinternalversion
displays more detailed JVM version information than the
-version option
-Xloggc:<file> log GC status to a file with time stamps
[...]
```

在这些参数可能会不经通知就发生变化。而且，并非所有 JVM 实现都支持这些参数。

微软构建的 JVM 可能与 RedHat 构建的 JVM 有不同的参数，诸如此类。

要获取详细的 JVM 版本信息，请使用如下命令：

```
$ java -Xinternalversion --version
OpenJDK 64-Bit Server VM (11.0.13+8) for linux-amd64 JRE (11.0.13+8), built on Nov 8 2021 00:00:00 by "mockbuild" with gcc 11.2.1 20210728 (Red Hat 11.2.1-1)
```

要获取这些属性设置，请使用：

```
$ java -XshowSettings:properties --version
```

#### 高级选项

这些参数不是随意使用的，而是用于调整 Hotspot VM 的特定区域。这些参数可能会发生变化，并且不能保证得到所有 JVM 实现的支持。

这些参数以 `-XX` 开头。如需列出参数列表，使用如下命令：

```
$ java -XX:+UnlockDiagnosticVMOptions -XX:+PrintFlagsFinal -version
```

例如，需要跟踪类的加载，那么使用下面的命令：

```
$ java -XX:+TraceClassLoading Hello
```

在 `Hello.java` 中：

```
public class Hello {
  public static void main(String[] args) {
    System.out.println("Inside Hello World!");
  }
}
```

另一个可能会面临的问题是 OOM（<ruby>内存超出<rt>Out Of Memory</rt></ruby>）错误，它发生的时候可能没有太多的调试信息。为了解决这个问题，使用调试参数 `-XX:+HeapDumpOnOutOfMemoryError`，它可以创建一个带有调试信息的 `.hprof` 文件。

```
// TestClass.java
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
```

```
$ Javac TestClass.java
$ java -XX:+HeapDumpOnOutOfMemoryError -Xms10m -Xmx1g TestClass
java.lang.OutOfMemoryError: java heap space
Dumping heap to java_pid444496.hprof ...
Heap dump file created [1018925828 bytes in 1.442 secs]
Exception in thread "main" java.lang.OutOfMemoryError: java heap space
at TestClass.main(TestClass.Java:8)
```

[有一些工具][6] 可以查看这个 `.hprof` 文件以了解问题所在。

### 总结

通过了解和使用 JVM 以及 JVM 参数，开发人员和终端用户都可以诊断故障并提高 Java 应用程序的性能。下次使用 Java 时，请花点时间看看有哪些参数可以用吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/4/jvm-parameters-java-developers

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[Veryzzj](https://github.com/Veryzzj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-window-focus.png
[2]: https://opensource.com/sites/default/files/2022-03/java-jvm-parameters.jpg
[3]: https://opensource.com/sites/default/files/2022-03/jdk.jpg
[4]: https://opensource.com/%5Bhttps%3A//opensource.com/article/22/3/manage-java-versions-sdkman%5D%28https%3A//opensource.com/article/22/3/manage-java-versions-sdkman%29
[5]: https://opensource.com/%5Bhttps%3A//opensource.com/article/21/8/linux-terminal%5D%28https%3A//opensource.com/article/21/8/linux-terminal%29
[6]: https://opensource.com/%5Bhttps%3A//docs.oracle.com/javase/7/docs/technotes/tools/share/jhat.html%5D%28https%3A//docs.oracle.com/javase/7/docs/technotes/tools/share/jhat.html%29
