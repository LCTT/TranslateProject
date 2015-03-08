如何修复Windows更新在0%卡住
================================================================================
当你在一个月后登录Windows，发现有一些更新需要安装， 你选择安装这些更新但是**Windows更新卡在0%**时你感觉怎么样？

为什么我在Linux和开源专属的博客上谈论Windows更新呢？因为我喜欢[双启动Windows和Linux][1]。当我使用Linux作为我的主桌面时，过了一段时间我登录到Windows中。登录Windows后最烦人的事情是Windows更新。我偶尔遇到了几次**Windows更新不能工作**的情况。我选择安装更新而且Windows更新卡在了0%和0KB上，就像这样：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Windows_Updates_stuck_at_zero.jpeg)

本教程中，我们会让Windows更新再次可用。这个教程应该同样适用于Windows 7、Windows 8和Windows 8.1。

### 修复Windows更新卡在0% ###

请注意Windows更新可能卡在任何地方，我们将会使用的这个技巧需要你重新安装这些更新。我希望你不要觉得太麻烦。如果你准备好了，就让我们开始修复这个Windows更新问题。

#### 步骤 1: ####

按下Windows+R。这时会弹出运行窗口。在这里我们输入services.msc：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Updates_3.png)

#### 步骤 2: ####

这里会显示Windows上安装的所有服务。这些服务以字母排序。向下拉到**Windows Update Service**。右击并停止服务。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Windows_Updates_stuck_1.jpeg)

#### 步骤 3: ####

现在进入**C:\Windows\SoftwareDistribution并删除这里所有的内容**。实际上，这个文件夹是下载和保存安装文件的地方。但是由于Windows更新卡住了，所以这里的某个安装文件存在一些问题。

#### 步骤 4: ####

回到前面的服务（第一步中提到的）并右击重新启动Windows更新服务。再重新试一下Windows更新，这次应该可以用了。

当系统更新可以工作时，你或许会发现在下次启动时会有很多更新要安装。这时打个电话：


![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Windows_update_suck.jpg)

玩笑之余，我希望这个贴士能够帮助你拜托Windows更新卡在0%的情况。我希望Linux中的更新也能够含在[Windows 10从Linux复制的特性][2]列表中。这只是我的希望。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-windows-updates-stuck-0/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[2]:http://itsfoss.com/windows-10-inspired-linux/
