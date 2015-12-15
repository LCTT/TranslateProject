Linux 有问必答：如何在 Linux 上自动设置 JAVA_HOME 环境变量
================================================================================
> **问题**：我需要在我的 Linux 机器上编译 Java 程序。为此我已经安装了 JDK (Java Development Kit)，而现在我正试图设置 JAVA\_HOME 环境变量使其指向安装好的 JDK 。关于在 Linux 上设置 JAVA\_HOME 环境变量，最受推崇的办法是什么？

许多 Java 程序或基于 Java 的*集成开发环境* (IDE)都需要设置好 JAVA_HOME 环境变量。该变量应指向 *Java 开发工具包* (JDK)或 *Java 运行时环境* (JRE)的安装目录。JDK 不仅包含了 JRE 提供的一切，还带有用于编译 Java 程序的额外的二进制代码和库文件（例如编译器，调试器及 JavaDoc 文档生成器）。JDK 是用来构建 Java 程序的，如果只是运行已经构建好的 Java 程序，单独一份 JRE 就足够了。

当您正试图设置 JAVA\_HOME 环境变量时，麻烦的事情在于 JAVA\_HOME 变量需要根据以下几点而改变：(1) 您是否安装了 JDK 或 JRE；(2) 您安装了哪个版本；(3) 您安装的是 Oracle JDK 还是 Open JDK。

因此每当您的开发环境或运行时环境发生改变（例如为 JDK 更新版本）时，您需要根据实际情况调整 JAVA\_HOME 变量，而这种做法是繁重且缺乏效率的。

以下 export 命令能为您**自动设置**  JAVA\_HOME 环境变量，而无须顾及上述的因素。

若您安装的是 JRE：

    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

若您安装的是 JDK：

    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))

根据您的情况，将上述命令中的一条写入 ~/.bashrc（或 /etc/profile）文件中，它就会永久地设置好 JAVA\_HOME 变量。

注意，由于 java 或 javac 可以建立起多个层次的符号链接，为此"readlink -f"命令是用来获取它们真正的执行路径的。

举个例子，假如您安装的是 Oracle JRE 7，那么上述的第一条 export 命令将自动设置 JAVA\_HOME 为：

    /usr/lib/jvm/java-7-oracle/jre

若您安装的是 Open JDK 第8版，那么第二条 export 命令将设置 JAVA\_HOME 为：

    /usr/lib/jvm/java-8-openjdk-amd64

![](https://c1.staticflickr.com/1/700/22961948071_c73a3261dd_c.jpg)

简而言之，这些 export 命令会在您重装/升级您的JDK/JRE，或[更换默认 Java 版本][1]时自动更新 JAVA\_HOME 变量。您不再需要手动调整它。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/set-java_home-environment-variable-linux.html

作者：[Dan Nanni][a]
译者：[Ricky-Gong](https://github.com/Ricky-Gong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/change-default-java-version-linux.html
