Ubuntu 每日技巧- 自动备份Ubuntu 14.04到Box云存储上
================================================================================
如今你已经升级或者安装了Ubuntu 14.04， 但是还有另外一件保护你的新系统需要做的事情：备份！

Ubuntu内置了一个备份工具 **Déjà Dup Backup Tool**。它允许你备份你的系统并保存在本地或者通过不同的协议保存在远端服务器上。

还有许多其他的工具来备份你的Ubuntu计算机与文件。你可以通过[Dropbox 客户端][1]或者其他云服务来自动备份你的重要文档。你也有可能使用UbuntuOne来备份你的机器，但现在这不再是一个选择了。

另外一个可以用来备份你机器的云存储是Box。Box是一个很棒的服务，它是Dropbox的一个替代品。Box云存储的一个缺点是它没有Dropbox那样的Linux客户端。

它的一个好处是它有Dropbox不支持的通过WebDAV协议来备份你的文件。

本篇简要教程会教你如何使用Box云服务来自动备份你的Ubuntu机器。

在你开始之前，你首先要确保你有一个Box账号，如果没有，请先前去注册。

当你完成后，打开**Dash** 并搜索备份。或者进入**选项 (Gear) –> 系统设置 –> 备份**

![ubuntu1404-backup](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup.png)

接下来，选择备份的文件夹(即保存)，忽略的文件夹，以及在哪里保存备份。位置是我们要首先设置的。对于存储位置，我们选择**WebDAV** 。接下来输入服务器地址(如下所示), 文件夹应该是/dav/，并输入你的Box用户名。

![ubuntu1404-backup-1](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup11.png)

回到概况，选择**立即备份**。

![ubuntu1404-backup-2](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup2.png)

你会被要求输入密码。输入后继续。

![ubuntu1404-backup-3](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup3.png)

在下一屏中，你可以选择是否用密码加密备份。我建议不要这么做，因为忘记密码可能也会有危险。（译注：当然那些秘密的东西你就不要备份到这里了）

第一次备份后，前往打开定期备份设置。接着进入计划并选择对于你最好的备份计划。

要打开定期备份，要将右上角的滑动条拖到右边（即变成橙色的“ON”）。

![ubuntu1404-backup-4](http://www.liberiangeek.net/wp-content/uploads/2014/04/ubuntu1404backup4.png)

就是这样！你现在可以进入'保存的文件夹' 并开始加入更多需要备份的文件夹。

体验一下吧！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-automatically-backing-up-ubuntu-14-04-to-box-cloud-storage/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-get-dropbox-installed-in-ubuntu-14-04-trusty-tahr/
