tespeed - 测试网速的Python工具
================================================================================
许多电脑呆子知道可以用**speedtest.net**测试网速，但是这个不能在测试中给你足够的控制。Linux用户喜欢在终端中输入命令来完成任务，至少我就是这样的。

tespeed是一款有很多特性的python工具，可以在终端在测试网速。根据文档说明，它利用了speedtest.net的服务器，但是用户可以手动指定。

最初作者用php语言写了tespeed工具，并且证明了ISP提供的网络远低于它广告中所说的那样。但是事情并不是一直如他们想的那样，因此作者移植他的php脚本到python中，并且他的工具在github中已经有180个star了。

It means **alot**。

### 如何在linux中测试tespeed ###

在你电脑上运行这个python程序前先确保系统已经满足了这个工具的依赖。tespeed依赖下面两个包：

- lxml
- SocksiPy

你可以用pip包管理系统来安装lxml，只要用下面的命令就行。

    pip install lxml

现在我们需要输入下面的命令来下载安装SocksiPy。

    wget http://sourceforge.net/projects/socksipy/files/socksipy/SocksiPy%201.00/SocksiPy.zip/

下载完成后 解压**SocksiPy.zip**并运行下面的命令来克隆tespeed仓库到你本地机器中。

    git clone https://github.com/Janhouse/tespeed.git

接着把SocksiPy文件夹放到你克隆下来的tespeed项目中。现在我们要像截图那样在SocksiPy中的创建一个叫**__init__.py**的空文件。

![simple trick to make tespeed work](http://blog.linoxide.com/wp-content/uploads/2015/01/tespeed1.png)

现在我们已经解决了项目的依赖问题，我们可以用下面的命令运行了。

    python tespeed.py

接下来就会发生一些神奇的事了。程序会测试你的下载和上传速度并且在你的终端中用漂亮的颜色显示出来。

![testing download and upload speed with tespeed python application](http://blog.linoxide.com/wp-content/uploads/2015/01/tespeed2.png)

在tespeed中有很多选项，如**-ls**来列出服务器，**-p**来指定代理服务器， **-s**来阻止调试(STDERR)输出, 还有很多我们会在本教程中探索。

如果你想要结果显示成MB，你可以在**python tespeed.py** 后面接上选项 **-mib**。

    python tespeed.py -mib

在你使用了-mib选项后你可以看到计量网速的单位改变了。

![testing internet speed with tespeed python application](http://blog.linoxide.com/wp-content/uploads/2015/01/tespeed3.png)

我非常喜欢用的一个选项是-w，它可以把标准输出转化成CSV格式。

    python tespeed.py -w

使用下面的命令来列出服务器。

    python tespeed -ls

运行上面的命令后，你会看到可以用于测试上传和下载速度的服务器列表。我的列表非常长，所以我不会在教程中共享了。

### 总结 ###

tespeed的确是一款帮助用户在终端中测试上传和下载速度的高性能python脚本。它支持很多的选项并且你可以指定列表中你想使用的服务器。继续使用tespeed并在留言区写下你们的体验吧。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/tespeed-python-tool-test-internet-speed/

作者：[Oltjano Terpollari][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/oltjano/