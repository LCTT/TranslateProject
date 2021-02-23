[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13084-1.html)
[#]: subject: (Use your Raspberry Pi as a productivity powerhouse)
[#]: via: (https://opensource.com/article/21/1/raspberry-pi-productivity)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

将你的树莓派用作生产力源泉
======

> 树莓派已经从主要为黑客和业余爱好者服务，成为了小型生产力工作站的可靠选择。

![](https://img.linux.net.cn/data/attachment/album/202102/04/103826pjbxb7j1m8ok6ezf.jpg)

在前几年，这个年度系列涵盖了单个的应用。今年，我们除了关注 2021 年的策略外，还将关注一体化解决方案。欢迎来到 2021 年 21 天生产力的第十六天。

[树莓派][2]是一台相当棒的小电脑。它体积小，功能却出奇的强大，而且非常容易设置和使用。我曾将它们用于家庭自动化项目、面板和专用媒体播放器。但它也能成为生产力的动力源泉么？

答案相当简单：是的。

![Geary and Calendar apps on the Raspberry Pi][3]

*Geary 和 Calendar 应用 （Kevin Sonney, [CC BY-SA 4.0][4]）*

基本的 [Raspbian][5] 安装包括 [Claw Mail][6]，这是一个轻量级的邮件客户端。它的用户界面有点过时了，而且非常的简陋。如果你是一个 [Mutt 用户][7]，它可能会满足你的需求。

我更喜欢安装 [Geary][8]，因为它也是轻量级的，而且有一个现代化的界面。另外，与 Claws 不同的是，Geary 默认支持富文本 （HTML） 邮件。我不喜欢富文本电子邮件，但它已经成为必要的，所以对它有良好的支持是至关重要的。

默认的 Raspbian 安装不包含日历，所以我添加了 [GNOME 日历][9] ，因为它可以与远程服务通信（因为我的几乎所有日历都在云提供商那里）。

![GTG and GNote open on Raspberry Pi][10]

*GTG 和 GNote（Kevin Sonney, [CC BY-SA 4.0][4]）*

那笔记和待办事项清单呢？有很多选择，但我喜欢用 [GNote][11] 来做笔记，用 [Getting-Things-GNOME!][12] 来做待办事项。两者都相当轻量级，并且可以相互同步，也可以同步到其他服务。

你会注意到，我在这里使用了不少 GNOME 应用。为什么不直接安装完整的 GNOME 桌面呢？在内存为 4Gb（或 8Gb）的树莓派 4 上，GNOME 工作得很好。你需要采取一些额外的步骤来禁用 Raspbian 上的默认 wifi 设置，并用 Network Manager 来代替它，但这个在网上有很好的文档，而且真的很简单。

GNOME 中包含了 [Evolution][13]，它将邮件、日历、笔记、待办事项和联系人管理整合到一个应用中。与 Geary 和 GNOME Calendar 相比，它有点重，但在树莓派 4 上却很稳定。这让我很惊讶，因为我习惯了 Evolution 有点消耗资源，但树莓派 4 却和我的品牌笔记本一样运行良好，而且资源充足。

![Evolution on Raspbian][14]

*Raspbian 上的 Evolution （Kevin Sonney, [CC BY-SA 4.0][4]）*

树莓派在过去的几年里进步很快，已经从主要为黑客和业余爱好者服务，成为了小型生产力工作站的可靠选择。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/raspberry-pi-productivity

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://www.raspberrypi.org/
[3]: https://opensource.com/sites/default/files/day16-image1.png
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://www.raspbian.org/
[6]: https://www.claws-mail.org/
[7]: http://www.mutt.org/
[8]: https://wiki.gnome.org/Apps/Geary
[9]: https://wiki.gnome.org/Apps/Calendar
[10]: https://opensource.com/sites/default/files/day16-image2.png
[11]: https://wiki.gnome.org/Apps/Gnote
[12]: https://wiki.gnome.org/Apps/GTG
[13]: https://opensource.com/business/18/1/desktop-email-clients
[14]: https://opensource.com/sites/default/files/day16-image3.png
