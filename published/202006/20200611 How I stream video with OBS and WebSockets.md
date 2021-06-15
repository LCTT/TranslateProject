[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12347-1.html)
[#]: subject: (How I stream video with OBS and WebSockets)
[#]: via: (https://opensource.com/article/20/6/obs-websockets-streaming)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

如何用 OBS 和 WebSockets 播放视频流
======

> 用这些简化了 WebSockets 的开源支持工具来控制你的流媒体。

![](https://img.linux.net.cn/data/attachment/album/202006/25/105128sdod30qqu4z5oooo.jpg)

[OBS][2] 是现在视频直播的主流之一。它是直播流媒体到 Twitch 的首选软件，Twitch 是近来最受欢迎的视频直播网站之一。有一些非常好的附加组件，可以让流媒体人从他们的手机或另一个屏幕上进行控制，而不影响正在运行的视频。事实证明，使用 [Node-RED][3] 和 [obs-websockets][4] 插件来构建自己的控制面板真的很容易。

![My OBS Control Dashboard][5]

*我的 OBS 控制仪表盘*

我知道你们很多人在想什么 —— “他在同一句话中提到了 WebSockets 和简单？”很多人在设置和使用 WebSockets 时遇到了困难，WebSockets 允许通过 Web 服务器的单一连接进行双向通信。Node-RED 内置了对 WebSockets 的支持，是让这一切变得简单的原因之一，至少与编写自己的客户端/服务器相比是如此。

在开始之前，请确保你已经安装和配置了 OBS。首先下载并安装[最新稳定版的 obs-websockets][6]插件。对于本文来说，默认的设置就可以了，但我强烈建议你之后按照说明来保护 obs-websockets 的安全。

接下来，[下载并安装 Node-RED][7]，可以在同一个系统上，也可以在不同的系统上（比如树莓派）。同样，默认的安装对我们这篇文章来说是够了，但最好按照他们网站上的指示进行安全安装。

现在是有趣的部分。启动 Node-RED，打开网页界面（默认在 <http://localhost:1880>），你有了一个空白的画布。打开右边的“汉堡”菜单，选择“<ruby>管理口味<rt>Manage Palate</rt></ruby>”。然后点击“安装”标签，搜索 `node-red-contrib-dashboard` 和 `node-red-contrib-rbe` 模块。

安装好这些模块后，点击右侧列表，将以下模块拖拽到画布上。

  * 1 Websocket Out
  * 1 Websocket In
  * 1 Debug
  * 1 Inject
  * 1 Switch
  * 1 Change
  * 2 JSON
  * 1 Catch

以下列顺序连接它们：

```
Inject->Button->Change->JSON->Websocket Out

Websocket In->JSON->Switch->RBE->Debug

Catch->Debug
```

![The basic flows][8]

*基本流程*

当 “Button” 被按下时（或 “Inject” 节点发送一个时间戳），有效载荷通过 “change” 节点发送，从 JSON 对象转换为字符串，然后发送到 “WebSocket Out” 节点。当 “WebSocket In” 节点收到消息后，会将其转换为 JSON 对象，如果不是重复的，则发送到 “Debug” 节点进行输出。而 “Catch” 节点会捕捉到任何错误，并将其放入 “Debug” 面板中。

那有效载荷里有什么呢？让我们设置好一切，一探究竟。

首先，双击 “Button” 打开设置对话框。先使用下拉菜单将有效载荷改为 “JSON”。在该字段中，添加以下内容：

```
{"request-type":"GetVersion"}
```

启用 “If msg arrives on input, emulate a button click” 复选框，然后点击 “Done” 关闭 “Button” 配置。当消息从 “Inject” 节点传来时，或者 UI 中的 “Button” 被按下，它将把 JSON 有效载荷发送到下一个节点。

![Setting up the button][9]

*设置 “Button”*

现在打开 “Change” 节点。我们要将 `msg.payload.message-id` 设置为 `msg._msgid`，方法是将第一个字段从 `payload` 改为 `payload.message-id`，然后使用第二个字段的下拉菜单将类型从 `String` 改为 `msg.`，然后我们将 `_msgid` 放入该字段。这样就会把唯一的消息 ID 复制到 JSON 对象的有效载荷中，这样每个请求就有一个唯一的 ID 进行跟踪。

然后将其发送到 “JSON” 节点，以便将 JSON 对象转换为字符串，然后传递给 “Websocket Out” 节点。打开 “Websocket Out” 节点，配置到 OBS 的连接。首先，将 `Type` 更改为 `Connect to`，然后单击铅笔图标以创建新的连接 URL。将其设置为 `ws://OBSMachine:4444/`，然后关闭对话框进行保存。`OBSMachine` 是 OBS 和 obs-websocket 运行的机器名称。例如，如果 Node-RED 运行在同一台机器上，则为 `ws://localhost:4444`，如果是在名为 `luxuria.local` 的机器上，则为 `ws://luxuria.local:4444`。关闭并更新 “Websocket Out” 节点。这将向 OBS 中的 WebSocket 发送有效载荷文本字符串。

![Websocket Out Node configuration][10]

*“Websocket Out” 节点配置*

进入 “WebSocket In” 流程！打开 “WebSocket In” 节点，并对其设置 `Type` 为 `Connect to` 和我们之前定义的连接的 URL（应自动填充）。接下来是第二个 “JSON” 节点，我们可以不用管它。它接受 OBS 的输出，并将其转换为有效载荷对象。

接下来，我们将从中过滤出常规的心跳和状态更新。打开 “Switch”，将 `Property` 值设置为 `payload["update-type"]`。现在从它下面的下拉菜单中选择 `Is Not Null`。点击 `+` 添加第二个选项，并从下拉菜单中选择 `otherwise`。

![Switch Node configuration][11]

*“Switch” 节点配置*

将 “Switch” 上的新输出直接连接到 “Debug” 节点的输入。

RBE 节点将过滤掉重复的内容，需要告诉它要观察什么字段。由于它应该连接到 “Switch” 的输出，而它只发送状态更新，所以这一点很重要，因为 obs-websocket 每隔几秒钟就会发送更新。默认情况下，RBE 会比较整个有效载荷对象，它将不断变化。打开 RBE 节点，将 `Property` 从 `payload` 改为 `payload.streaming`。如果 `payload` 的 `streaming` 值发生了变化，那么就把消息传递过去，否则就丢弃。

最后一步是将 “Debug” 节点的输出从 `msg.payload` 改为完整的 `msg` 对象。这使我们能够看到整个对象，有时在 `payload` 之外还有有用的信息。

现在，单击 “Deploy” 以激活更改。希望 WebSocket 节点下面会有绿色的 `Connected` 消息。如果它们是红色或黄色的，则连接 URL 可能不正确，需要更新，或者连接被阻止。请确保远程机器上的 4444 端口是开放的、可用的，并且 OBS 正在运行!

如果没有 RBE 节点对 `streaming` 值的过滤，调试面板（点击画布右侧的“虫子”图标）大约现在就会被心跳消息填满。点击 “Inject” 节点左边的按钮，发送一个模拟按钮点击的信号。如果一切顺利，你应该会看到一个对象到达，它有一个 `obs-websocket` 可以做的所有事情的列表。

![The response to "GetVersion"][12]

*对 “GetVersion” 的回应*

现在在另一个标签或窗口中打开 `http://localhost:1880/ui`。它应该显示一个单一的按钮。按下它! 调试面板应该会显示和之前一样的信息。

恭喜你！你已经发送了你的第一个（希望不是最后一个）WebSocket 消息！

这只是使用 obs-websockets 和 Node-RED 可以做的事情的起步。支持的完整文档记录在 obs-websockets 的 GitHub 仓库的 `protocol.md` 文件中。通过一点点的实验，你可以创建一个功能齐全的控制面板来启动和停止流媒体、改变场景，以及更多。如果你和我一样，在意识到之前，你就可以设置好各种控件了。

![OBS Websocket][13]

*如此多的能力让我有点疯*

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/obs-websockets-streaming

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_film.png?itok=aElrLLrw (An old-fashioned video camera)
[2]: https://obsproject.com/
[3]: https://nodered.org/
[4]: https://github.com/Palakis/obs-websocket
[5]: https://opensource.com/sites/default/files/uploads/obscontrol-img1.png.jpg (My OBS Control Dashboard)
[6]: https://github.com/palakis/obs-websocket/releases
[7]: https://nodered.org/docs/getting-started/
[8]: https://opensource.com/sites/default/files/uploads/obscontrol-img2.png.jpg (The basic flows)
[9]: https://opensource.com/sites/default/files/uploads/obscontrol-img3.png.jpg (Setting up the button)
[10]: https://opensource.com/sites/default/files/uploads/obscontrol-img4.png.jpg (Websocket Out Node configuration)
[11]: https://opensource.com/sites/default/files/uploads/obscontrol-img5.png.jpg (Switch Node configuration)
[12]: https://opensource.com/sites/default/files/uploads/obscontrol-img6.png.jpg (The response to "GetVersion")
[13]: https://opensource.com/sites/default/files/uploads/obscontrol-img7.png.jpg (OBS Websocket)
