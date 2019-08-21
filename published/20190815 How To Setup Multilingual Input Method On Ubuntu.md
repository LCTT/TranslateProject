[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11255-1.html)
[#]: subject: (How To Setup Multilingual Input Method On Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-setup-multilingual-input-method-on-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何在 Ubuntu 上设置多语言输入法
======

![](https://img.linux.net.cn/data/attachment/album/201908/21/231916g3gxbhybq0zv0q1h.jpg)

或许你不知道，在印度有数以百计的语言被使用，其中 22 种被印度机构列为官方语言。我的母语不是英语，因此当我需要从英语输入或者翻译到我的母语泰米尔语时我经常使用**谷歌翻译**。嗯，我估计我不再需要依靠谷歌翻译了。我刚发现在 Ubuntu 上输入印度语的好办法。这篇教程解释了如何配置多语言输入法的方法。这个是为 Ubuntu 18.04 LTS 特别打造的，但是它可以在其它类 Ubuntu 系统例如 Linux mint、Elementary OS 上使用。

### 在 Ubuntu Linux 上设置多语言输入法

通过 **IBus** 的帮助，我们可以轻松在 Ubuntu 及其衍生物上配置多语言输入法。Ibus，代表 **I** ntelligent **I** nput **Bus**（智能输入总线），是一种针对类 Unix 操作系统下多语言输入的输入法框架。它使得我们可以在大多数 GUI 应用例如 LibreOffice 下输入母语。

### 在 Ubuntu 上安装 IBus

在 Ubuntu 上 安装 IBus 包，运行：

```
$ sudo apt install ibus-m17n
```

Ibus-m17n 包提供了许多印度语和其它国家语言包括阿姆哈拉语，阿拉伯语，阿美尼亚语，阿萨姆语，阿萨巴斯卡语，白俄罗斯语，孟加拉语，缅甸语，中高棉语，占文，**汉语**，克里语，克罗地亚语，捷克语，丹麦语，迪维希语，马尔代夫语，世界语，法语，格鲁吉亚语，古/现代希腊语，古吉拉特语，希伯来语，因纽特语，日语，卡纳达语，克什米尔语，哈萨克语，韩语，老挝语，马来语，马拉地语，尼泊尔语，欧吉布威语，欧瑞亚语，旁遮普语，波斯语，普什图语，俄语，梵语，塞尔维亚语，四川彝文，彝文，西格西卡语，信德语，僧伽罗语，斯洛伐克语，瑞典语，泰语，泰米尔语，泰卢固语，藏语，维吾尔语，乌都语，乌兹别克语，越语及意第绪语。

##### 添加输入语言

我们可以在系统里的**设置**部分添加语言。点击你的 Ubuntu 桌面右上角的下拉箭头选择底部左下角的设置图标。

![][2]

*从顶部面板启动系统设置*

从设置部分，点击左侧面板的**区域及语言**选项。再点击右侧**输入来源**标签下的**+**（加号）按钮。

![][3]

*设置部分的区域及语言选项*

在下个窗口，点击**三个垂直的点**按钮。

![][4]

*在 Ubuntu 里添加输入来源*

搜寻并选择你想从列表中添加的输入语言。

![][5]

*添加输入语言*

在本篇教程中，我将加入**泰米尔**语。在选择语言后，点击**添加**按钮。

![][6]

*添加输入来源*

现在你会看到选中的输入来源已经被添加了。你会在输入来源标签下的区域及语言选项中看到它。

![][7]

*Ubuntu 里的输入来源选项*

点击输入来源标签下的“管理安装的语言”按钮

![][8]

*在 Ubuntu 里管理安装的语言*

接下来你会被询问是否想要为选定语言安装翻译包。如果你想的话你可以安装它们。或者仅仅选择“稍后提醒我”按钮。你下次打开的时候会收到统治。

![][9]

*语言支持没完全安装好*

一旦翻译包安装好，点击**安装/移除语言**按钮。同时确保 IBus 在键盘输入法系统中被选中。

![][10]

*在 Ubuntu 中安装/移除语言*

从列表中选择你想要的语言并点击采用按钮。

![][11]

*选择输入语言*

到此为止了。我们已成功在 Ubuntu 18.04 桌面上配置好多语输入方法。同样的，你可以添加尽可能多的输入语言。

在添加完所有语言来源后，登出再登陆回去。

### 用印度语或者你喜欢的语言输入

一旦你添加完所有语言后，你就会从你的 Ubuntu 桌面上的顶端菜单下载栏看到它们。

![][12]

*从 Ubuntu 桌面的顶端栏选择输入语言。*

你也可以使用键盘上的**徽标键+空格键**在不同语言中切换。

![][13]

*在 Ubuntu 里用**徽标键+空格键**选择输入语言*

打开任何 GUI 文本编辑器/应用开始打字吧！

![][14]

*在 Ubuntu 中用印度语输入*

### 将 IBus 加入启动应用

我们需要让 IBus 在每次重启后自动打开，这样每次你想要用自己喜欢的语言输入的时候就无须手动打开。

为此仅须在面板中输入“开机应用”点开开机应用选项。

![][15]

在下个窗口，点击添加，在名字栏输入“Ibus”并在命令栏输入“ibus-daemon”点击添加按钮。

![][16]

*在 Ubuntu 中将 Ibus 添加进开机启动项*

从现在起 IBus 将在系统启动后自动开始。

现在到你的回合了。在什么应用/工具中你用当地的印度语输入？在下方评论区让我们知道它们。

参考：

  * [IBus – Ubuntu 社区百科][20]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-setup-multilingual-input-method-on-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/07/Ubuntu-system-settings.png
[3]: https://www.ostechnix.com/wp-content/uploads/2019/08/Region-language-in-Settings-ubuntu.png
[4]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-input-source-in-Ubuntu.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-input-language.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-Input-Source-Ubuntu.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/08/Input-sources-Ubuntu.png
[8]: https://www.ostechnix.com/wp-content/uploads/2019/08/Manage-Installed-Languages.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/08/The-language-support-is-not-installed-completely.png
[10]: https://www.ostechnix.com/wp-content/uploads/2019/08/Install-Remove-languages.png
[11]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-language.png
[12]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-input-language-from-top-bar-in-Ubuntu.png
[13]: https://www.ostechnix.com/wp-content/uploads/2019/08/Choose-input-language-using-SuperSpace-keys.png
[14]: https://www.ostechnix.com/wp-content/uploads/2019/08/Setup-Multilingual-Input-Method-On-Ubuntu.png
[15]: https://www.ostechnix.com/wp-content/uploads/2019/08/Launch-startup-applications-in-ubuntu.png
[16]: https://www.ostechnix.com/wp-content/uploads/2019/08/Add-Ibus-to-startup-applications-on-Ubuntu.png
[17]: https://www.ostechnix.com/use-google-translate-commandline-linux/
[18]: https://www.ostechnix.com/type-indian-rupee-sign-%e2%82%b9-linux/
[19]: https://www.ostechnix.com/setup-japanese-language-environment-arch-linux/
[20]: https://help.ubuntu.com/community/ibus
