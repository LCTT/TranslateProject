一起来看看windows Nano Server 2016
====

![](http://images.techhive.com/images/article/2016/04/pokes-fun-at-1164459_1280-100654917-primary.idge.jpg)

>对于未来的windows服务器管理，Nano Server是快速的功能强大的工具，但是你需要知道你在做的是什么。

[1]下面谈论即将到来的Windows Server 2016的Nano版本，带远程管理和命令行设计，还包含私有云和数据中心。但是，谈论它和动手用它区别还是很大的，让我们深入看下去。
没有本地登录，且所有的程序工具和代理都是64位，安装升级快捷，只需要非常少的时间就能重启。它非常适合做计算节点（无论在不在集群），存储主机，DNS服务器，IIS的web服务器，在容器中提供主机服务或者虚拟化的客户操作系统。

Nano服务器也并不是太好玩的，你必须知道你要完成什么。当你看着远程的PowerShell的连接，你应该想想接下来做什么，如果你知道你想要做什么的话，那它就非常方便和强大。

[2] 微软为设置Nano服务器提供了一个快速入门手册，在这我给大家具体展示一下。

首先，你必须创建一个.vhd格式的虚拟磁盘文件。在第一步中，我有几个文件不在正确的位置，Powershell总是提示不匹配，所以我不得不反复查找文件的位置方便我可以用ISO信息（需要把它拷贝粘贴到你要创建.vhd文件的服务器上）。当你所有的东西都位置正确了，你可以开始创建.vhd文件的步骤了。

![](http://images.techhive.com/images/article/2016/09/nano-server-1-100682371-large.idge.jpg)
>步骤一：尝试运行New-NanoServerImage脚本时，很多文件路径错误，我把文件位置的问题搞定后，就能进行下去创建.vhd文件了（如图所示）

接下来，你可以用创建VM向导在Hyper-V里面创建VM虚拟机，你需要指定一个存在的虚拟磁盘同时指向你新创建的.vhd文件。（步骤二）

![](http://images.techhive.com/images/article/2016/09/nano-server-2-100682368-large.idge.jpg)
>步骤二：连接虚拟磁盘（一开始创建的）

当你启动Nano服务器的时候，你或许会发现有内存错误，提示你已经分配了多少内存，还有其他VM虚拟机的Hyper-V服务器剩余了多少内存。我已经关闭了一些虚机以提升内存，因为微软说Nano服务器最少需要512M内存，但是它又推荐你至少800M，最后我分配了8G内存因为我给它1G的时候根本不能用，为了方便，我也没有尝试其他的内存配置。

最后我终于到达登录界面，到达Nano Server Recovery Console界面（步骤三），Nano服务器的基本命令界面。

![](http://images.techhive.com/images/article/2016/09/nano-server-3-100682369-large.idge.jpg)
>步骤3：Nano服务器的恢复窗口

本来我以为进到这里会很美好，但是当我弄明白几个细节（如何加入域，弹出个磁盘，添加用户），我明白一些配置的细节，用几个字符运行New-NanoServerImage cmdlet会变得很简单。

然而，当你的服务器运行时，也有办法确认它的状态，就像步骤4所示，这一切都始于一个远程PowerShell连接。

![](http://images.techhive.com/images/article/2016/09/nano-server-4-100682370-large.idge.jpg)
>步骤4：从Nano服务器恢复窗口得到的信息，你可以从远程运行一个Powershell连接。

微软展示了如何创建连接，但是尝试了四个不同的方法，我发现MSDN是最好的方式，步骤5展示。

![](http://images.techhive.com/images/article/2016/09/nano-server-5-100682372-large.idge.jpg)
>步骤5：创建到Nano服务器的PowerShell远程连接
提示：创建远程连接，你可以用下面这条命令：

```
Enter-PSSession –ComputerName "192.168.0.100"-Credential ~\Administrator.
```

如果你提前知道这台服务器将要做DNS服务器或者集群中的一个计算节点，可以事先在.vhd文件中加入一些角色和特定的软件包。如果不太清楚，你可以先建立PowerShell连接，然后安装NanoServerPackage并导入它，你就可以用Find-NanoServerPackage命令来查找你要部署的软件包了（步骤6）。

![](http://images.techhive.com/images/article/2016/09/nano-server-6-100682373-large.idge.jpg)
>步骤6：你安装完并导入NanoServerPackage后，你可以找到你需要启动服务器的工具以及设置的用户和你需要的一些其他功能包。

我测试了安装DNS安装包，用`Install-NanoServerPackage –Name Microsoft-NanoServer-DNS-Package`这个命令。安装好后，我用`Enable-WindowsOptionalFeature –Online –FeatureName DNS-Server-Full-Role`命令启用它。

之前我并不知道这些命令，之前也从来没运行过，也没有弄过DNS，但是现在稍微研究一下我就能用Nano服务器建立一个DNS服务并且运行它。

接下来是用PowerShell来配置DNS服务器。这个复杂一些，需要网上研究一下。但是他也不是那么复杂，当你学习了使用cmdlets，用Add-DNSServerPrimaryZone添加zone，用Add-DNSServerResourceRecordA命令在zone中添加记录。

做完这些命令行的工作，你可能需要验证是否起效。你可以快速浏览一下PowerShell命令，没有太多的DNS命令（使用Get-Command命令）。

如果你需要一个图形化的配置，你可以打开Nano服务器的IP地址从一个图形化的主机上用图形管理器。右击需要管理的服务器，提供你的验证信息，你连接好后，在图形管理器中右击然后选择Add Roles and Features，它会显示你安装好的DNS服务，如步骤7所示。

![](http://images.techhive.com/images/article/2016/09/nano-server-7-100682374-large.idge.jpg)
>步骤7：通过图形化界面验证DNS已经安装

不用麻烦登录服务器的远程桌面，你可以用服务器管理工具来进行操作。当然你能验证DNS角色不代表你有权限添加新的角色和特性，它已经锁住了。你现在可以用Nano服务器做一些需要的调整了。

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/3119770/windows-server/down-and-dirty-with-windows-nano-server-2016.html?utm_source=webopsweekly&utm_medium=email

作者：[J. Peter Bruzzese ][a]
译者：[jiajia9linuxer](https://github.com/jiajia9linuxer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.infoworld.com/author/J.-Peter-Bruzzese/
[1]: http://www.infoworld.com/article/3049191/windows-server/nano-server-a-slimmer-slicker-windows-server-core.html
[2]: https://technet.microsoft.com/en-us/windows-server-docs/compute/nano-server/getting-started-with-nano-server
[3]: https://technet.microsoft.com/en-us/windows-server-docs/get-started/system-requirements--and-installation

