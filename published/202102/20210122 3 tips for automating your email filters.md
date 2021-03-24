[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13073-1.html)
[#]: subject: (3 tips for automating your email filters)
[#]: via: (https://opensource.com/article/21/1/email-filter)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

3 个自动化电子邮件过滤器的技巧
======

> 通过这些简单的建议，减少你的电子邮件并让你的生活更轻松。

![](https://img.linux.net.cn/data/attachment/album/202102/01/103638ozdejmy6eycm6omx.jpg)

在前几年，这个年度系列涵盖了单个的应用。今年，我们除了关注 2021 年的策略外，还将关注一体化解决方案。欢迎来到 2021 年 21 天生产力的第十二天。

如果有一件事是我喜欢的，那就是自动化。只要有机会，我就会把小任务进行自动化。早起打开鸡舍的门？我买了一扇门，可以在日出和日落时开门和关门。每天从早到晚实时监控鸡群？用 Node-RED 和 [OBS-Websockets][2] 稍微花点时间，就能搞定。

我们还有电子邮件。几天前，我写过关于处理邮件的文章，也写过关于标签和文件夹的文章。只要做一点前期的工作，你就可以在邮件进来的时候，你就可以自动摆脱掉大量管理邮件的开销。

![Author has 480 filters][3]

*是的，我有很多过滤器。（Kevin Sonney, [CC BY-SA 4.0][4]）*

有两种主要方式来过滤你的电子邮件：在服务端或者客户端上。我更喜欢在服务端上做，因为我不断地在尝试新的和不同的电子邮件客户端。（不，真的，我光这个星期就已经使用了五个不同的客户端。我可能有问题。）

无论哪种方式，我都喜欢用电子邮件过滤规则做几件事，以使我的电子邮件更容易浏览，并保持我的收件箱不混乱。

  1. 将不紧急的邮件移到“稍后阅读”文件夹中。对我而言，这包括来自社交网络、新闻简报和邮件列表的通知。
  2. 按列表或主题给消息贴上标签。我属于几个组织，虽然它们经常会被放在“稍后阅读”文件夹中，但我会添加第二个或第三个标签，以说明该来源或项目的内容，以帮助搜索时找到相关的东西。
  3. 不要把规则搞得太复杂。这个想法让我困难了一段时间。我想把邮件发送到某个文件夹的所有可能情况都加到一个规则里。如果有什么问题或需要添加或删除的东西，有一个大规则只是让它更难修复。

![Unsubscribe from email][5]

*点击它，点击它就行！（Kevin Sonney, [CC BY-SA 4.0][4]）*

说了这么多，还有一件事我一直在做，它有助于减少我花在电子邮件上的时间：退订邮件。两年前我感兴趣的那个邮件列表已经不感兴趣了，所以就不订阅了。产品更新通讯是我去年停止使用的商品？退订！这一直在积极解放我。我每年都会试着评估几次列表中的邮件信息是否（仍然）有用。

过滤器和规则可以是非常强大的工具，让你的电子邮件保持集中，减少花在它们身上的时间。而点击取消订阅按钮是一种解放。试试就知道了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/email-filter

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://opensource.com/article/20/6/obs-websockets-streaming
[3]: https://opensource.com/sites/default/files/day12-image1_0.png
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/day12-image2_0.png
