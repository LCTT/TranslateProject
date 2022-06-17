[#]: subject: "Software Privacy Day: Use Delta Chat, an open source chat tool"
[#]: via: "https://opensource.com/article/22/1/delta-chat-software-privacy-day"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14265-1.html"

Delta Chat：一个开源的聊天工具
======

> 最好的聊天应用是一个不属于聊天应用的应用。

![](https://img.linux.net.cn/data/attachment/album/202202/12/112502b27g761gws4j7s6z.jpg)

请考虑一下，当用户的数据被发布到互联网上，或通过互联网发布时，他们的数据究竟去了哪里。古老的聊天应用是互联网通信领域的一个手工行业，似乎在潮流中起起落落。人们使用聊天应用进行各种形式的对话，大多数人不会想到机器人正在记录和监控他们所说的话，无论是为了有效地定位广告还是只是为了建立一个档案供将来使用。这使得聊天应用特别容易受到不良的隐私做法的影响，但幸运的是，现在有几个开源的、注重隐私的应用，如 [Signal][2]、[Rocket.Chat][3] 和 [Mattermost][4]。我运行过 Mattermost 和 Rocket.Chat，我也在使用 Signal，但我最兴奋的应用是 Delta Chat，这个聊天服务非常方便，甚至不使用聊天服务器。相反，Delta Chat 使用的是你已经使用的最大规模和最多样化的开放信息系统：它使用电子邮件，通过聊天应用发送和接收信息，并以 [Autocrypt][5] 的端到端加密为特色。

### 安装 Delta Chat

Delta Chat 使用标准的电子邮件协议作为它的后端，但对于作为普通用户的你和我来说，它的外观和行为完全像一个聊天应用。也就是说你需要安装一个开源的 Delta Chat 应用。

在 Linux 上，你可以从 [Flatpak][6] 包或你的软件库中安装 Delta Chat。

在 macOS 和 Windows 上，从 [delta.chat/downloads][7] 下载一个安装程序。

在安卓系统上，你可以从 Play Store 或开源的 [F-droid 仓库][8] 安装 Delta Chat。

在 iOS 系统中，从 App Store 安装 Delta Chat。

因为 Delta Chat 使用电子邮件来传递信息，所以如果你不在你的聊天应用中，你也可以在收件箱中收到信息。是的，即使没有安装 Delta Chat，你也可以使用 Delta Chat！

### 配置 Delta Chat

当你第一次启动 Delta Chat 时，你必须登录到你的电子邮件账户。这往往是 Delta Chat 最难的部分，因为它要求你了解你的电子邮件服务器的详细信息，或者在你的电子邮件提供商的安全设置中创建一个“应用密码”。

如果你使用的是自己的服务器，并且所有配置都是默认的（993 端口用于 IMAP 接收，465 端口用于 SMTP 发出，启用了 SSL/TLS），那么你可以直接输入你的电子邮件地址和密码，然后继续。

![Delta Chat login][9]

如果你运行自己的服务器，但你有自定义设置，那么点击“<ruby>高级<rt>Advanced</rt></ruby>”按钮，输入你的设置。如果你使用一个不寻常的子域来用作你的邮件服务器，或一个自定义端口，或一个复杂的登录和密码配置，你可能需要这样做。

如果你使用的是 Gmail、Fastmail、Yahoo 或类似的电子邮件供应商，那么你必须创建一个应用密码，这样你就可以通过 Delta Chat 而不是网络浏览器登录到你的账户。许多电子邮件供应商限制登录，以避免无休止的机器人和脚本试图用暴力手段进入人们的账户，所以对你的供应商来说，Delta Chat 看起来很像机器人。当你授予 Delta Chat 特殊权限时，你就是在提醒你的电子邮件提供商，从一个远程应用发出大量的短信息是预期的行为。

每个电子邮件提供商都有不同的提供应用密码的方式，但 Fastmail（在我看来）是最简单的：

  1. 进入“<ruby>设置<rt>Settings</rt></ruby>”
  2. 点击“<ruby>密码和安全<rt>Passwords & Security</rt></ruby>”
  3. 在“<ruby>第三方应用<rt>Third-party apps</rt></ruby>”的旁边，点击“<ruby>添加<rt>Add</rt></ruby>”按钮

验证你的密码，并创建一个新的应用密码。使用你创建的应用密码登录 Delta Chat。

![Fastmail app password][11]

### 使用 Delta Chat 聊天

当你克服了登录的障碍，剩下的就很容易了。因为 Delta Chat 只使用电子邮件，你可以通过电子邮件地址而不是通过聊天程序的用户名或电话号码来添加朋友。从技术上讲，你可以在 Delta Chat 上添加任何电子邮件地址。毕竟，它只是一个有特定使用场景的电子邮件应用。不过，告诉你的朋友 Delta Chat 是很有礼貌的，而不是期望他们通过他们的电子邮件客户端与你进行随意的聊天。

无论你是在手机还是在电脑上运行这个应用，其外观都与你所期望的聊天应用完全一样。你可以发起聊天，发送消息，并通过加密文本与朋友闲聊。

![Delta Chat chat list][12]

### 开始聊天

Delta Chat 是去中心化的、完全加密的，并依赖于一个成熟的基础设施。多亏 Delta Chat，你可以选择你和你的联系人之间的服务器，你可以在私下里交流。没有需要安装的复杂的服务器，没有需要维护的硬件。这是一个看似复杂问题的简单解决方案，而且是开源的。我们有充分的理由去尝试它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/delta-chat-software-privacy-day

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://opensource.com/article/21/9/alternatives-zoom#signal
[3]: https://opensource.com/article/22/1/rocketchat-open-source-communications-platform-puts-data-privacy-first
[4]: https://opensource.com/education/16/3/mattermost-open-source-chat
[5]: https://autocrypt.org/
[6]: https://opensource.com/article/21/11/install-flatpak-linux
[7]: https://delta.chat/en/download
[8]: https://f-droid.org/app/com.b44t.messenger
[9]: https://opensource.com/sites/default/files/delta-chat-log-in_0.jpg (Delta Chat login)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://opensource.com/sites/default/files/fastmail-app-password.jpg (Fastmail app password)
[12]: https://opensource.com/sites/default/files/delta-chat-google-play-release-chat-list-light.png (Delta Chat chat list)
