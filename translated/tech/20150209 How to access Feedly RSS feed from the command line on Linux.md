如何在Linux命令行下获取Feedly上的RSS新闻
================================================================================

也许的先告诉你一声，Feedly 是世界上最流行的在线新闻聚合服务之一；它提供了无缝地统一的新闻阅读体验，你可以使用电脑的浏览器扩展，Android 和 iOS 设备上的移动应用程序等来体验Feedly。Feedly 在2013年Google Reader 停用后，迅速的获得了一大批Google Reader的用户。我就是他们之中的一位。从这以后，Feedly就一直是我的默认RSS（简易信息聚合）阅读器
除了我非常喜欢的Feedly浏览器扩展和手机上的Feedly程序，这里还有一种途径来获取Feedly：Linux command-line (Linux命令行)
对的。你可以用命令行来获取Feedly上的新闻概要。

听起来非常傻？但是对于那些在服务器上工作的系统管理员来说，这是非常有用的。
点击进入[Feednix][2]. 这个用c++编写的开源软件是Feedly的非官方命令行客户端。它允许你浏览Feedly的新闻在一个基于字符的终端界面（例如：bash）。默认模式下，Feednix 连接了一个基于控制台的浏览器，这个浏览器的名字叫w3m，允许你在命令行终端的环境下阅读文章。当然你也可以选择使用你喜欢的网页浏览器。在这个教程中，我准备示范以下怎样在命令行下安装和配置Feednix 来获取获取Feedly。

### 在Linux下安装Feednix ###

你可以通过以下的步骤从源代码中安装Feednix。同时，在github的Ubuntu分区里面Ubuntu-stable（Ubuntu稳定版本）的分支上有最新的Feednix源代码。现在让我们开始吧：
作为必要组件，你需要安装一组开发包，和w3m浏览器（文字式页面浏览器）。

#### 在Debian,Ubuntu 和Linux Mint 操作 ####

    $ sudo apt-get install git automake g++ make libncursesw5-dev libjsoncpp-dev libcurl4-gnutls-dev w3m
    $ git clone -b Ubuntu-stable https://github.com/Jarkore/Feednix.git
    $ cd Feednix
    $ ./autogen.sh
    $ ./configure
    $ make
    $ sudo make install


#### 在Fedora 下操作 ####

    $ sudo yum groupinstall "C Development Tools and Libraries"
    $ sudo yum install gcc-c++ git automake make ncurses-devel jsoncpp-devel libcurl-devel w3m
    $ git clone -b Ubuntu-stable https://github.com/Jarkore/Feednix.git
    $ cd Feednix
    $ ./autogen.sh
    $ ./configure
    $ make
    $ sudo make install

Arch Linux

在Arch Linux发行版下, 你可以非常容易的安装Feednix 从 [AUR][3].


### 配置Feednix ###

在安装完软件后，用下面的命令启动Feednix

    $ feednix

如果你是第一次运行Feddnix,它会弹出一个网页浏览器窗口，在这个窗口里，你需要登陆来创建一个Feedly的账户ID和相应的开发人员密钥。

如果你是在无桌面环境下运行Feednix，先在另外一台电脑上打开一个网页，进入到网站：https://feedly.com/v3/auth/dev.

![](https://farm8.staticflickr.com/7427/15825106524_42883b3e32_b.jpg)

一旦你登陆，你对应的Feedly账户ID就生成了。

![](https://www.flickr.com/photos/xmodulo/15827565143/)

为了验证密钥，你需要在浏览器上允许验证密钥的链接发送你的邮箱。之后就会在浏览器窗口显示你的用户ID，密钥，和密钥的有效期。
请注意密钥的长度是非常超过200个字符的。所以密钥显示在一个带有垂直滚动条的文书框内，请确保把整个密钥的长度复制下来。

![](https://farm9.staticflickr.com/8605/16446685812_9098df494b_b.jpg)

向下面这样，把你的用户ID和密钥输入到Feddnix的命令行提示下：

    [Enter User ID] >> XXXXXX
    [Enter token] >> YYYYY

成功授权后，你会在屏幕上见到一个初始化的有两个窗格的Feednix界面

左边的标题为“Categories”窗格，显示了一个新闻分类栏；右边“Posts”窗格显示了当前类别的新闻文章

![](https://farm8.staticflickr.com/7412/16421639256_deb8e2d276_c.jpg)


### 用Feednix读文章 ###

这里我想简要描叙一下怎样通过Feednix来访问Feedly。


#### Feednix界面 ####

向我之前提过的，Feednix窗口包含了两个窗格。想在两个窗口之间进行切换的话，可以使用"TAB"健。在一个窗格内，想上下移动选择可以使用"j"和"k"。
这些快捷健明显是受到了使用Vim编辑器的人启发。

#### 阅读文章 ####

想阅读一些有特色的文章，可以在选定的文章上使用"o"健。它会调用w2m浏览器，并且在浏览器里面加载文章。
一旦你读完之后，可以使用"q"健来推出当前W2m浏览器，并且返回到Feednix.
如果你的电脑环境允许打开一个网页浏览器，你可以按"0"健来在你默认的网页浏览器里面家在文章，比如使用Firefox.


![](https://farm8.staticflickr.com/7406/16445870201_b98e8da6d9_b.jpg)


#### 订阅新闻 ####

你可以通过Feednix来为你的Feedly账户增加任何一种RSS新闻。
要这么做，仅仅只需要按下"a"键，它会显示一个"[ENTER FEED]:"的提示在屏幕上，然后按下"ENTER"
在选择完RSS新闻后，继续为它编写分组信息和分类。

![](https://farm8.staticflickr.com/7324/16421639296_b52ed3c52e_c.jpg)

#### 总结 ####


现在你知道了吧， Feednix 是一个非常友好的并且容易使用的命令行RSS阅读器。如果你是重度依赖命令行的用户或者是一个Feedly用户，Feednix 是肯定值得去尝试的。
我经常和Feednix的开发者Jarkore交流来解决一些问题。我想说，对于bug的报告和修复他非常的积极。
鼓励大家来试用Feednix，并且给他(Jarkore)一些回馈。
--------------------------------------------------------------------------------

via: http://xmodulo.com/feedly-rss-feed-command-line-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/chenzhijun)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://feedly.com/
[2]:https://github.com/Jarkore/Feednix
[3]:https://aur.archlinux.org/packages/feednix/
