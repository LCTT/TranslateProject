[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11856-1.html)
[#]: subject: (One open source chat tool to rule them all)
[#]: via: (https://opensource.com/article/20/1/open-source-chat-tool)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

一个通过 IRC 管理所有聊天的开源聊天工具
======

> BitlBee 将多个聊天应用集合到一个界面中。在我们的 20 个使用开源提升生产力的系列的第九篇文章中了解如何设置和使用 BitlBee。

![](https://img.linux.net.cn/data/attachment/album/202002/05/123636dw8uw34mbkqzmw84.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 将所有聊天都放到 BitlBee 中

即时消息和聊天已经成为网络世界的主要内容。如果你像我一样，你可能打开五六个不同的应用与你的朋友、同事和其他人交谈。关注所有聊天真的很痛苦。谢天谢地，你可以使用一个应用（好吧，是两个）将这些聊天整个到一个地方。

![BitlBee on XChat][2]

[BitlBee][3] 是作为服务运行的应用，它可以将标准的 IRC 客户端与大量的消息服务进行桥接。而且，由于它本质上是 IRC 服务器，因此你可以选择很多客户端。

BitlBee 几乎包含在所有 Linux 发行版中。在 Ubuntu 上安装（我选择的 Linux 桌面），类似这样：

```
sudo apt install bitlbee-libpurple
```

在其他发行版上，包名可能略有不同，但搜索 “bitlbee” 应该就能看到。

你会注意到我用的 libpurple 版的 BitlBee。这个版本能让我使用 [libpurple][4] 即时消息库中提供的所有协议，该库最初是为 [Pidgin][5] 开发的。

安装完成后，服务应会自动启动。现在，使用一个 IRC 客户端（图片中为 [XChat][6]），我可以连接到端口 6667（标准 IRC 端口）上的服务。

![Initial BitlBee connection][7]

你将自动连接到控制频道 &bitlbee。此频道对于你是独一无二的，在多用户系统上每个人都有一个自己的。在这里你可以配置该服务。

在控制频道中输入 `help`，你可以随时获得完整的文档。浏览它，然后使用 `register` 命令在服务器上注册帐户。

```
register <mypassword>
```

现在，你在服务器上所做的任何配置更改（IM 帐户、设置等）都将在输入 `save` 时保存。每当你连接时，使用 `identify <mypassword>` 连接到你的帐户并加载这些设置。

![purple settings][8]

命令 `help purple` 将显示 libpurple 提供的所有可用协议。例如，我安装了 [telegram-purple][9] 包，它增加了连接到 Telegram 的能力。我可以使用 `account add` 命令将我的电话号码作为帐户添加。

```
account add telegram +15555555
```

BitlBee 将显示它已添加帐户。你可以使用 `account list` 列出你的帐户。因为我只有一个帐户，我可以通过 `account 0 on` 登录，它会进行 Telegram 登录，列出我所有的朋友和聊天，接下来就能正常聊天了。

但是，对于 Slack 这个最常见的聊天系统之一呢？你可以安装 [slack-libpurple][10] 插件，并且对 Slack 执行同样的操作。如果你不愿意编译和安装这些，这可能不适合你。

按照插件页面上的说明操作，安装后重新启动 BitlBee 服务。现在，当你运行 `help purple` 时，应该会列出 Slack。像其他协议一样添加一个 Slack 帐户。

```
account add slack ksonney@myslack.slack.com
account 1 set password my_legcay_API_token
account 1 on
```

你知道么，你已经连接到 Slack 中，你可以通过 `chat add` 命令添加你感兴趣的 Slack 频道。比如：

```
chat add 1 happyparty
```

将 Slack 频道 happyparty 添加为本地频道 #happyparty。现在可以使用标准 IRC `/join` 命令访问该频道。这很酷。

BitlBee 和 IRC 客户端帮助我的（大部分）聊天和即时消息保存在一个地方，并减少了我的分心，因为我不再需要查找并切换到任何一个刚刚找我的应用上。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-chat-tool

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/uploads/productivity_9-1.png (BitlBee on XChat)
[3]: https://www.bitlbee.org/
[4]: https://developer.pidgin.im/wiki/WhatIsLibpurple
[5]: http://pidgin.im/
[6]: http://xchat.org/
[7]: https://opensource.com/sites/default/files/uploads/productivity_9-2.png (Initial BitlBee connection)
[8]: https://opensource.com/sites/default/files/uploads/productivity_9-3.png (purple settings)
[9]: https://github.com/majn/telegram-purple
[10]: https://github.com/dylex/slack-libpurple
[11]: mailto:ksonney@myslack.slack.com
