Linux基础：分析 Ubuntu 磁盘使用情况
================================================================================
亲爱的linux极客们，

在这篇文章中，我将指导你们如何在 Ubuntu 中对磁盘使用情况进行分析。为了确保系统的健康，运行的流畅，时常关心机器的硬盘，适当的运行一些分析是非常重要的，当然，运行这些分析是很容易的。为了完成分析，我们将使用一款非常棒的图形工具，名叫**Baobab**。

在下一步操作之前，我可以告诉你们，它的使用非常简单，功能齐全，我确定它能够满足你的需求。Baobab 是 gnome-utils 的一部分，但是自从Gnome3.4版本后，已经作为独立应用。通过使用这个磁盘分析工具，你可以轻松扫描文件夹，文件系统，不单是本地，远程目录一样可以轻松分析。

只需轻轻点击，便可以搞定一切！想要停止扫描？简单，在 baobab 用户界面的顶部，轻点 **Stop scanning** 按钮，完成。

我喜欢这个工具的简单性并且可以图形化表示数据，像饼状图和树形图。那么，现在你们在自己的机子上安装使用如何呢？

据我所知，ubuntu已经默认安装，如果没有，打开一个新终端（**CTRL+ALT+T**）,然后运行下列命令来安装它。

    sudo apt-get install baobab

安装完毕后，会分类至**应用程序, 系统工具, 磁盘分析器**，或者，直接使用下列命令，在终端中运行baobab。

    baobab

下列图片显示了当它在你的机器运行时的界面。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/baobab1.png)

如需扫描 Home 目录，点击 **Scan Home** 或者 Analyzer->Scan Home Folder 选项。完成扫描后，工具会做很多分析，耐心等待分析结果吧！

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/baobab2.png)

正如上图所见，baobab 扫描结果提供给我们很多信息，包括 Home 目录中每一个文件夹的使用情况、大小，以及所拥有文件数。右边有一个饼状示意图。如果你喜欢，选择上方的 **View as Treemap Chart**，你可以轻松地把它换成树状图。

下图显示的是，选择树状图代替默认的饼状图的界面。 

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/baobab3.png)

如需扫描文件系统，选择 Analyzer->Scan Filesystem ,如果你懒得去点击这些，有一个简单方法，快捷键**CTRL+F**。

选择你喜欢的方式，两个方法都会起效并做同样的扫描。快捷键的确易用省时，但是如果不是天天用这个工具，也很难同时记住所有快捷键。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/baobab4.png)

如何扫描文件夹？简单！Analyzer-> Scan A Folder -> 选择你想要扫描的文件夹，快捷键是 **CTRL+O** 。是不是非常简单？是的！看见 Scan a Folder 按钮了吗？点击它扫描就开始了！

下图显示了扫描完 python-nmap-0.1.4 后的结果。我用简单的方法得到了有用的信息列表。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/baobab5.png)

你已经学会了如何扫描 Home 目录、文件系统和指定文件夹。有一个重要的功能，我还没有告诉你，但我确定你一定可以自己学会。是不是有远程文件夹需要扫描？好好发挥一下脑力吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-basics-analyze-disk-usage-ubuntu-linux/

译者：[Vic___](http://www.vicyu.net) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
