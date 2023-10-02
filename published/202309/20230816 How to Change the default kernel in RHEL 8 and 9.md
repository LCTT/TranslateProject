[#]: subject: "How to Change the default kernel in RHEL 8 and 9"
[#]: via: "https://www.2daygeek.com/changing-default-kernel-rhel-8-rhel-9/"
[#]: author: "Rasool Cool https://www.2daygeek.com/author/rasool/"
[#]: collector: "lujun9972"
[#]: translator: "onionstalgia"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16147-1.html"

如何使用 grubby 更改 RHEL 8 和 9 的默认内核
======

![][0]

通常 Linux 系统会默认引导系统进入最新安装的内核，并保留最新的 3 个 Linux 内核引导条目。

假设你已经执行了 `yum update`，并且新的内核作为更新的一部分已经安装了。这时，由于这个新内核与应用程序不兼容，它会阻止应用程序启动。

想要暂时解决这个问题，你应该还是引导系统进入旧内核。

在本文中，我们将向您展示如何使用 `grubby` 工具将旧的内核版本设置为 RHEL 8 和 RHEL 9 系统上的默认版本。

### grubby 是什么

`grubby` 是一个命令行工具，用于在多个架构上更新和显示引导加载配置文件的信息。

### 检查当前引导的内核

你可以使用如下的 `uname` 命令来检查当前引导/加载的内核。

```
# uname -r
4.18.0-477.13.1.el8_8.x86_64
```

### 列出默认内核

使用 `grubby` 验证默认内核版本，运行以下命令：

```
# grubby --default-kernel
/boot/vmlinuz-4.18.0-477.13.1.el8_8.x86_64
```

要获取当前默认内核的索引号，请运行以下命令：

```
# grubby --default-index
0
```

### 检查已安装的内核

要检查已安装的内核的列表，请运行以下命令：

我们来解释以下的输出信息。最新安装的内核的**条目索引**为 `0`，接下来的 **较旧的内核** 版本将会是 `1`，第二个更旧的内核版本将会是 `2`，而 **救援内核** 的条目索引将会是 `3`。

```
# grubby --info=ALL | egrep -i 'index|title'
index=0
title="Red Hat Enterprise Linux (4.18.0-477.13.1.el8_8.x86_64) 8.8 (Ootpa)"
index=1
title="Red Hat Enterprise Linux (4.18.0-425.19.2.el8_7.x86_64) 8.7 (Ootpa)"
index=2
title="Red Hat Enterprise Linux (4.18.0-425.13.1.el8_7.x86_64) 8.7 (Ootpa)"
index=3
title="Red Hat Enterprise Linux (0-rescue-13iu76884ec5490puc67j8789s249b0c) 8.2 (Ootpa)"
```

### 更改默认内核引导条目

我们可以用两种方式，使用 “内核文件名”，或者使用 “内核条目索引”。我们设置索引号为 `1` 的 `4.18.0-425.19.2.el8_7.x86_64` 为默认内核，以此满足应用程序的依赖关系。

语法：

```
# grubby --set-default [kernel-filename]
```

```
# grubby --set-default /boot/vmlinuz-4.18.0-425.19.2.el8_7.x86_64
```

或者

```
# grubby --set-default vmlinuz-4.18.0-425.19.2.el8_7.x86_64
```

使用内核条目索引更改默认的内核引导：

语法：

```
# grubby --set-default-index=[kernel-entry-index]
```

```
# grubby --set-default-index=1
```

### 重启系统

重启系统，检查旧内核是否持久更改。

```
# reboot
```

或者

```
# init 6
```

### 验证更改

让我们检查一下在上一步中添加的内核是否生效了。好了，按我们的预期使用了较旧的内核 “N-1” 进行引导了。

```
# uname -r
4.18.0-425.19.2.el8_7.x86_64
# grubby --default-kernel
/boot/vmlinuz-4.18.0-425.19.2.el8_7.x86_64
```

要检查所有内核的详细信息，请运行以下命令：

```
# grubby --info=ALL
```

![][2]

### 总结

在本教程中，我们展示了如何使用 `grubby` 工具在 RHEL 8 和 RHEL 9 系统上将旧版本内核设置为默认。

如果有任何问题或反馈，欢迎在下方发表评论。

*（题图：MJ/9204b9c1-c1ad-4694-b2f6-a7d983976d22）*

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/changing-default-kernel-rhel-8-rhel-9/

作者：[Rasool Cool][a]
选题：[lujun9972][b]
译者：[onionstalgia](https://github.com/onionstalgia)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/rasool/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/upgrading-from-rhel-7-to-rhel-8/
[2]: https://www.2daygeek.com/wp-content/uploads/2023/06/changing-default-kernel-rhel-8-rhel-9-1024x494.jpg
[0]: https://img.linux.net.cn/data/attachment/album/202309/01/105123phdy0f0fmgavquqq.jpg