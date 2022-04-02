[#]: subject: "How to build an open source metaverse"
[#]: via: "https://opensource.com/article/22/1/open-source-metaverse"
[#]: author: "Josip Almasi https://opensource.com/users/jalmasi"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14218-1.html"

如何建立一个开源的元宇宙
======

> 开源世界是建立元宇宙的首选之地。

![](https://img.linux.net.cn/data/attachment/album/202201/27/123936o0fcmdfb0d88p0zy.jpg)

如果我告诉你，构建元宇宙所需要的所有内容和软件都已经有了，而且完全免费，你会去构建吗？

先别急，让我们退一步来解释一下元宇宙。

### 什么是元宇宙？

20 世纪的赛博朋克作家，如 Gibson 和 Stephenson，都曾想象过由虚拟现实支持的互联网，在 Stephenson 的小说《雪崩<rt>Snow Crash</rt></ruby>》中，他将其称之为<ruby>元宇宙<rt>Metaverse</rt></ruby>。随着<ruby>虚拟现实<rt>virtual reality</rt></ruby>（VR）设备和应用程序的日益普及，尤其是在马克•扎克伯格宣布将雇佣 1 万人来打造它，并将 Facebook 的公司名称改为 Meta 之后，元宇宙正在成为一个热门词汇。Matthew Ball 对该话题进行了 [认真分析][2]，并以“共同构建”作为结论：“事实上，最有可能的是，元宇宙是来自不同的平台、机构和技术的网络中，它们协同配合（无论多么不情愿），并拥抱互操作性。”

互操作性，这个词本身含蓄而清楚地指出了开源和开放标准在其中的作用。

因此，简而言之，它就是支持 VR 的互联网。

### 如何建立一个开源的元宇宙？

就像互联网上的网络服务器一样，你需要 VR 服务器。不过不用担心，我写了一个，而且 [介绍它的文章][3] 大约一年前就发表在这里了。当然，你需要支持 VR 的网络浏览器，但网络浏览器已经支持视频/音频流（WebRTC）以及 VR 和 AR（WebXR）。此外，你还需要大量 3D 内容，最好是开源标准的 glTF 格式。幸运的是，[Sketchfab][4] 拥有 50 万个以上的免费 3D 模型，由大量的作者在<ruby>知识共享许可<rt>Creative Commons licenses</rt></ruby>下发布。Sketchfab 并不是唯一一家这样做的公司，但他们提供了 REST API 来搜索和下载这些模型。

### 别忘了键盘

在 VR 中已经待了一段时间了，我可以用亲身体验告诉你我最怀念的是什么：键盘！我在键盘上写代码，但当我戴上 VR 眼镜时，它就消失了。你可以想象，摘下和戴上 VR 设备是多么的混乱。不仅如此，我还需要在 VR 中看到我的代码。那么为什么要止步于此呢？为什么我在 VR 中看不到每一个应用程序呢？许多人都在使用两个或更多的显示器。在 VR 中，你可以随处布置窗口。这比多少个屏幕都要好。而一旦到了这一步，你就可以真正地谈论元宇宙了。

说实话，VR 设备仍处于起步阶段，它无疑还缺少许多功能。但是，VR 设备将得到改善，并最终包括键盘、更好的摄像头以及在现实中叠加虚拟的能力。在此期间，我们将继续戴上和摘下护目镜，以其他方式处理其他障碍。

### 那么我还等什么呢？

你不需要等待。无论是爱好者还是公司，都正在努力。而且你现在就可以开始在网络上建立你的虚拟世界。下面的视频解释了如何使用现有的免费模型来制作虚拟世界。

![VIDEO](https://youtu.be/d0v8IPCt4Mc)

在底层，VRSpace 网络客户端使用一个开源的 JavaScript WebGL 库 Babylon.js 来加载 glTF 内容并使用 WebGL 渲染。它调用 Sketchfab REST API 的搜索功能（服务器所有者必须在那里有一个账户）。点击了一个模型，它就会让 VRSpace 服务器获取它。服务器下载它（仅当它之前没有下载的情况下），并将其交付给客户端。空间中发生的一切都会被广播（实际上是通过 WebSockets 进行多播）给所有连接的用户，所以他们都会看到同样的移动和物体大小的调整。当然，他们可以通过文本信息或语音进行聊天。通过点击右下角的 VR 眼镜按钮，用户可以立即进入 VR。用户还可以共享屏幕，尽管不在此空间中。

![](https://youtu.be/xB6XTnEMQzo)

而这一切都只使用现有的标准网络技术和免费的软件和内容。它不仅适用于 PC 和 VR 设备，也适用于移动设备。然而，移动版 Chrome 浏览器并没有启用 VR 功能。它在第一次尝试进入 VR 时会提示下载谷歌 VR。

由于它是开放的，这在目前来说是可互操作的。但对于元宇宙（支持 VR 的互联网）所需的大规模来说，它的互操作性还远远不够。以头像为例。我在 LinkedIn、Facebook 以及 Opensource.com 上使用相同的图片作为我的头像。我怎么能把我的 3D 头像上传到 VRSpace 或其他地方呢？

好吧，我不能。上传本身并不是一个问题。当然，文件格式（glTF）也不是问题。问题出现在头像结构上，因为它没有标准化。所以，比如说，不同的人物有不同的骨头数量。然后，本应是微不足道的必备功能，如用虚拟手拿东西，却变得极其复杂。我已经分析了 100 多个免费的角色，并将我的发现作为研究论文发表：《[迈向人形 3D 角色的自动骨架识别][5]》，希望它能帮助其他作者实现互操作性。

而这只是一个开始，是我们进入一个共享的虚拟世界需要做的第一件事。

![VRSpace 的免费头像][6]

### 知识产权

知识产权呢？你可能会说，这都是开源的！嗯，确实如此。作者们是如此善良，让别人使用他们的创作。用户至少可以做的是给他们点赞。知识共享许可的实际条款要求用户明确归功于作者。为此，我特别注意在搜索结果中显示作者的名字，而且作者信息被嵌入每个 glTF 文件的元数据部分。但是，即使是需要额外的工作的免费东西，我无法想象它变成专有内容会多么可怕。

### NFT和区块链

转念一想，我可以想象到。它需要 NFT、区块链，以及其他什么东西。快速搜索“元宇宙 区块链”为我提供了 _极好的购买机会_，并建议了 _最好的购买方案_。好吧，我不买。记住我的话。试图出售加密货币的人是不会建立元宇宙的。

这并不是说区块链在这里没有用，因为即使是免费的内容，你也必须对作者进行追踪。面对成千上万的免费模型，这必须以某种方式自动化，而分布式账本可能正是正确的解决方案。

话说回来，像 Sketchfab 这样的数字内容提供商并不只提供免费模型，他们还出售内容。毕竟，这就是他们谋生的方式。从技术上讲，在你的虚拟世界中使用这些专有内容，你需要做的就是把代码中的一个 `true` 改为 `false`，字面上的。但是，一旦你下载了它，没有人可以阻止你分享它。然而，在法律上，许可证禁止你这样做。NFT 可以证明所有权，可以购买，可以出售，但不能执行版权。内容提供商最终会明白这一点，但我担心的不是他们。这对普通用户有实际影响，与我反复被问到的一个具体问题有关。我可以自己制作或购买我自己的头像，而且只能是我的，不能被其他人使用吗？但技术不能阻止任何人复制它。就像我可以从 LinkedIn 复制你的头像图片，并将其作为我在 Facebook 上的图片。但你想想，为什么会有人想这么做？

有趣的是，我已经有一个 VRSpace 的商业实现。一个由自由软件驱动的 3D 多用户视频和音频流媒体网站，提供专有内容。在上锁的门后，付费进入 —— 就这么简单。而且它不妨碍建立元宇宙。然而，每个人都有自己独特的头像，永远不能被其他人使用。视频头像：

![作者在 VRSpace 的视频头像][8]

你想成为你自己，而不是其他人。只要点击视频按钮，就这么简单。当然，浏览器会提示你是否允许流式传输你的视频和音频。这个功能在日常生活中被广泛使用，以至于我们并没有把它和元宇宙联系起来，赛博朋克的作者们也没有设想到这一点。随着时间的推移，这种 _我就是我_ 的方法将发展为运动跟踪和视频流映射到我们的 3D 头像上，但它仍将在昂贵的电影和视频游戏领域停留一段时间。

现在，你已经瞥见了 VRSpace 服务器的所有功能，除了 Oauth2 认证。反正你知道它是如何工作的。一个网站将你重定向到你选择的另一个网站，你在那里登录，然后被认证回来。这就是上述所有的简化图。

![VR 组件图][9]

### 现场演示

在 [VRSpace.org][10] 上有一个现场演示，一直在运行最新的代码，欢迎你在任何时候尝试。它是完全匿名访问的，没有任何形式的广告和跟踪器。试着在 VRCraft 世界中建立你的世界，但要知道，一旦你断开连接，你所做的一切都会消失 —— 这是运行一个向公众开放的匿名服务的代价。主页提供了所有的相关信息，只要访问该链接即可，或者在 [GitHub][11]、[YouTube][12] 或[Facebook][13] 上加入该项目。

非常感谢早期采用者的帮助，使项目达到这个阶段 —— 所有作者的免费模型、Sketchfab 提供的访问，以及 Babylon.js 社区，使这一切都能跨平台运作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/open-source-metaverse

作者：[Josip Almasi][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jalmasi
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_virtual_gadgets_device_drone.png?itok=JTAgRb-1 (new techie gadgets representing innovation)
[2]: https://www.matthewball.vc/all/themetaverse
[3]: https://opensource.com/article/20/12/virtual-reality-server
[4]: https://sketchfab.com/
[5]: https://www.researchgate.net/publication/356987355_TOWARDS_AUTOMATIC_SKELETON_RECOGNITION_OF_HUMANOID_3D_CHARACTER
[6]: https://opensource.com/sites/default/files/uploads/free-avatars-at-vrspace.png (Free avatars at VRSpace)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/author-in-vrspace.png (Author's video avatar in VRSpace)
[9]: https://opensource.com/sites/default/files/uploads/vr-components-diagram.png (VR components diagram)
[10]: https://www.vrspace.org/
[11]: https://github.com/jalmasi/vrspace
[12]: https://www.youtube.com/channel/UCLdSg22i9MZ3u7ityj_PBxw
[13]: https://www.facebook.com/vrspace.org
