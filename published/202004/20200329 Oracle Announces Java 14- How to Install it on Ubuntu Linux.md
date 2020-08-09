[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12076-1.html)
[#]: subject: (Oracle Announces Java 14! How to Install it on Ubuntu Linux)
[#]: via: (https://itsfoss.com/java-14-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

如何在 Ubuntu Linux 上安装 Oracle Java 14
======

![](https://img.linux.net.cn/data/attachment/album/202004/05/205313e188lsbrbgz9932d.jpg)

最近，Oracle 宣布 Java 14（或 Oracle JDK 14）公开可用。如果你想进行最新的实验或者开发的话，那么你可以试试在 Linux 系统上安装 Java 14。

Oracle JDK 14（或简称 Java 14）[发布版][1]包含几个新功能，如果你想预览它们的话。我已添加了链接：

  * [instanceof 的模式匹配][2]
  * [Records][3]
  * [Text Blocks][4]

除预览功能外，它还包含一些改进和补充。在新闻中，他们还提到了其他改进：

> 此外，最新的 Java 版本增加了 Java 语言对 switch 表达式的支持，新增了用于持续监控 JDK Flight Recorder 数据的新 API，将低延迟 zgc 扩展到了 macOS 和 Windows，并添加在 incubator 模块中，独立的 Java 应用打包，以及为了安全、有效地访问 Java 堆外部内存的新的外部内存访问 API。

当然，如果你想深入了解细节，那么你应查看[官方公告][1]。

在本教程中，我将向你展示在 Ubuntu 系统上安装 Java 14 的简便方法。请继续阅读。

**注意：**如果你选择使用 Oracle Java 11 或更高版本，那么应该了解新的 [Oracle 技术网络许可协议][5]，以了解它如何影响个人用户、开发人员和商业组织。通常，它们可以免费用于开发和测试，但不能用于生产环境。

### 如何在 Ubuntu Linux 上安装 Java 14？

作为参考，我已成功在默认安装 **OpenJDK 11** 的 **Pop!_OS 19.10** 上成功安装了它。

这里，我们将使用 [Linux Uprising][7] 的 Java 14 安装程序（最初基于 WebUpd8 Java 软件包）。

只需在终端中输入以下命令即可进行安装：

```
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java14-installer
```

这应该就完成了，如果你想将它设为默认，那么你可以输入以下命令：

```
sudo apt install oracle-java14-set-default
```

值得注意的是，这仅适用于基于 Ubuntu 的发行版。如果要在 Debian 和其他 Linux 发行版上安装它，那么也可以按照 [Linux Uprising 中的详细指南][7]安装 Java 14。

### 总结

当然，这些会带来最新的特性，如果你不想破环原有环境，你或许会希望继续使用 Java 11。如果你想在了解风险的情况下进行试验，请继续尝试！

欢迎在下面的评论中让我知道你对 Java 14 的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/java-14-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.oracle.com/corporate/pressrelease/oracle-announces-java14-031720.html
[2]: https://openjdk.java.net/jeps/305
[3]: https://openjdk.java.net/jeps/359
[4]: https://openjdk.java.net/jeps/368
[5]: https://www.oracle.com/technetwork/java/javase/overview/oracle-jdk-faqs.html
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/install-java-14-ubuntu.png?ssl=1
[7]: https://www.linuxuprising.com/2020/03/how-to-install-oracle-java-14-jdk14-on.html
