[#]: collector: (lujun9972)
[#]: translator: (alim0x)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12878-1.html)
[#]: subject: (Creating a Chat Bot with Recast.AI)
[#]: via: (https://opensourceforu.com/2019/11/creating-a-chat-bot-with-recast-ai/)
[#]: author: (Athira Lekshmi C.V https://opensourceforu.com/author/athira-lekshmi/)

用 Recast.AI 创建一个聊天机器人
======

[![][1]][2]

> 据 Gartner 2018 年 2 月的报告，“到 2020 年，25% 的客户服务和支持业务将在参与渠道中整合虚拟客户助理（VCA）或聊天机器人技术，而 2017 年只有不到 2%。”鉴于此，读者会发现本教程对理解开源的 Recast.AI 机器人创建平台的工作原理很有帮助。

聊天机器人，包括基于语音的以及其他技术的，已经实际使用了有一阵子了。从让用户参与谋杀解密游戏，到帮助完成房地产交易和医疗诊断，聊天机器人已经跨越了多个领域。

有许多平台可以让用户创建和部署机器人。Recast.AI（在被 SAP 收购之后现在是 SAP Conversational AI）是其中的先行者。

酷炫的界面、协作性以及它所提供的分析工具，让它成为流行的选择。

正如 Recast 官方网站说的，“它是一个创建、训练、部署和监控智能机器人的终极协作平台。”

### 创建一个基础的机器人

让我们来看看如何在 Recast 创建一个基础的机器人。

  1. 在 https://cai.tools.sap 创建一个账户。注册可以使用电子邮箱或者 Github 账户。
  2. 在你登录之后，你会进入仪表板。点击右上角 “+” 新建机器人图标新建一个机器人。
  3. 在下一个界面，你会看到一系列可选的预定义技能。暂时选择<ruby>问候<rt>Greetings</rt></ruby>”（图 1）。这个机器人已经经过训练，能够理解基本的问候。
  ![图 1: 设置机器人属性][3]
  4. 给机器人提供一个名字。目前来说，你可以让机器人讲一些笑话，所以我们将它命名为 Joke Bot，选择英语作为默认语言。
  5. 因为你不会处理任何敏感信息，所以在数据策略下选择非个人数据。然后选择公共机器人选项并点击创建一个机器人。

所以这就是你在 Recast 平台创建的机器人。

### 开发一个机器人的五个阶段

用 Recast 官方博客的话说，在机器人的生命中有五个阶段。

  * 训练——教授机器人需要理解的内容
  * 构建——使用机器人构建工具创建你的对话流
  * 编写代码——将机器人连接到外部 API 或数据库
  * 连接——将机器人发布到一个或多个消息平台
  * 监控——训练机器人让它更敏锐，并且了解其使用情况

### 通过意图训练机器人

你可以在仪表板上看到搜索、分叉或创建一个<ruby>意图<rt>intent</rt></ruby>的选项。“‘意图’是一系列含义相同但构造不同的表达。‘意图’是你的机器人理解能力的核心。每个‘意图’代表了机器人可以理解的一种想法。”（摘自 Recast.AI 网站）

![图 2: 机器人面板][4]

就像先前定的，你需要一个讲笑话的机器人。所以底线是这个机器人可以理解用户在要求它讲笑话，它不应该在用户仅仅说了“Hi”的情况下回复一个笑话——这可不妙。把用户可能说的话进行分组，比如：

```
Tell me a joke.（给我讲个笑话。）
Tell me a funny fact.（告诉我一个有趣的事实。）
Can you crack a joke?（你可以讲个笑话吗？）
What’s funny today?（今天有什么有趣的？）
```
……

在继续从头开始创建意图之前，让我们来看看搜索/分叉选项。在搜索框输入 “Joke”（图 3）。系统给出了全球的 Recast 用户创建的公开的意图清单，这就是为什么说 Recast 天然就是协作性质的。所以其实没有必要从头开始创建所有的意图，可以在已经创建的基础上进行构建。这就降低了训练具有常见意图的机器人所需的投入。

![图 3: 搜索一个意图][5]

  * 选择列表中的第一个意图并将其分叉到机器人上。
  * 点击<ruby>分叉<rt>Fork</rt></ruby>按钮。这个意图就添加到了机器人中（图 4）。
  ![图 4: @joke 意图][6]
  * 点击意图 @joke，会显示出这个意图中已经存在的<ruby>表达<rt>expression</rt></ruby>列表（图 5）。
  ![图 5: 预定义表达][7]
  * 向其添加更多的表达（图 6）。
  ![图 6: 建议的表达][8]

添加了一些表达之后，机器人会给出一些建议，像图 7 展示的那样。选择几个将它们添加到意图中。你还可以根据机器人的上下文，标记你自己的自定义实体来检测关键词。

![图 7: 建议的表达][9]

### 技能

<ruby>技能<rt>skill</rt></ruby>是一块有明确目的的对话，机器人可以据此运行并达到目标。它可以像打招呼那么简单，也可以更复杂，比如基于用户提供的信息提供电影建议。

技能需要的不能只是一对问答，它需要多次交互。比如考虑一个帮你学习汇率的机器人。它一开始会问原货币，然后是目标货币，最后给出准确回应。结合技能可以创建复杂的对话流。

下面是如何给笑话机器人创建技能：

  * 去到 构建（Build） 页。点击 “+” 图标创建技能。
  * 给技能命名 “Joke”（图 8）
  ![图 8: 技能面板][10]
  * 创建之后，点击这个技能。你会看到四个标签。<ruby>读我<rt>Read me</rt></ruby>、<ruby>触发器<rt>Triggers</rt></ruby>、<ruby>需求<rt>Requirements</rt></ruby>和 <ruby>动作<rt>Actions</rt></ruby>。
  * 切换到需求页面。只有在笑话意图存在的时候，你才应该存储信息。所以，像图 9 那样添加一个需求。
  ![图 9: 添加一个触发器][11]

由于这个简单的使用范例，你不需要在需求选项卡中考虑任何特定的需求，但可以考虑只有当某些关键字或实体出现时才需要触发响应的情况——在这种情况下你需要需求。

需求是某个技能执行动作之前需要检索的意图或实体。需求是对话中机器人可以使用的重要信息。例如用户的姓名或位置。一旦一个需求完成，相关的值就会存储在机器人的内存中，供整个对话使用。

现在让我们转到动作页面设置<ruby>回应<rt>response</rt></ruby>（参见图 10）。

![图 10: 添加动作][12]

点击添加<ruby>新消息组<rt>new message group</rt></ruby>。然后选择<ruby>发送消息<rt>Send message</rt></ruby>并添加一条文本消息，在这个例子中可以是任何笑话。当然，你肯定不想让你的机器人每次都说一样的笑话，你可以添加多条消息，每次从中随机选择一条。

![图 11: 添加文本消息][13]

### 频道集成

一个成功的机器人还依赖于它的易得性。Recast 有不少的内置消息频道集成，如 Skype for Business、Kik Messenger、Telegram、Line、Facebook Messenger、Slack、Alexa 等等。除此之外，Recast 还提供了 SDK 用于开发自定义的频道。

此外，Recast 还提供一个可立即使用的网页聊天（在连接页面中）。你可以自定义颜色主题、标题、机器人头像等。它给你提供了一个可以添加到页面的脚本标签。你的界面现在就可以使用了（图 12）。

![图 12: 设置网络聊天][14]

网页聊天的代码是开源的，开发者可以更方便地定制外观、标准回应类型等等。面板提供了如何将机器人部署到各种频道的逐步过程说明。这个笑话机器人部署在 Telegram 和网页聊天上，就像图 13 展示的那样。

![图 13: 网页聊天部署][15]

![图 14: Telegram 中开发的机器人][16]

### 还有更多

Recast 支持多语言，创建机器人的时候选择一个语言作为基础，但之后你有选项可以添加更多你想要的语言。

![图 15: 多语言机器人][17]

这里的例子是一个简单的静态笑话机器人，实际使用中可能需要更多的和不同系统的交互。Recast 有 Web 钩子功能，用户可以连接到不同的系统来获取回应。同时它还有详细的 API 文档来帮助使用平台的每个独立功能。

至于分析，Recast 有一个监控面板，帮助你了解机器人的准确度以及更加深入地训练机器人。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/creating-a-chat-bot-with-recast-ai/

作者：[Athira Lekshmi C.V][a]
选题：[lujun9972][b]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/athira-lekshmi/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/04/Build-ChatBoat.jpg?resize=696%2C442&ssl=1 (Build ChatBoat)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/04/Build-ChatBoat.jpg?fit=900%2C572&ssl=1
[3]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-1-Setting-the-bot-properties.jpg
[4]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-2-Setting-the-bot-properties.jpg
[5]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-3-Searching-an-intent.jpg
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-4-@joke-intent.jpg
[7]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-5-Predefined-expressions.jpg
[8]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-6-Suggested-expressions.jpg
[9]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-7-Suggested-expressions.jpg
[10]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-8-Skills-dashboard.jpg
[11]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-9-Adding-a-trigger.jpg
[12]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-10-Adding-actions.jpg
[13]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-11-Adding-text-messages.jpg
[14]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-12-Setting-up-webchat.jpg
[15]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-13-Webchat-deployed.jpg
[16]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-14-Bot-deployed-in-Telegram.jpg
[17]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-15-Multi-language-bot.jpg
[18]: https://secure.gravatar.com/avatar/d24503a2a0bb8bd9eefe502587d67323?s=100&r=g
[19]: https://opensourceforu.com/author/athira-lekshmi/
[20]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[21]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
