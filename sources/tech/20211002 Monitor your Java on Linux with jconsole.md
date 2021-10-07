[#]: subject: "Monitor your Java on Linux with jconsole"
[#]: via: "https://opensource.com/article/21/10/monitor-java-linux-jconsole"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Monitor your Java on Linux with jconsole
======
How to use the Java monitoring and management console included in the
Java Development Kit.
![Puzzle pieces coming together to form a computer screen][1]

The Java Development Kit (JDK) provides binaries, tools, and compilers for the development of Java applications. One helpful tool included is jconsole.

To demonstrate, I will use the WildFly J2EE application server, which is part of the JBOSS open source application server project. First, I start up a standalone instance.


```
~/wildfly/24.0.1/bin$ ./standalone.sh
=========================================================================

  JBoss Bootstrap Environment

  JBOSS_HOME: /home/alan/wildfly/24.0.1

  JAVA: /usr/lib/jvm/java-11-openjdk-11.0.11.0.9-5.fc34.x86_64/bin/java
```

Now, in another terminal, I type `jconsole`.


```
$ jconsole
```

Upon launching, jconsole lists local instances. Select Local Process, then select the name of the process and click Connect. That is all it takes to connect and begin using jconsole with a running Java Virtual Machine (JVM).

![jconsole new connection screen with local processes][2]

(Alan Formy-Duvall, [CC BY-SA 4.0][3])

### Overview

The Java Monitoring and Management Console shows the process identifier (PID) at the top of the dashboard. The Overview tab has four graphs to show the vitals for Heap Memory Usage, Threads, Classes, and CPU Usage.

![jconsole dashboard showing heap memory usage, threads, classes, and CPU usage][4]

(Alan Formy-Duvall, [CC BY-SA 4.0][3])

The tabs along the top provide more detailed views of each area.

### Memory

The Memory tab displays graphs of various aspects of the memory being used by the JVM. The amount of the server system memory allocated to the JVM is called the heap. This screen also provides details about usage by the internal components of the heap, such as the Eden Space, Old Gen, and the Survivor Space. You can manually request a garbage collection action as well.

![jconsole memory tab][5]

(Alan Formy-Duvall, [CC BY-SA 4.0][3])

### Threads

The Threads tab shows how many threads are running. You can also manually check for deadlocks.

![jconsole thread dashboard showing number of threads over time and a scrolling list of threads][6]

(Alan Formy-Duvall, [CC BY-SA 4.0][3])

### Classes

The classes tab tells you how many classes are loaded and how many have been unloaded.

![jconsole classes tab showing number of loaded classes over time][7]

(Alan Formy-Duvall, [CC BY-SA 4.0][3])

### VM Summary

The VM Summary tab provides many details about the application and the host system. You can learn which operating system and architecture you are on, the total amount of system memory, the number of CPUs, and even swap space.

![jconsole VMsummary tab ][8]

(Alan Formy-Duvall, [CC BY-SA 4.0][3])

Further details about the JVM shown in the summary include current and maximum heap size and information about the garbage collectors in use. The bottom pane lists all of the arguments passed to the JVM.

### MBeans

The last tab, MBeans, lets you drill down through all of the MBeans to view attributes and values for each.

![MBeans tab][9]

(Alan Formy-Duvall, [CC BY-SA 4.0][3])

### Conclusion

Java has been around a long time, and it continues to power millions of systems worldwide. Plenty of development environments and monitoring systems are available, but having a tool like jconsole included in the base kit can be highly valuable.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/monitor-java-linux-jconsole

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
