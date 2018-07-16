每日 Ubuntu 小技巧——在 Ubuntu 中手动安装任何版本的 Firefox
================================================================================

Firefox 是 Ubuntu 中主要的网络浏览器。它预装在系统中，并添加到默认的 Ubuntu 软件库中以获得 Firefox 最新版本的自动更新。

大多数用户并不用担心安装或使用 Firefox 的问题，因为没有什么问题了，它已经安装并可以使用。你获取的总是 Firefox 在 Ubuntu 软件库中的版本，除非更新 Canonical 的软件到最新版本。

现在，如果你想尝试其它的 Firefox 版本，你就必须手动下载并在 Ubuntu 中安装它，这个简短教程将指导你如何正确地在 Ubuntu 中做到这一点。

因为 Firefox 集成在 Ubuntu 中，如果你试图完全卸载它，很可能会破坏其它东西。因此要安装其它版本的最好办法就是为每个版本分别创建文件夹并进行符号连接。

### 在 Ubuntu 中下载并安装 Firefox ###

如果你想在 Ubuntu 中手动下载最新版本的 Firefox，进入它的[下载页面][1]。通过它你将可以获取到最新版本并安装它。

如果你想从初始版本安装其它版本的 Firefox，[访问这个页面][2]。在这你将看到从0.8开始的每个版本。

下载完你想要的版本之后，切换到 home 目录下的下载文件夹，因为 Ubuntu 的大多数文件被下载到了这里。

    cd ~/Downloads

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/firefoxmanualinstall.png)

### 配置 Firefox ###

由于大多数 Firefox 下载文件以.tar和.bz2格式保存，必须从这些压缩包中提取文件。有很多方法可以在 Ubuntu 中解压缩文件。

比如我下面使用的命令。很容易从.tar和.bz2中提取文件。

    tar -xjf firefox*.tar.bz2

解压后，将会有一个新的 Firefox 文件出现在下载文件夹中。这其中包含了所有的 Firefox 的文件和可执行文件。

由于我们不想删除当前安装的 Firefox，我们必须给每个版本的 Firefox 创建一个单独的文件夹。因此，对于 Firefox 版本30，使用下面的命令在/opt目录下创建一个包含新 Firefox 内容的文件夹。

    sudo mv firefox/ /opt/firefox30

现在，**/opt/firefox30/**目录包含的所有文件都是版本30的。

### 创建新的 Firefox 可执行符号链接 ###

默认情况下，Firefox 的可执行文件在这个路径下：**/user/bin/firefox**。我们想要做的是临时创建一个备份，这样我们就可以使用我们的自定义安装的可执行文件。

要做到这一点，运行下面的命令。
 
    sudo mv /usr/bin/firefox /usr/bin/firefox-old

现在，我们已经从其默认位置移动了 Firefox 的可执行文件，我们必须将默认位置链接到我们新的自定义安装文件。要做到这一点，运行下面的命令来创建我们版本30的一个符号链接。

    sudo ln -s /opt/firefox30/firefox /usr/bin/firefox

这样就设置完成了，我们自定义安装的 Firefox 是 Ubuntu 默认的。每一次启动 Firefox，它将通过之前的新链接加载新的可执行文件。

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/firefoxmanualinstall1.png)

以上方法同样适用于 64-bit 版本的 Firefox。

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/02/daily-ubuntu-tips-manually-install-any-version-of-firefox-in-ubuntu/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.mozilla.org/en-US/firefox/all/
[2]:https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/
