[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11764-1.html)
[#]: subject: (Signal: A Secure, Open Source Messaging App)
[#]: via: (https://itsfoss.com/signal-messaging-app/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Signal：安全、开源的聊天应用
======

> Signal 是一款智能手机上的安全开源聊天应用。它还提供了适用于 Linux、Windows 和 macOS 的独立桌面应用。在本文中，我们来看看它的功能和可用性。

### 对于关注隐私的人来说，Signal 是 WhatsApp（和 Telegram）的绝佳替代品

![Signal App On Linux][1]

Signal 是一款关注隐私的开源应用。像[爱德华·斯诺登][2]这样的隐私权倡导者建议使用它。

它可能没有 Telegram 或 WhatsApp 这么多的功能。但是，如果你想在交流时增强隐私，这是一个可靠的开源方案。

你可以在智能手机（[iOS][3]/[Android][4]）上安装，也可以在 Linux、Windows 和 macOS 上安装。

### Signal 的功能

**注意：** 某些功能是智能手机特有的。你可能无法在桌面应用上看到所有功能。

另请注意，目前，Signal 需要电话号码才能注册。如果你不想公开自己的私人电话号码，则可以使用 Google 语音或类似服务。

正如我已经提到的，这是为增强你的隐私而量身定制的。因此，用户体验可能不是你见过“最佳”的。但是，从隐私/安全角度考虑，我认为这是一个不错的选择。

![Signal Features][5]

#### 消失的消息

你可以为对话中的消息设置一个计时器，以便根据它自动删除消息。

本质上，对话中的任何人都可以激活此功能。因此，你可以控制对话中的消息时保留还是消失。

#### 用作默认短信应用

如果你想在短信中使用开源应用，那么只需进入 Signal 的设置，并将其设置为短信和彩信的默认设置。

#### 屏幕安全

有一个巧妙的功能可以阻止应用内截图，它就是“屏幕安全”。

如果你开启它，那么你将无法为应用中的任何对话截图。你可以从应用设置中找到启用或禁用它的选项。

它可能并不是对所有人有用，但你可以尝试一下。

#### 安全数字

如果你想与朋友一起验证加密的安全性，只需点击个人资料并向下滚动找到“查看安全数字”。

你可以扫描验证或者看一眼并标记为已验证。

#### 锁定消息

如果你使用了锁（密码/指纹）来保护应用，那么即使你的设备已解锁，你也无法在通知中看到消息。

因此，当 Signal 处于锁定状态收到通知时，你会注意到通知的内容为 “**Locked Message**”，这对于注重隐私的用户来说是一个加分项。

#### 其它功能

![][6]

如你所期待的聊天应用，你可以使用几个标签，并且可以根据需要创建一个组。但是，你无法管理你的组，你只能添加成员和更改群头像。

此外，Signal 还为其应用支持生物识别。

### 在 Ubuntu/Linux 上安装 Signal

不幸的是，你无法在你的 Linux 发行版上找到 .deb 或者 .AppImage。因此，你需要根据[官方安装说明][7]在终端上安装。

在终端中输入以下内容：

```
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop
```

只需在终端中一个接一个地复制并粘贴命令。

[Download Signal for Other Devices][7]

### 我对 Signal 的想法

我已经使用 Signal 有几年了，它的功能已经得到了改善。但是，我仍然认为可以改善用户体验。

在隐私方面，（在我看来）这绝对是我们已有软件的一个很好的替代方案。你可以尝试一下，看看它的使用效果如何。

如果你想尝试一下它，也可以看看它的 [GitHub 页面][8]以获取最新的开发和 beta 版本。

与 WhatsApp 甚至 [Linux 上的 Telegram][9] 相比，Signal 可能不是流行的聊天应用。但是，你可以自己尝试一下，并鼓励你的朋友使用它。

你尝试过了吗？在下面的评论中，让我知道你对 “Signal” 的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/signal-messaging-app/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-shot.jpg?ssl=1
[2]: https://en.wikipedia.org/wiki/Edward_Snowden
[3]: https://apps.apple.com/us/app/signal-private-messenger/id874139669
[4]: https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms&hl=en_IN
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-phone.jpg?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-shot-1.jpg?ssl=1
[7]: https://signal.org/download/
[8]: https://github.com/signalapp
[9]: https://itsfoss.com/install-telegram-desktop-linux/
