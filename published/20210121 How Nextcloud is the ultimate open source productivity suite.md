[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13077-1.html)
[#]: subject: (How Nextcloud is the ultimate open source productivity suite)
[#]: via: (https://opensource.com/article/21/1/nextcloud-productivity)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Nextcloud 是如何成为终极开源生产力套件的
======

> Nextcloud 可以取代你用于协作、组织和任务管理的许多在线应用。

![](https://img.linux.net.cn/data/attachment/album/202102/02/121553uhl3pjljjkhj0h8p.jpg)

在前几年，这个年度系列涵盖了单个的应用。今年，我们除了关注 2021 年的策略外，还将关注一体化解决方案。欢迎来到 2021 年 21 天生产力的第十一天。

基于 Web 的服务几乎可以在任何地方访问你的数据，它们每小时可以支持数百万用户。不过对于我们中的一些人来说，由于各种原因，运行自己的服务比使用大公司的服务更可取。也许我们的工作是受监管的或有明确安全要求。也许我们有隐私方面的考虑，或者只是喜欢能够自己构建、运行和修复事物。不管是什么情况，[Nextcloud][2] 都可以提供你所需要的大部分服务，但是是在你自己的硬件上。

![NextCloud Dashboard displaying service options][3]

*Nextcloud 控制面板（Kevin Sonney, [CC BY-SA 4.0][4]）*

大多数时候，当我们想到 Nextcloud 时，我们会想到文件共享和同步，类似于 Dropbox、OneDrive 和 Google Drive 等商业产品。然而，如今，它是一个完整的生产力套件，拥有电子邮件客户端、日历、任务和笔记本。

有几种方法可以安装和运行 Nextcloud。你可以把它安装到裸机服务器上、在 Docker 容器中运行，或者作为虚拟机运行。如果可以考虑，还有一些托管服务将为你运行 Nextcloud。最后，有适用于所有主流操作系统的应用，包括移动应用，以便随时访问。

![Nextcloud virtual machine][5]

*Nextcloud 虚拟机（Kevin Sonney, [CC BY-SA 4.0][4]）*

默认情况下，Nextcloud 会安装文件共享和其他一些相关应用（或附加组件）。你可以在管理界面中找到“应用”页面，这里允许你安装单个附加组件和一些预定义的相关应用捆绑。对我而言，我选择了 “Groupware Bundle”，其中包括“邮件”、“日历”、“联系人”和 “Deck”。“Deck” 是一个轻量级的看板，用于处理任务。我也安装了“记事本”和“任务”应用。

Nextcloud “邮件” 是一个非常直白的 IMAP 邮件客户端。虽然 Nextcloud 没有将 IMAP 或 SMTP 服务器作为软件包的一部分，但你可以很容易地在操作系统中添加一个或使用远程服务。“日历”应用是相当标准的，也允许你订阅远程日历。有一个缺点是，远程日历（例如，来自大型云提供商）是只读的，所以你可以查看但不能修改它们。

![NextCoud App Interface][6]

*Nextcloud 应用界面 （Kevin Sonney, [CC BY-SA 4.0][4]）*

“记事本” 是一个简单的文本记事本，允许你创建和更新简短的笔记、日记和相关的东西。“任务” 是一款待办事项应用，支持多个列表、任务优先级、完成百分比以及其他一些用户期待的标准功能。如果你安装了 “Deck”，它的任务卡也会被列出来。每个看板都会显示自己的列表，所以你可以使用 “Deck” 或 “任务” 来跟踪完成的内容。

“Deck” 本身就是一个看板应用，将任务以卡片的形式呈现在流程中。如果你喜欢看板流程，它是一个追踪进度的优秀应用。

![Taking notes][7]

*做笔记 （Kevin Sonney, [CC BY-SA 4.0][4]）*

Nextcloud 中所有的应用都原生支持通过标准协议进行共享。与一些类似的解决方案不同，它的分享并不是为了完成功能列表中的一项而加上去的。分享是 Nextcloud 存在的主要原因之一，所以使用起来非常简单。你还可以将链接分享到社交媒体、通过电子邮件分享等。你可以用一个 Nextcloud 取代多个在线服务，它在任何地方都可以访问，以协作为先。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/nextcloud-productivity

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://nextcloud.com/
[3]: https://opensource.com/sites/default/files/day11-image1_0.png
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/pictures/nextcloud-vm.png (Nextcloud virtual machine)
[6]: https://opensource.com/sites/default/files/pictures/nextcloud-app-interface.png (NextCoud App Interface)
[7]: https://opensource.com/sites/default/files/day11-image3.png (Taking notes in Nextcloud)
