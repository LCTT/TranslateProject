开始使用 Pidgin：Skype for Business 的开源替代品
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/meeting-team-listen-communicate.png?itok=KEBP6vZ_)
技术正处在一个有趣的十字路口，Linux 统治服务器领域，但微软统治企业桌面。 Office 365、Skype for Business、Microsoft Teams、OneDrive、Outlook ......等等，这些是支配企业工作空间的微软软件和服务。

如果你可以使用免费和开源程序替换该专有软件，并使其与你别无选择，但只能使用的 Office 365 的后端一起工作？是的，因为这正是我们要用 Pidgin 做的，它是 Skype 的开源替代品。

### 安装 Pidgin 和 SIPE

微软的 Office Communicator 变成了 Microsoft Lync，它成为我们今天所知的 Skype for Business。现在有针对 Linux 的[付费软件][1]提供了与 Skype for Business 相同的功能，但 [Pidgin][2] 是 GNU GPL 授权的完全免费且开源的选择。

Pidgin 可以在几乎每个 Linux 发行版的仓库中找到，因此，使用它不应该是一个问题。唯一不能在 Pidgin 中使用的 Skype 功能是屏幕共享，并且文件共享可能会失败，但有办法解决这个问题。

你还需要一个 [SIPE][3] 插件，因为它是使 Pidgin 成为 Skype for Business 替代品的秘密武器的一部分。请注意，`sipe` 库在不同的发行版中有不同的名称。例如，库在 System76 的 Pop_OS! 中是 `pidgin-sipe`，而在 Solus 3 仓库中是 `sipe`。

有了先决条件，你可以开始配置 Pidgin。

### 配置 Pidgin

首次启动 Pidgin 时，点击 **Add** 添加一个新帐户。在基本选项卡（如下截图所示）中，选择 **Protocol** 下拉菜单中的 **Office Communicator**，然后在 **Username** 字段中输入你的**公司电子邮件地址**。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_basic_account_screen_final.png?itok=1zoSbZjy)

接下来，点击高级选项卡。在 **Server[:Port]** 字段中输入 **sipdir.online.lync.com:443**，在 **User Agent** 中输入 **UCCAPI/16.0.6965.5308 OC/16.0.6965.2117**。

你的高级选项卡现在应该如下所示：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_advanced_account_screen.png?itok=Z6loRfGi)

你不需要对“代理”选项卡或“语音和视频”选项卡进行任何更改。只要确定，请确保 **Proxy type** 设置为 **Use Global Proxy Settings**，并且在语音和视频选项卡中，**Use silence suppression** 复选框为**取消选中**。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_account_proxy_screen.png?itok=iDgszWy0)

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_voiceandvideo_screen.png?itok=klkbt5hr)

完成这些配置后，点击 **Add**，系统会提示你输入电子邮件帐户的密码。

### 添加联系人

要将联系人添加到好友列表，请点击**好友窗口**中的 **Manage Accounts**。将鼠标悬停在你的帐户上，然后选择 **Contact Search** 查找你的同事。如果您在使用姓氏和名字进行搜索时遇到任何问题，请尝试使用你同事的完整电子邮件地址进行搜索，你就会找到正确的人。

你现在已经开始使用 Skype for Business 替代产品，该产品可为你提供 98％ 的功能，从你的桌面上消除专有软件。

Ray Shimko 将在 4 月 28 日至 29 日的 [LinuxFest NW][5] 上谈论[ Linux 在微软世界][4]。查看计划亮点或注册参加。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/pidgin-open-source-replacement-skype-business

作者：[Ray Shimko][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/shickmo
[1]:https://tel.red/linux.php
[2]:https://pidgin.im/
[3]:http://sipe.sourceforge.net/
[4]:https://www.linuxfestnorthwest.org/conferences/lfnw18/program/proposals/32
[5]:https://www.linuxfestnorthwest.org/conferences/lfnw18
