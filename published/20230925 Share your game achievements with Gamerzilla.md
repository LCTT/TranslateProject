[#]: subject: "Share your game achievements with Gamerzilla"
[#]: via: "https://fedoramagazine.org/share-your-game-achievements-with-gamerzilla/"
[#]: author: "Dennis Payne https://fedoramagazine.org/author/dulsi/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16264-1.html"

使用 Gamerzilla 分享你的游戏成就
======

![][0]

Gamerzilla 是一个开源游戏成就系统，用于存储和共享你的游戏成就。游戏使用 libgamerzilla 轻松添加成就。Gamerzilla 库是用 C 编写的，但也有其他语言的绑定。

两年前，我描述了如何设置 [Gamerzilla 服务器][4]。除了 .net 实现之外，还可以使用 php 和 python 实现。但你可能不想运行自己的服务器。这里介绍一个公共服务器和 Gnome 界面。

### 公共服务器

我的网络服务器现在托管了一个启用了公共注册的 [Gamerzilla][5] 实例。要创建帐户，请单击右上角的 “<ruby>签到<rt>Sign In</rt></ruby>” 链接。然后单击 “<ruby>登录<rt>Login</rt></ruby>” 按钮旁边的 “<ruby>注册<rt>Register</rt></ruby>” 链接。

用户帐户收集的信息非常少。只需输入用户名和密码。你不需要输入你的真实姓名或电子邮件地址。因此，忘记密码没有实现。

账户一开始是不可见的。如果你希望公众在登录后看到你的成就，请单击页面右上角你的用户名，然后选择 “<ruby>设为可见<rt>Make Visible</rt></ruby>”。新用户必须经过批准才能上传成就。目前没有显示你是否获得批准的指示。

### 获得成就

在获得第一个成就之前，你需要使用以下命令安装 Gamerzilla GNOME Shell 扩展：

````
sudo dnf install gnome-shell-extension
````

安装后，你需要注销并重新登录。需要使用以下命令启用扩展：

````
gnome-extensions enable gamerzilla@gamerzilla.identicalsoftware.com
````

游戏控制器图标出现在 GNOME Shell 的顶部栏中。

单击控制器图标并选择 “<ruby>首选项<rt>preferences</rt></ruby>”。在出现的屏幕上输入你的 Gamerzilla 网址，包括尾部斜杠，但不包含 UI 的“奖杯”地址。如果使用我的服务器，该值将为 `https://identicalsoftware.com/`。填写你的用户名和密码。单击保存。默认情况下启用自动连接。如果你不想始终连接，请禁用此功能。

![Gamerzilla Controller menu][6]

不幸的是，一个错误阻止了该 Shell 扩展立即工作。你需要注销并重新登录。解决这个问题是当务之急。

### 目前支持的游戏

Fedora 仓库中的多个游戏支持 Gamerzilla 成就。如果你想买一个来尝试一下，我建议试试 Shippy 1984、Seahorse Adventures 或 Anagramarama。一旦你完成一个级别，Seahorse Adventures 就会存储一些进度。如果你玩 Super Tux Kart，你可能已经取得了成就。只需启动游戏即可同步之前完成的任何成就。当成就完成时，Gamerzilla 不会显示任何通知，但游戏可能会自行实现。

### 更进一步

除了修复第一次连接的错误之外，我还想要一个本地浏览器来查看成就。这样你就可以查看所有游戏成就，而无需强制上传它们。

成就确实有消极的一面。有些人觉得有必要完成它们。如果成就非常困难，这可能会导致负面的游戏体验。我理解这种担忧，但有些人也喜欢这些方面。更重要的是，为了吸引和留住玩家，我觉得开源游戏需要一个游戏成就系统。

我们需要更多游戏来实现 Gamerzilla 成就。我们需要玩家表现出对这个系统的支持。我继续为我的游戏和我尝试的其他开源游戏添加成就。

*（题图：MJ/32ae3f54-b319-4db7-b874-eeacd1dcc4d2）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/share-your-game-achievements-with-gamerzilla/

作者：[Dennis Payne][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dulsi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/09/gamerzilla_achievenments-816x345.jpg
[2]: https://unsplash.com/@mparzuchowski?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/photos/geNNFqfvw48?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://linux.cn/article-15389-1.html
[5]: https://identicalsoftware.com/trophy/
[6]: https://fedoramagazine.org/wp-content/uploads/2023/09/gamerzilla_preferences.png
[0]: https://img.linux.net.cn/data/attachment/album/202310/08/191724uj7mmjw9ccd7pcl9.jpg