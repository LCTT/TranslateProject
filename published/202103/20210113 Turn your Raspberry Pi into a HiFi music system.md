[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13209-1.html)
[#]: subject: (Turn your Raspberry Pi into a HiFi music system)
[#]: via: (https://opensource.com/article/21/1/raspberry-pi-hifi)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

把你的树莓派变成一个 HiFi 音乐系统
======

> 为你的朋友、家人、同事或其他任何拥有廉价发烧设备的人播放音乐。

![](https://img.linux.net.cn/data/attachment/album/202103/17/094819ad5vzy0kqwvlxeee.jpg)

在过去的 10 年里，我大部分时间都是远程工作，但当我走进办公室时，我坐在一个充满内向的同伴的房间里，他们很容易被环境噪音和谈话所干扰。我们发现，听音乐可以抑制办公室的噪音，让声音不那么扰人，用愉快的音乐提供一个愉快的工作环境。

起初，我们的一位同事带来了一些老式的有源电脑音箱，把它们连接到他的桌面电脑上，然后问我们想听什么。它可以工作，但音质不是很好，而且只有当他在办公室的时候才可以使用。接下来，我们又买了一对 Altec Lansing 音箱。音质有所改善，但没有什么灵活性。

不久之后，我们得到了一台通用 ARM 单板计算机（SBC），这意味着任何人都可以通过 Web 界面控制播放列表和音箱。但一块普通的 ARM 开发板意味着我们不能使用流行的音乐设备软件。由于非标准的内核，更新操作系统是一件很痛苦的事情，而且 Web 界面也经常出现故障。

当团队壮大并搬进更大的房间后，我们开始梦想着有更好音箱和更容易处理软件和硬件组合的方法。

为了用一种相对便宜、灵活、音质好的方式解决我们的问题，我们用树莓派、音箱和开源软件开发了一个办公室 HiFi。
 
### HiFi 硬件

用一个专门的 PC 来播放背景音乐就有点过分了。它昂贵、嘈杂（除非是静音的，但那就更贵了），而且不环保。即使是最便宜的 ARM 板也能胜任这个工作，但从软件的角度来看，它们往往存在问题。树莓派还是比较便宜的，虽然不是标准的计算机，但在硬件和软件方面都有很好的支持。

接下来的问题是：用什么音箱。质量好的、有源的音箱很贵。无源音箱的成本较低，但需要一个功放，这需要为这套设备增加另一个盒子。它们还必须使用树莓派的音频输出；虽然可以工作，但并不是最好的，特别是当你已经在高质量的音箱和功放上投入资金的时候。

幸运的是，在数以千计的树莓派硬件扩展中，有内置数字模拟转换器（DAC）的功放。我们选择了 [HiFiBerry 的 Amp][2]。它在我们买来后不久就停产了（被采样率更好的 Amp+ 型号取代），但对于我们的目的来说，它已经足够好了。在开着空调的情况下，我想无论如何你也听不出 48kHz 或 192kHz 的 DAC 有什么不同。

音箱方面，我们选择了 [Audioengine P4][3]，是在某店家清仓大甩卖的时候买的，价格超低。它很容易让我们的办公室房间充满了声音而不失真（并且还能传到我们的房间之外，有一些失真，隔壁的工程师往往不喜欢）。

### HiFi 软件

在我们旧的通用 ARM SBC 上我们需要维护一个 Ubuntu，使用一个固定的、古老的、在软件包仓库外的系统内核，这是有问题的。树莓派操作系统包括一个维护良好的内核包，使其成为一个稳定且易于更新的基础系统，但它仍然需要我们定期更新 Python 脚本来访问 Spotify 和 YouTube。对于我们的目的来说，这有点过于高维护。

幸运的是，使用树莓派作为基础意味着有许多现成的软件设备可用。

我们选择了 [Volumio][4]，这是一个将树莓派变成音乐播放设备的开源项目。安装是一个简单的*一步步完成*的过程。安装和升级是完全无痛的，而不用辛辛苦苦地安装和维护一个操作系统，并定期调试破损的 Python 代码。配置 HiFiBerry 功放不需要编辑任何配置文件，你只需要从列表中选择即可。当然，习惯新的用户界面需要一定的时间，但稳定性和维护的便捷性让这个改变是值得的。

![Volumio interface][5]

### 播放音乐并体验

虽然大流行期间我们都在家里办公，不过我把办公室的 HiFi 安装在我的家庭办公室里，这意味着我可以自由支配它的运行。一个不断变化的用户界面对于一个团队来说会很痛苦，但对于一个有研发背景的人来说，自己玩一个设备，变化是很有趣的。

我不是一个程序员，但我有很强的 Linux 和 Unix 系统管理背景。这意味着，虽然我觉得修复坏掉的 Python 代码很烦人，但 Volumio 对我来说却足够完美，足够无聊（这是一个很好的“问题”）。幸运的是，在树莓派上播放音乐还有很多其他的可能性。

作为一个终端狂人（我甚至从终端窗口启动 LibreOffice），我主要使用 Music on Console（[MOC][6]）来播放我的网络存储（NAS）中的音乐。我有几百张 CD，都转换成了 [FLAC][7] 文件。而且我还从 [BandCamp][8] 或 [Society of Sound][9] 等渠道购买了许多数字专辑。

另一个选择是 [音乐播放器守护进程（MPD）][10]。把它运行在树莓派上，我可以通过网络使用 Linux 和 Android 的众多客户端之一与我的音乐进行远程交互。

### 音乐不停歇

正如你所看到的，创建一个廉价的 HiFi 系统在软件和硬件方面几乎是无限可能的。我们的解决方案只是众多解决方案中的一个，我希望它能启发你建立适合你环境的东西。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/raspberry-pi-hifi

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/hi-fi-stereo-vintage.png?itok=KYY3YQwE (HiFi vintage stereo)
[2]: https://www.hifiberry.com/products/amp/
[3]: https://audioengineusa.com/shop/passivespeakers/p4-passive-speakers/
[4]: https://volumio.org/
[5]: https://opensource.com/sites/default/files/uploads/volumeio.png (Volumio interface)
[6]: https://en.wikipedia.org/wiki/Music_on_Console
[7]: https://xiph.org/flac/
[8]: https://bandcamp.com/
[9]: https://realworldrecords.com/news/society-of-sound-statement/
[10]: https://www.musicpd.org/
