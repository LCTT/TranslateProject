[#]: subject: "An open source alternative to Microsoft Exchange"
[#]: via: "https://opensource.com/article/21/9/open-source-groupware-grommunio"
[#]: author: "Markus Feilner https://opensource.com/users/mfeilner"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13833-1.html"

微软 Exchange 的一个开源替代方案
======

> 开源用户现在有了一个强大的、功能齐全的群件选择。

![](https://img.linux.net.cn/data/attachment/album/202109/29/141404pesw8xgh8oohwhjh.jpg)

多年来，微软 Exchange 作为一个平台牢牢统治着群件环境。然而，在 2020 年末，一个奥地利的开源软件开发商推出了 [grommunio][2]，这是一个群件服务器和客户端，其外观和感觉让 Exchange 和 Outlook 用户感到很熟悉。

grmmunio 项目可以很好地替代 Exchange。开发者以与微软相同的方式将组件连接到平台上，它们支持 RPC （远程过程调用）与 HTTP 协议。据开发者介绍，grommunio 还包括许多常见的群件接口，如 IMAP、POP3、SMTP、EAS（Exchange ActiveSync）、EWS（Exchange Web Services）、CalDAV 和 CardDAV。有了这样广泛的支持，grommunio 可以顺利地整合到现有的基础设施中。

用户会注意到对 Outlook、Android 和 iOS 客户端来说几乎没有区别。当然，作为开源软件，它也支持其他客户端。由于集成了原生的 Exchange 协议，Outlook 和智能手机与 grommunio 的通信就像与微软 Exchange 服务器一样。日常的企业用户可以继续使用他们现有的客户端，而 grommunio 服务器则在后台安静地运行。

### 不仅仅是邮件

除了邮件功能外，grommunio 界面还提供了日历系统。可以直接在日历显示中或在一个新标签中点击创建约会。这很直观，正如你对现代工具的期望。用户可以创建、管理和分享日历以及地址簿。私人联系人或普通联系人都支持，而且你可以与同事分享一切。

任务管理在左边的下拉菜单中显示任务列表，它们可以有一个所有者和多个合作者。你可以为每个任务指定截止日期、类别、附件和其他属性。笔记可以以同样的方式被管理并与其他团队成员共享。

### 聊天、视频会议和文件同步

除了现代群件的所有标准功能外，grommunio 还提供聊天、视频会议和文件同步功能。它为企业实现了大规模的全面整合，具有极高的性能。对于开源的推动者来说，这是一个简单的选择，对于系统管理员来说，这是一个强大的选择。因为 grommunio 的目标是整合而不是重新发明，所以所有的组件都是标准的开源工具。

![Screenshot of grommunio meeting space][3]

*用于高级视频会议的 Jitsi 集成（Markus Feilner, [CC BY-SA 4.0][4]）*

在 grommunio 会议功能的背后是 [Jitsi][5]，它以熟悉的用户界面顺利地集成到 grommunio 的用户界面中。完全集成和集中管理的聊天功能是基于 [Mattermost][6]。

![Screenshot of grommunio's town square for chat][7]

*用于聊天的 Mattermost（Markus Feilner，[CC BY-SA 4.0][4]）*

[ownCloud][8] 承诺提供企业级的文件共享和同步，在点击“文件”按钮后开始。

![Screenshot of grommunio file sharing space][9]

*用于文件同步和交换的 ownCloud（Markus Feilner，[CC BY-SA 4.0][4]）*

grommunio 项目有一个强大的管理界面，包括角色、域和组织管理、预测性监测和自助服务门户。基于 shell 的向导指导管理员完成安装和从微软 Exchange 迁移数据。开发团队正在不断努力，以实现更好的整合和更集中的管理，并随之为管理员提供更好的工作流程。

![Screenshot of grommunio dashboards][10]

*grommunio 的管理界面（Markus Feilner, [CC BY-SA 4.0][4]）*

### 探索 grommunio

grommunio 项目的目标很高，但它的开发者已经付出了努力，这一点很明显。一家专门从事税务咨询的德国托管服务机构最近宣布，他们的客户可以使用 grommunio，这是一个德国数据保护法特别严厉的行业。grommunio 项目做得很好：将现有的、成功的概念干净地结合在一起，实现了开放、安全和符合隐私的通信。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/open-source-groupware-grommunio

作者：[Markus Feilner][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mfeilner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://grommunio.com/en/
[3]: https://opensource.com/sites/default/files/uploads/jitsi_0.png (grommunio meeting space)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/20/5/open-source-video-conferencing
[6]: https://opensource.com/education/16/3/mattermost-open-source-chat
[7]: https://opensource.com/sites/default/files/uploads/mattermost.png (grommunio's town square for chat)
[8]: https://owncloud.com/
[9]: https://opensource.com/sites/default/files/uploads/owncloud_0.png (Owncloud for file synchronization and exchange)
[10]: https://opensource.com/sites/default/files/uploads/grommunio_interface_0.png (Screenshot of grommunio dashboards)
