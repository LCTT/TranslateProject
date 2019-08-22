[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10741-1.html)
[#]: subject: (Streaming internet radio with RadioDroid)
[#]: via: (https://opensource.com/article/19/4/radiodroid-internet-radio-player)
[#]: author: (Chris Hermansen (Community Moderator) https://opensource.com/users/clhermansen)

使用 RadioDroid 流传输网络广播
======

> 通过简单的设置使用你家中的音响收听你最爱的网络电台。

![][1]

最近网络媒体对 [Google 的 Chromecast 音频设备的下架][2]发出叹息。该设备在音频媒体界备受[好评][3]，因此我已经在考虑入手一个。基于 Chromecast 退场的消息，我决定在它们全部被打包扔进垃圾堆之前以一个合理价位买一个。

我在 [MobileFun][4] 上找到一个放进我的订单中。这个设备最终到货了。它被包在一个普普通通、简简单单的 Google 包装袋中，外面打印着非常简短的使用指南。

![Google Chromecast 音频][5]

我通过我的数模转换器的光纤 S/PDIF 连接接入到家庭音响，希望以此能提供最佳的音质。

安装过程并无纰漏，在五分钟后我就可以播放一些音乐了。我知道一些安卓应用支持 Chromecast，因此我决定用 Google Play Music 测试它。意料之中，它工作得不错，音乐效果听上去也相当好。然而作为一个具有开源精神的人，我决定看看我能找到什么开源播放器能兼容 Chromecast。

### RadioDroid 的救赎

[RadioDroid 安卓应用][6] 满足条件。它是开源的，并且可从 [GitHub][7]、Google Play 以及 [F-Droid][8] 上获取。根据帮助文档，RadioDroid 从 [Community Radio Browser][9] 网页寻找播放流。因此我决定在我的手机上安装尝试一下。

![RadioDroid][10]

安装过程快速顺利，RadioDroid 打开展示当地电台十分迅速。你可以在这个屏幕截图的右上方附近看到 Chromecast 按钮（看上去像一个有着波阵面的长方形图标）。
  
我尝试了几个当地电台。这个应用可靠地在我手机喇叭上播放了音乐。但是我不得不摆弄 Chromecast 按钮来通过 Chromecast 把音乐传到流上。但是它确实可以做到流传输。

我决定找一下我喜爱的网络广播电台：法国马赛的 [格雷诺耶广播电台][11]。在 RadioDroid 上有许多找到电台的方法。其中一种是使用标签——“当地”、“最流行”等——就在电台列表上方。其中一个标签是国家，我找到法国，在其 1500 个电台中划来划去寻找格雷诺耶广播电台。另一种办法是使用屏幕上方的查询按钮；查询迅速找到了那家美妙的电台。我尝试了其它几次查询它们都返回了合理的信息。

回到“当地”标签，我在列表中翻来覆去，发现“当地”的定义似乎是“在同一个国家”。因此尽管西雅图、波特兰、旧金山、洛杉矶和朱诺比多伦多更靠近我的家，我并没有在“当地”标签中看到它们。然而通过使用查询功能，我可以发现所有名字中带有西雅图的电台。

“语言”标签使我找到所有用葡语（及葡语方言）播报的电台。我很快发现了另一个最爱的电台 [91 Rock Curitiba][12]。

接着灵感来了，虽然现在是春天了，但又如何呢？让我们听一些圣诞音乐。意料之中，搜寻圣诞把我引到了 [181.FM – Christmas Blender][13]。不错，一两分钟的欣赏对我就够了。

因此总的来说，我推荐把 RadioDroid 和 Chromecast 的组合作为一种用家庭音响以合理价位播放网络电台的良好方式。

### 对于音乐方面……

最近我从 [Blue Coast Music][16] 商店里选了一个 [Qua Continuum][15] 创作的叫作 [Continuum One][14] 的有趣的氛围（甚至无节拍）音乐专辑。 

Blue Coast 有许多可提供给开源音乐爱好者的。音乐可以无需通过那些奇怪的平台专用下载管理器下载（有时以物理形式）。它通常提供几种形式，包括 WAV、FLAC 和 DSD；WAV 和 FLAC 还提供不同的字长和比特率，包括 16/44.1、24/96 和 24/192，针对 DSD 则有 2.8、5.6 和 11.2 MHz。音乐是用优秀的仪器精心录制的。不幸的是，我并没有找到许多符合我口味的音乐，尽管我喜欢 Blue Coast 上能获取的几个艺术家，包括 Qua Continuum，[Art Lande][17] 以及 [Alex De Grassi][18]。

在 [Bandcamp][19] 上，我挑选了 [Emancipator's Baralku][20] 和 [Framework's Tides][21]，两个都是我喜欢的。两位艺术家创作的音乐符合我的口味——电音但又（总体来说）不是舞蹈，它们的音乐旋律优美，副歌也很好听。有许多可以让开源音乐发烧友爱上 Bandcamp 的东西，比如买前试听整首歌的服务；没有垃圾软件下载器；与大量音乐家的合作；以及对 [Creative Commons music][22] 的支持。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/radiodroid-internet-radio-player

作者：[Chris Hermansen (Community Moderator)][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (woman programming)
[2]: https://www.theverge.com/2019/1/11/18178751/google-chromecast-audio-discontinued-sale
[3]: https://www.whathifi.com/google/chromecast-audio/review
[4]: https://www.mobilefun.com/google-chromecast-audio-black-70476
[5]: https://opensource.com/sites/default/files/uploads/internet-radio_chromecast.png (Google Chromecast Audio)
[6]: https://play.google.com/store/apps/details?id=net.programmierecke.radiodroid2
[7]: https://github.com/segler-alex/RadioDroid
[8]: https://f-droid.org/en/packages/net.programmierecke.radiodroid2/
[9]: http://www.radio-browser.info/gui/#!/
[10]: https://opensource.com/sites/default/files/uploads/internet-radio_radiodroid.png (RadioDroid)
[11]: http://www.radiogrenouille.com/
[12]: https://91rock.com.br/
[13]: http://player.181fm.com/?station=181-xblender
[14]: https://www.youtube.com/watch?v=PqLCQXPS8iQ
[15]: https://bluecoastmusic.com/artists/qua-continuum
[16]: https://bluecoastmusic.com/store
[17]: https://bluecoastmusic.com/store?f%5B0%5D=search_api_multi_aggregation_1%3Aart%20lande
[18]: https://bluecoastmusic.com/store?f%5B0%5D=search_api_multi_aggregation_1%3Aalex%20de%20grassi
[19]: https://bandcamp.com/
[20]: https://emancipator.bandcamp.com/album/baralku
[21]: https://frameworksuk.bandcamp.com/album/tides
[22]: https://bandcamp.com/tag/creative-commons
