修复Linux中的“提供类似行编辑的袖珍BASH...”的GRUB错误
================================================================================

这两天我[安装了Elementary OS和Windows双系统][1]，在启动的时候遇到了一个Grub错误。命令行中呈现如下信息：

**Minimal BASH like line editing is supported. For the first word, TAB lists possible command completions. anywhere else TAB lists possible device or file completions.**

**提供类似行编辑的袖珍 BASH。TAB键补全第一个词，列出可以使用的命令。除此之外，TAB键补全可以列出可用的设备或文件。**

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_Linux_1.jpeg)

事实上这并不是Elementary OS独有的错误。这是常见的[Grub][2]错误，会在Ubuntu，Fedora，Linux Mint等Linux操作系统上发生。

通过这篇文章里我们可以学到基于Linux系统**如何修复Ubuntu中出现的“minimal BASH like line editing is supported” Grub错误**。

> 你可以参阅这篇教程来修复类似的常见问题，[错误：分区未找到Linux grub救援模式][3]。

### 先决条件 ###

要修复这个问题，你需要达成以下的条件：

- 一个包含相同版本、相同OS的LiveUSB或磁盘
- 当前会话的Internet连接正常工作

在确认了你拥有先决条件了之后，让我们看看如何修复Linux的死亡黑屏（如果我可以这样的称呼它的话 ;) ）。

### 如何在基于Ubuntu的Linux中修复“minimal BASH like line editing is supported” Grub错误 ###

我知道你一定疑问这种Grub错误并不局限于在基于Ubuntu的Linux发行版上发生，那为什么我要强调在基于Ubuntu的发行版上呢？原因是，在这里我们将采用一个简单的方法，用个叫做**Boot Repair**的工具来修复我们的问题。我并不确定在其他的诸如Fedora的发行版中是否有这个工具可用。不再浪费时间，我们来看如何修复“minimal BASH like line editing is supported” Grub错误。

### 步骤 1: 引导进入lives会话 ###

插入live USB，引导进入live会话。

### 步骤 2: 安装 Boot Repair ###

等你进入了lives会话后，打开终端使用以下命令来安装Boot Repair：

    sudo add-apt-repository ppa:yannubuntu/boot-repair
    sudo apt-get update
    sudo apt-get install boot-repair

注意：推荐这篇教程[如何修复 apt-get update 无法添加新的 CD-ROM 的错误][4]，如果你在运行以上命令是遭遇同样的问题。

### 步骤 3: 使用Boot Repair修复引导 ###

装完Boot Repair后，在命令行运行如下命令启动：

    boot-repair &

其实操作非常简单直接，你仅需按照Boot Repair工具提供的说明操作即可。首先，点击Boot Repair中的**Recommended repair**选项。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu.png)

Boot Repair需要花费一些时间来分析引导和Grub中存在的问题。然后，它会提供一些可在命令行中直接运行的命令。将这些命令一个个在终端中执行。我这边屏幕上显示的是：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_1.png)

在输入了这些命令之后，它会执行执行一段时间：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_2.png)

在这一过程结束后，它会提供一个由boot repair的日志组成的网页网址。如果你的引导问题这样都没有修复，你就可以去社区或是发邮件给开发团队并提交该网址作为参考。很酷！不是吗？

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Final_Ubuntu.png)

在boot repair成功完成后，关闭你的电脑，移除USB并再次引导。我这就能成功的引导了，但是在Grub画面上会多出额外的两行。相比于看到系统能够再次正常引导的喜悦这些对我来说并不重要。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_Linux_2.jpeg)

### 对你有效吗? ###

这就是我修复**Elementary OS Freya中的minimal BASH like line editing is supported Grub 错误**的方法。怎么样？是否对你也有效呢？请自由的在下方的评论区提出你的问题和建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-minimal-bash-line-editing-supported-grub-error-linux/

作者：[Abhishek][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/guide-install-elementary-os-luna/
[2]:http://www.gnu.org/software/grub/
[3]:http://itsfoss.com/solve-error-partition-grub-rescue-ubuntu-linux/
[4]:http://itsfoss.com/fix-failed-fetch-cdrom-aptget-update-add-cdroms/
