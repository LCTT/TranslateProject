[#]: subject: "5 open source alternatives to Zoom"
[#]: via: "https://opensource.com/article/21/9/alternatives-zoom"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13836-1.html"

5 个替代 Zoom 的开源软件
======

> 试试这些开源视频会议服务之一。

![](https://img.linux.net.cn/data/attachment/album/202109/30/114413ylalu7dcl5au575v.jpg)

我最近参加了 [实用开源信息（POSI）][2] 会议，它是在一个自由开源的视频会议平台上举行的。当我参加了一系列关于开源软件的实际用途的精彩讲座时，我意识到视频会议在过去几年里已经变得非常普遍。

如果说开源做了什么，那就是提供了选择，现在越来越多的工人有了远程工作的自由，在你的连接方式上有一个选择是非常有意义的。

有时，你需要一个全功能的视频会议应用，其中包括审核、演示模式和分组讨论室，而其他时候，你想做的只是给朋友打一个快速电话，以便看到对方的脸。

### Jitsi

[Jitsi][3] 是一个简单、随意、但强大的视频通话平台。你可以自己托管它，也可以在 [meet.jit.si][4] 的公共实例上使用它。它有可定制的 URL，可以很容易地与你想见面的朋友分享链接、通话中的聊天、管理控制，和通话录音。它的开发非常活跃，每年都会测试和发布一大批新功能。它是 Opensource.com 用于我们每周会议的平台。

### Signal

[Signal][5] 已经是一个流行的以安全为重点的聊天应用，最近它又增加了 [团体视频通话][6] 的功能。视频通话非常适合简单的会议，而且因为你只能与你的 Signal 联系人列表中的其他人见面，所以不用担心你的视频通话会议上有不速之客。当你尝试定位你应该参与开会的虚拟房间时，也没有来回的“电话标签”。这一切都发生在 Signal 中，因此无需猜测。

Signal 本身是非常直观的，视频功能非常适合其现有惯例。简而言之，只要你的联系人在使用 Signal，这就是一个不费力的视频通话平台。这是我用于个人联系的应用，我经常使用其视频通话功能与朋友和家人联系。

### P2p.chat

[P2p.chat][7] 是这些中最简单的一个，无论是设计还是实现。通过 WebRTC 工作，p2p.chat 是一个 Web 应用，允许你直接连接到你正在呼叫的人，而不需要托管服务器。p2p.chat 的界面并不多，但这也是其吸引力的另一部分。没有管理控制或演示模式，因为 p2p.chat 在很大程度上是科幻片中承诺的“视频电话”：与远方的人进行轻松的人对人（或人们对人们）视频通话。

你可以使用自定义的 URL 来动态地创建一个会议空间，所以它们相对容易记忆（除了小的随机部分）和输入。我和不在 Signal 上的朋友使用 p2p.chat，它从未让我失望过。

### BigBlueButton

如果你需要严格的管理控制和极端的灵活性，[BigBlueButton][8] 是你正在寻找的解决方案，它专为教室、会议和演讲而设计。有了 BigBlueButton，你可以让所有与会者静音，阻止和踢走一个与会者，创建分组讨论室，创建协作式白板，共享屏幕，进行演讲，以及记录会议。与会者可以“举起手”表示注意，并将他们的状态设定为非语言交流方式。它很容易使用，但它是一个严肃的平台，适用于重点和非常大的群体。我参加过一些使用 BigBlueButton 的技术会议，包括 [实用开源信息（POSI）][2]会议。

### Wire

[Wire][9] 是寻找托管视频聊天和群件客户端的企业客户的绝佳选择。它是 [AGPL][10] 许可，这个开源项目可用于桌面和服务器、安卓和 iOS。它具有视频通话、发信和文件共享的功能，因此，即使是远程会议，基本上也有亲自开会的所有便利。你可以在有限的时间内免费试用 Wire，然后为你的公司购买一份支持合同。另外，你也可以自己托管它。

### 开源视频聊天

没有理由满足于由你可能不完全信任的公司托管的专有视频通话。今天可用的开源选项对于与你的职业和个人生活中的所有人保持联系是非常好的。下次你想和朋友见面时，不妨试试这些解决方案之一。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/alternatives-zoom

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chat_video_conference_talk_team.png?itok=t2_7fEH0 (Two people chatting via a video conference app)
[2]: https://opensource.org/posicfp
[3]: http://jitsi.org
[4]: http://meet.jit.si
[5]: https://signal.org
[6]: https://support.signal.org/hc/en-us/articles/360052977792-Group-Calling-Voice-or-Video-with-Screen-Sharing
[7]: https://p2p.chat/
[8]: https://bigbluebutton.org/
[9]: https://wire.com/en/
[10]: https://opensource.org/licenses/AGPL-3.0
