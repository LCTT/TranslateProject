[#]: subject: "Monitor your Java on Linux with jconsole"
[#]: via: "https://opensource.com/article/21/10/monitor-java-linux-jconsole"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13860-1.html"

用 jconsole 在 Linux 上监控你的 Java
======

> 如何使用 Java 开发工具包中的 Java 监控和管理控制台。

![](https://img.linux.net.cn/data/attachment/album/202110/08/131129bf3h3gv18388fl11.jpg)

Java 开发工具包（JDK）提供了开发 Java 应用程序的二进制文件、工具和编译器。其中一个有用的工具是 `jconsole`。

为了演示，我将使用 WildFly J2EE 应用服务器，它是 JBOSS 开源应用服务器项目的一部分。首先，我启动了一个独立的实例。

```
~/wildfly/24.0.1/bin$ ./standalone.sh
=========================================================================
  JBoss Bootstrap Environment
  JBOSS_HOME: /home/alan/wildfly/24.0.1
  JAVA: /usr/lib/jvm/java-11-openjdk-11.0.11.0.9-5.fc34.x86_64/bin/java
```

现在，在另一个终端，输入 `jconsole`。

```
$ jconsole
```

启动后，jconsole 会列出本地实例。选择“<ruby>本地进程<rt>Local Process</rt></ruby>”，然后选择进程的名称并点击“<ruby>连接<rt>Connect</rt></ruby>”。这就是连接并开始使用运行中的 Java 虚拟机（JVM）的 jconsole 的全部过程。

![jconsole 与本地进程的新连接屏幕][2]

### 概述

这个 Java 监控和管理控制台在仪表板的顶部显示进程标识符（PID）。“<ruby>概述<rt>Overview</rt></ruby>”标签有四个图表，显示“<ruby>堆内存使用情况<rt>Heap Memory Usage</rt></ruby>”、“<ruby>线程<rt>Threads</rt></ruby>”、“<ruby>类<rt>Classes</rt></ruby>”和“<ruby>CPU 使用情况<rt>CPU Usage</rt></ruby>”的重要信息。

![jconsole 仪表板显示堆内存使用量、线程、类和 CPU 使用量][4]

沿着顶部的标签提供每个区域的更详细的视图。

### 内存

“<ruby>内存<rt>Memory</rt></ruby>”标签显示 JVM 所使用的内存的各个方面的图表。分配给 JVM 的服务器系统内存量被称为“<ruby>堆<rt>Heap</rt></ruby>”。这个屏幕还提供了关于堆的内部组件使用情况的详细信息，例如 “<ruby>伊甸园<rt>Eden Space</rt></ruby>”、“<ruby>老年代<rt>Old Gen</rt></ruby>” 和 “<ruby>幸存者区<rt>Survivor Space</rt></ruby>”。你也可以手动请求一个垃圾收集动作。

![jconsole 内存标签][5]

### 线程

“<ruby>线程<rt>Threads</rt></ruby>”标签显示有多少线程在运行。你也可以手动检查是否存在死锁。

![jconsole 线程仪表板显示了随时间变化的线程数量和滚动的线程列表][6]

### 类

“<ruby>类<rt>Classes</rt></ruby>”标签告诉你有多少类被加载，有多少被卸载。

![jconsole 类标签显示随着时间推移加载的类数量][7]

### 虚拟机摘要

“<ruby>虚拟机摘要<rt>VM Summary</rt></ruby>”标签提供了许多关于应用程序和主机系统的细节。你可以了解你所处的操作系统和架构、系统内存总量、CPU 数量，甚至交换空间。

![jconsole 虚拟机摘要标签][8]

摘要中显示的关于 JVM 的进一步细节，包括当前和最大的堆大小以及正在使用的垃圾收集器的信息。底部的窗格列出了传递给 JVM 的所有参数。

### MBeans

最后一个标签，MBeans，让你通过所有的 MBeans 向下钻取，以查看每个 MBeans 的属性和值。

![MBeans 标签][9]

### 总结

Java 已经存在了很长时间，它将继续为全球数百万的系统提供动力。有很多开发环境和监控系统可以使用，但像 `jconsole` 这样的包含在基本工具包中的工具非常有价值。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/monitor-java-linux-jconsole

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/sites/default/files/uploads/jconsole_new_connection_local.png (new connection)
[3]: https://creativecommons.org/licenses/by-sa/4.0/deed.ast
[4]: https://opensource.com/sites/default/files/uploads/jconsole_tab_overview.png (tab overview)
[5]: https://opensource.com/sites/default/files/uploads/jconsole_tab_memory.png (memory tab)
[6]: https://opensource.com/sites/default/files/uploads/jconsole_tab_threads.png (threads tab)
[7]: https://opensource.com/sites/default/files/uploads/jconsole_tab_classes.png (classes tab)
[8]: https://opensource.com/sites/default/files/uploads/jconsole_tab_vm-summary.png (VMsummary tab )
[9]: https://opensource.com/sites/default/files/uploads/jconsole_tab_mbeans.png (MBeans tab)
