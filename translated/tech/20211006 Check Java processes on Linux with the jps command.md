[#]: subject: "Check Java processes on Linux with the jps command"
[#]: via: "https://opensource.com/article/21/10/check-java-jps"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 jps 命令监测 Linux 上的 Java 进程 
======
系统上会运行很多进程，使用 jps 命令快速识别 Java 进程是一个很有用的方法。 
![Coffee beans][1]

在 Linux 上，有一些命令可以用于查看系统上运行的进程。进程是指的是由内核管理的正在进行的事件。每当启动应用程序时，就会产生一个进程，但也有许多进程在计算机后台运行，像保持系统时间准确的程序、监视新文件系统的程序、索引化文件的程序等。有一些实用程序可以用来监测这些进程，比如包含在 [procps-ng 包][2] 中的那些程序，但它们往往都是对各种进程通用的。它们会查看计算机上的所有进程，你可以根据想要的内容来过滤结果列表。

在 Linux 上，可以使用 `ps` 命令查看进程。这是查看系统上正在运行的进程的最简单方法。 


```
$ ps
    PID TTY          TIME CMD
   4486 pts/0    00:00:00 bash
  66930 pts/0    00:00:00 ps
```

你也可以使用 `ps` 命令，将结果输出到管道符 `grep`，从而查看系统上运行的 Java 进程，。 


```
$ ps ax |grep java
  67604 pts/1    Sl+    0:18 /usr/lib/jvm/java-11-openjdk-11.0.12.0.7-4.fc34.x86_64/bin/java -D[Standalone] -server -Xms64m -Xmx512m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true --add-exports=java.desktop/sun.awt=ALL-UNNAMED --add-exports=java.naming/com.sun.jndi.ldap=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.invoke=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.security=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.management/javax.management=ALL-UNNAMED --add-opens=java.naming/javax.naming=ALL-UNNAMED -Dorg.jboss.boot.log.file=/home/alan/wildfly/24.0.1/standalone/log/server.log -Dlogging.configuration=file:/home/alan/wildfly/24.0.1/standalone/configuration/logging.properties -jar /home/alan/wildfly/24.0.1/jboss-modules.jar -mp /home/alan/wildfly/24.0.1/modules org.jboss.as.standalone -Djboss.home.dir=/home/alan/wildfly/24.0.1 -Djboss.server.base.dir=/home/alan/wildfly/24.0.1/standalone
```

然而，OpenJDK 有自己的特定进程监视器。Java 虚拟机进程状态 (jps) 工具可以帮你扫描系统上每个运行的 Java 虚拟机 (JVM) 实例。

要想实现与 `ps` 命令类似的输出，可以使用 `-v` 选项。这很实用，因为与 `ps` 相比，它可以减少你的输入。 


```
$ jps -v
67604 jboss-modules.jar -D[Standalone] -Xms64m -Xmx512m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true --add-exports=java.desktop/sun.awt=ALL-UNNAMED --add-exports=java.naming/com.sun.jndi.ldap=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.invoke=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.security=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.management/javax.management=ALL-UNNAMED --add-opens=java.naming/javax.naming=ALL-UNNAMED -Dorg.jboss.boot.log.file=/home/alan/wildfly/24.0.1/standalone/log/server.log -Dlogging.configuration=file:/home/alan/wildfly/24.0.1/standalone/configuration/logging.properties
```

`jps` 的默认输出会给出每个检测到的实例的进程标识符，以及类名或 Jar 文件名。 


```
$ jps
67604 jboss-modules.jar
69430 Jps
```

**注意：** `jps` 的手册页指出此命令是试验性且不受支持的。尽管如此，它仍然是一个不错的选择，因为通常一个系统上运行着许多进程，有这样一种只识别 Java 进程的快速方法是很有用的。

当下的 Java 仍然是一种流行的语言，所以熟悉 Java 开发工具包和运行时环境仍然很重要。它们里面包含着许多适用于 Java 应用程序开发和维护的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/check-java-jps

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-beans.jpg?itok=3hkjX5We (Coffee beans)
[2]: https://opensource.com/article/21/8/linux-procps-ng
