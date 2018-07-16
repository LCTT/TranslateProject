如何在同一台计算机上安装Windows 8.1和Ubuntu 14.04 LTS
================================================================================
                 
![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-Windows-8-1-and-Ubuntu-14-04-LTS-on-the-Same-Computer-440356-2.jpg)

**一些Windows用户，希望试试Linux操作系统，而不用删除他正在使用的系统。令人高兴的是，想尝试下Linux是非常简单的，而且Linux操作系统也能和其他操作系统在同一台机器上和平共处。**

举个例子，如果你是Windows用户，想试试Ubuntu，这个过程实际上是相当简单的，用户只需要付出一点小小的努力即可，这个过程中稍微注意一点就行了。

在PC上正常安装一个操作系统并不复杂，甚至是Ubuntu和其它Linux也一样简单。在大多数情况下，用户单击对话框的“下一步”，按照流程进行即可。当你想保留PC上的原来的操作系统时（并不特指Windows），还需要多一点操作才行，但是很简单。
       
在Linux下刻录一个ISO镜像是很容易的，有好几个程序可以提供这样的功能。而在Windows下，你可以将Ubuntu刻录到DVD或制作成USB启动盘（这样更好一些）。要将Ubuntu正确复制到一个USB设备，你将需要下载名为[Win32 Disk Imager 0.9.5][1]一个小工具。它具有一个简单的界面，是完全自动的。

在重启机器以安装Ubuntu前，你要给Ubuntu一些可用的磁盘空间，而且给Ubuntu一个磁盘分区是不够的。你将需要两个，一个放Ubuntu本身（大约10GB，如果你不想安装太多的应用的话，就足够了），第二个是交换分区（类似于Windows的页面文件），它的大小一般是你的内存的两倍。你不需要格式化它们，只要他们是可用的就行。如果你在第二块空闲硬盘安装Ubuntu，那就更简单了。

插上USB启动盘并重新启动。你会得到一个提示，询问是“试用”还是“安装”。选择“安装”并选择安装方式：安装Ubuntu和Windows 8并存（或任何你拥有的其他版本），用Ubuntu替换Windows 8，或者别的选项。
         
你可以选择“和Windows 8并存安装”，但你也许不喜欢安装程序自动处理的方式。你也可以选择“其它（Something Else）”来手动控制安装过程。

找到你给Ubuntu保留的空闲分区（安装程序无法读取和显示Windows卷的名称，所以你要小心别选错了），双击它，选择ext4文件系统，和“/”作为默认的安装点。
         
现在选择另外的那个较小的分区，选择swap分区类型。就这些了。当你点击下一步，安装程序将启动，你将要输入用户名，密码和其他信息。
         
当你启动你之后，将得到一个简单的列表，可以选择你要启动的操作系统。
        
尽情享受！

------------------

via: http://news.softpedia.com/news/How-to-Install-Windows-8-1-and-Ubuntu-14-04-LTS-on-the-Same-Computer-440356.shtml

译者：[CHINAANSHE](https://github.com/CHINAANSHE) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml
