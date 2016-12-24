在 OpenStack 云中测试 Fedora 24 Beta
===========================================

![](https://major.io/wp-content/uploads/2012/01/fedorainfinity.png)

虽然离 [Fedora 24][1] 还有几周，你现在可以就测试Fedora 24 Beta了。这是一个[窥探新特性][2]的好机会，并且可以帮助他们找出仍需要修复的 bug。

[Fedora Cloud][3] 镜像可以从你常用的[本地镜像][4]或者 [Fedora 的服务器][5]中下载。本篇文章我将向你展示如何将这个镜像导入 OpenStack 环境并且测试 Fedora 24 Beta。

最后说一下：这还是 beta 软件。目前对我来说是可靠的，但是你的体验可能会不同。我建议你等到正式版发布再在上面部署关键的应用。

### 导入镜像

旧版的 glance 客户端（版本1）允许你在 OpenStack 环境中导入一个可通过 URL 访问的镜像。由于我 OpenStack 云的连接速度（1 Gbps）比我家 (大约 20 mbps 上传速度)快，这个功能对我很有用。然而，从 URL 导入的功能[在 glance v2 中被移除了]。[OpenStackClient][7] 也不支持这个功能。

现在由两个选择：

- 安装旧版的 glance 客户端
- 使用 Horizon (网页面板)

获取旧版本的 glance 是有挑战性的。OpenStack liberty 版本的需求文件[对 glance 客户端没有最高版本上限][8]，并且很难找到让旧版客户端工作的依赖文件。

让我们使用 Horizon，这就是写这篇文章的原因。

### 在 Horizon 中添加一个镜像

登录 Horizon 面板，点击 Compute->Image。点击页面右上方的“+ Create Image”，一个新的窗口会显示出来。并且窗口中有这些信息：

- **Name**: Fedora 24 Cloud Beta
- **Image Source**: 镜像位置
- **Image Location**: http://mirrors.kernel.org/fedora/releases/test/24_Beta/CloudImages/x86_64/images/Fedora-Cloud-Base-24_Beta-1.6.x86_64.qcow2
- **Format**: QCOW2 – QEMU 模拟器
- **Copy Data**: 确保勾选了

完成后，你会看到这个：

![](https://major.io/wp-content/uploads/2016/05/horizon_image.png)

点击“创建镜像（Creat Image）”，接着镜像列表会显示一段时间的 Saving 信息。一旦切换到 Active，你就可以构建一个实例了。

### 构建实例

既然我们在使用 Horizon，我们可以在此完成构建过程。

在镜像列表页面，找出我们上传的镜像并且点击右边的启动实例（Launch Instance）。一个新的窗口会显示出来。镜像名（Image Name）下拉框中应该已经选择了 Fedora 24 Beta 的镜像。在这里，选择一个实例名，选择一个安全组和密钥对（在 Access & Security 标签中）和网络（在 Networking 标签）。确保选择有足够容量的存储（m1.tiny 不太够）。

点击启动（Launch）并且等待实例启动。

一旦实例构建完成，你能以用户 fedora 通过 ssh 连接到实例。如果你的[安全组允许连接][9]并且你的密钥对正确配置了，你应该进入到 Fedora 24 Beta 中了！

还不确定接下来做什么？有下面几点建议：

- 升级所有的包并且重启（确保你测试的是最新的更新）
- 安装一些熟悉的应用并且验证它们可以正常工作
- 测试你已有的自动化或者配置管理工具
- 打开 bug 报告

--------------------------------------------------------------------------------

via: https://major.io/2016/05/24/test-fedora-24-beta-openstack-cloud/

作者：[major.io][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://major.io/about-the-racker-hacker/
[1]: https://fedoraproject.org/wiki/Releases/24/Schedule
[2]: https://fedoraproject.org/wiki/Releases/24/ChangeSet
[3]: https://getfedora.org/en/cloud/
[4]: https://admin.fedoraproject.org/mirrormanager/mirrors/Fedora/24/x86_64
[5]: https://getfedora.org/en/cloud/download/
[6]: https://wiki.openstack.org/wiki/Glance-v2-v1-client-compatability
[7]: http://docs.openstack.org/developer/python-openstackclient/
[8]: https://github.com/openstack/requirements/blob/stable/liberty/global-requirements.txt#L159
[9]: https://major.io/2016/05/16/troubleshooting-openstack-network-connectivity/
