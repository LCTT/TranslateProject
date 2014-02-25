每日Ubuntu小贴士 - 在Ubuntu中手动安装任何版本的Firefox
================================================================================
Firefox是Ubuntu中的主要网络浏览器。它预装在系统中，并添加到默认的Ubuntu软件仓库中以获得Firefox最新版本的自动更新。

大多数人不用担心安装或使用Firefox的问题，因为没有什么问题了，它已经安装并可以使用了。Firefox在Ubuntu的软件仓库中的版本你总得到是最新版本。

现在，如果你想尝试其他的Firefox版本，你就必须手动下载并在Ubuntu中安装它，这个简短的教程将告诉你如何正确地在Ubuntu中做到这一点。

因为Firefox集成在Ubuntu中，如果你试图完全卸载它，可以会破坏其他的东西。因此要安装其他版本最好的办法就是为每个版本分别创建文件夹并进行符号连接。

### 在Ubuntu中下载并安装Firefox ###

如果你想手动下载最新的Ubuntu版本Firefox，进入它的[下载页面][1]。通过它你将可以获取到最新版本并安装它。

如果你想从初始版本安装其他版本的Firefox，[访问这个页面][2]。在这你将看到从0.8开始的每个版本。

下载完你想要的版本之后，切换到home目录下的下载文件夹，因为Ubuntu的大多数文件被下载到了这。

    cd ~/Downloads

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/firefoxmanualinstall.png)

### 配置Firefox ###

由于大多数Firefox下载文件以.tar和.bz2格式保存，必须从这些压缩包中提取文件。有很多方法可以在Ubuntu中解压缩文件。

比如我下面使用的命令。很容易从.tar和.bz2中提取文件。

    tar -xjf firefox*.tar.bz2

解压后，将会有一个新的Firefox文件出现在下载文件夹中。这其中包含了所有的Firefox的文件和可执行文件。

由于我们不想删除当前安装的Firefox，我们必须给每个版本的Firefox创建一个单独的文件夹。因此，对于Firefox的版本30，使用下面的命令在/opt目录下创建一个包含新Firefox内容的文件夹。

    sudo mv firefox/ /opt/firefox30

现在，**/opt/firefox30/**目录包含的所有文件都是版本30的。

### 创建新的Firefox可执行符号链接 ###

默认情况下，Firefox的可执行文件在这个路径下：**/user/bin/firefox**。我们想要做的是临时创建一个备份，这样我们就可以使用我们的自定义安装的可执行文件。

要做到这一点，运行下面的命令。
 
    sudo mv /usr/bin/firefox /usr/bin/firefox-old

现在，我们已经从其默认位置移动了Firefox的可执行文件，我们必须将默认位置链接为我们的新的自定义安装的文件。要做到这一点，运行下面的命令来创建我们的30版本的一个符号链接。

    sudo ln -s /opt/firefox30/firefox /usr/bin/firefox

现在，我们自定义安装的Firefox是Ubuntu默认的。每一次启动Firefox，它将通过之前的新链接加载新的可执行文件。

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/firefoxmanualinstall1.png)

以上方法同样适用于64-bit版本的Firefox。

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/02/daily-ubuntu-tips-manually-install-any-version-of-firefox-in-ubuntu/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.mozilla.org/en-US/firefox/all/
[2]:https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/
