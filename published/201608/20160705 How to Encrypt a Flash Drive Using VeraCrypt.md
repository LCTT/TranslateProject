用 VeraCrypt 加密闪存盘
============================================

很多安全专家偏好像 VeraCrypt 这类能够用来加密闪存盘的开源软件，是因为可以获取到它的源代码。

保护 USB 闪存盘里的数据，加密是一个聪明的方法，正如我们在使用 Microsoft 的 BitLocker [加密闪存盘][1] 一文中提到的。

但是如果你不想用 BitLocker 呢？

你可能有顾虑，因为你不能够查看 Microsoft 的程序源码，那么它容易被植入用于政府或其它用途的“后门”。而由于开源软件的源码是公开的，很多安全专家认为开源软件很少藏有后门。

还好，有几个开源加密软件能作为 BitLocker 的替代。

要是你需要在 Windows 系统，苹果的 OS X 系统或者 Linux 系统上加密以及访问文件，开源软件 [VeraCrypt][2] 提供绝佳的选择。

VeraCrypt 源于 TrueCrypt。TrueCrypt 是一个备受好评的开源加密软件，尽管它现在已经停止维护了。但是 TrueCrypt 的代码通过了审核，没有发现什么重要的安全漏洞。另外，在 VeraCrypt 中对它进行了改善。

Windows，OS X 和 Linux 系统的版本都有。

用 VeraCrypt 加密 USB 闪存盘不像用 BitLocker 那么简单，但是它也只要几分钟就好了。

### 用 VeraCrypt 加密闪存盘的 8 个步骤

对应你的操作系统 [下载 VeraCrypt][3] 之后：

打开 VeraCrypt，点击 Create Volume，进入 VeraCrypt 的创建卷的向导程序（VeraCrypt Volume Creation Wizard）。

![](http://www.esecurityplanet.com/imagesvr_ce/6246/Vera0.jpg)

VeraCrypt 创建卷向导（VeraCrypt Volume Creation Wizard）允许你在闪存盘里新建一个加密文件容器，这与其它未加密文件是独立的。或者你也可以选择加密整个闪存盘。这个时候你就选加密整个闪存盘就行。

![](http://www.esecurityplanet.com/imagesvr_ce/6703/Vera1.jpg)

然后选择标准模式（Standard VeraCrypt Volume）。

![](http://www.esecurityplanet.com/imagesvr_ce/835/Vera2.jpg)

选择你想加密的闪存盘的驱动器卷标（这里是 O：）。

![](http://www.esecurityplanet.com/imagesvr_ce/9427/Vera3.jpg)

选择创建卷模式（Volume Creation Mode）。如果你的闪存盘是空的，或者你想要删除它里面的所有东西，选第一个。要么你想保持所有现存的文件，选第二个就好了。

![](http://www.esecurityplanet.com/imagesvr_ce/7828/Vera4.jpg)

这一步允许你选择加密选项。要是你不确定选哪个，就用默认的 AES 和 SHA-512 设置。

![](http://www.esecurityplanet.com/imagesvr_ce/5918/Vera5.jpg)

确定了卷容量后，输入并确认你想要用来加密数据密码。

![](http://www.esecurityplanet.com/imagesvr_ce/3850/Vera6.jpg)

要有效工作，VeraCrypt 要从一个熵或者“随机数”池中取出一个随机数。要初始化这个池，你将被要求随机地移动鼠标一分钟。一旦进度条变绿了，或者更方便的是等到进度条到了屏幕右边足够远的时候，点击 “Format” 来结束创建加密盘。

![](http://www.esecurityplanet.com/imagesvr_ce/7468/Vera8.jpg)

### 用 VeraCrypt 使用加密过的闪存盘

当你想要使用一个加密了的闪存盘，先插入闪存盘到电脑上，启动 VeraCrypt。

然后选择一个没有用过的卷标（比如 z:），点击自动挂载设备（Auto-Mount Devices）。

![](http://www.esecurityplanet.com/imagesvr_ce/2016/Vera10.jpg)

输入密码，点击确定。

![](http://www.esecurityplanet.com/imagesvr_ce/8222/Vera11.jpg)

挂载过程需要几分钟，这之后你的解密盘就能通过你先前选择的盘符进行访问了。

### VeraCrypt 移动硬盘安装步骤

如果你设置闪存盘的时候，选择的是加密过的容器而不是加密整个盘，你可以选择创建 VeraCrypt 称为移动盘（Traveler Disk）的设备。这会复制安装一个 VeraCrypt 到 USB 闪存盘。当你在别的 Windows 电脑上插入 U 盘时，就能从 U 盘自动运行 VeraCrypt；也就是说没必要在新电脑上安装 VeraCrypt。

你可以设置闪存盘作为一个移动硬盘（Traveler Disk），在 VeraCrypt 的工具栏（Tools）菜单里选择 Traveler Disk SetUp 就行了。

![](http://www.esecurityplanet.com/imagesvr_ce/5812/Vera12.jpg)

要从移动盘（Traveler Disk）上运行 VeraCrypt，你必须要有那台电脑的管理员权限，这不足为奇。尽管这看起来是个限制，机密文件无法在不受控制的电脑上安全打开，比如在一个商务中心的电脑上。

> 本文作者 Paul Rubens 从事技术行业已经超过 20 年。这期间他为英国和国际主要的出版社，包括 《The Economist》《The Times》《Financial Times》《The BBC》《Computing》和《ServerWatch》等出版社写过文章，

--------------------------------------------------------------------------------

via: http://www.esecurityplanet.com/open-source-security/how-to-encrypt-flash-drive-using-veracrypt.html

作者：[Paul Rubens][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.esecurityplanet.com/author/3700/Paul-Rubens
[1]: http://www.esecurityplanet.com/views/article.php/3880616/How-to-Encrypt-a-USB-Flash-Drive.htm
[2]: http://www.esecurityplanet.com/open-source-security/veracrypt-a-worthy-truecrypt-alternative.html
[3]: https://veracrypt.codeplex.com/releases/view/619351



