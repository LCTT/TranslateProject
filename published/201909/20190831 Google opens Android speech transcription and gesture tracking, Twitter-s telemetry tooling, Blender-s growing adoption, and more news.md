[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11292-1.html)
[#]: subject: (Google opens Android speech transcription and gesture tracking, Twitter's telemetry tooling, Blender's growing adoption, and more news)
[#]: via: (https://opensource.com/19/8/news-august-31)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

开源新闻综述：谷歌开源 Android 语音转录和手势追踪、Twitter 的遥测工具
======

> 不要错过两周以来最大的开源头条新闻。

![Weekly news roundup with TV][1]

在本期的开源新闻综述中，我们来看看谷歌发布的两个开源软件、Twitter 的最新可观测性工具、动漫工作室对 Blender 的采用在增多等等新闻！

### 谷歌的开源双响炮

搜索引擎巨头谷歌的开发人员最近一直忙于开源。在过去的两周里，他们以开源的方式发布了两个截然不同的软件。

第一个是 Android 的语音识别和转录工具 Live Transcribe 的[语音引擎][2]，它可以“在移动设备上使用机器学习算法将音频变成实时字幕”。谷歌的声明称，它正在开源 Live Transcribe 以“让所有开发人员可以为长篇对话提供字幕”。你可以[在 GitHub 上][3]浏览或下载 Live Transcribe 的源代码。

谷歌还为 Android 和 iOS 开源了[手势跟踪软件][4]，它建立在其 [MediaPipe][5] 机器学习框架之上。该软件结合了三种人工智能组件：手掌探测器、“返回 3D 手点”的模型和手势识别器。据谷歌研究人员称，其目标是改善“跨各种技术领域和平台的用户体验”。该软件的源代码和文档[可在 GitHub 上获得][6]。

### Twitter 开源 Rezolus 遥测工具

当想到网络中断时，我们想到的是影响站点或服务性能的大崩溃或减速。让我们感到惊讶的是性能慢慢被吃掉的小尖峰的重要性。为了更容易地检测这些尖峰，Twitter 开发了一个名为 Rezolus 的工具，该公司[已将其开源][7]。

> 我们现有的按分钟采样的遥测技术未能反映出这些异常现象。这是因为相对于该异常发生的长度，较低的采样率掩盖了这些持续时间大约为 10 秒的异常。这使得很难理解正在发生的事情并调整系统以获得更高的性能。

Rezolus 旨在检测“非常短暂但有时显著的性能异常”——仅持续几秒钟。Twitter 已经运行了 Rezolus 大约一年，并且一直在使用它收集的内容“与后端服务日志来确定峰值的来源”。

如果你对将 Rezolus 添加到可观测性堆栈中的结果感到好奇，请查看 Twitter 的 [GitHub 存储库][8]中的源代码。

### 日本的 Khara 动画工作室采用 Blender

Blender 被认为是开源的动画和视觉效果软件的黄金标准。它被几家制作公司采用，其中最新的是[日本动漫工作室 Khara][9]。

Khara 正在使用 Blender 开发 Evangelion: 3.0+1.0，这是基于流行动漫系列《Neon Genesis Evangelion》的电影系列的最新版本。虽然该电影的工作不能在 Blender 中全部完成，但 Khara 的员工“将从 2020 年 6 月开始使用 Blender 进行大部分工作”。为了强调其对 Blender 和开源的承诺，“Khara 宣布它将作为企业会员加入 Blender 基金会的发展基金。“

### NSA 分享其固件安全工具

继澳大利亚同行[共享他们的一个工具][10]之后，美国国家安全局（NSA）正在[提供][11]的一个项目的成果“可以更好地保护机器免受固件攻击“。这个最新的软件以及其他保护固件的开源工作可以在 [Coreboot Gerrit 存储库][12]下找到。

这个名为“具有受保护执行的 SMI 传输监视器”（STM-PE）的软件“将与运行 Coreboot 的 x86 处理器配合使用”以防止固件攻击。根据 NSA 高级网络安全实验室的 Eugene Meyers 的说法，STM-PE 采用低级操作系统代码“并将其置于一个盒子中，以便它只能访问它需要访问的设备系统”。这有助于防止篡改，Meyers 说，“这将提高系统的安全性。”

### 其它新闻

* [Linux 内核中的 exFAT？是的！][13]
* [瓦伦西亚继续支持 Linux 学校发行版][14]
* [西班牙首个开源卫星][15]
* [Western Digital 从开放标准到开源芯片的长途旅行][16]
* [用于自动驾驶汽车多模传感器的 Waymo 开源数据集][17]

一如既往地感谢 Opensource.com 的工作人员和主持人本周的帮助。

--------------------------------------------------------------------------------

via: https://opensource.com/19/8/news-august-31

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://venturebeat.com/2019/08/16/google-open-sources-live-transcribes-speech-engine/
[3]: https://github.com/google/live-transcribe-speech-engine
[4]: https://venturebeat.com/2019/08/19/google-open-sources-gesture-tracking-ai-for-mobile-devices/
[5]: https://github.com/google/mediapipe
[6]: https://github.com/google/mediapipe/blob/master/mediapipe/docs/hand_tracking_mobile_gpu.md
[7]: https://blog.twitter.com/engineering/en_us/topics/open-source/2019/introducing-rezolus.html
[8]: https://github.com/twitter/rezolus
[9]: https://www.neowin.net/news/anime-studio-khara-is-planning-to-use-open-source-blender-software/
[10]: https://linux.cn/article-11241-1.html
[11]: https://www.cyberscoop.com/nsa-firmware-open-source-coreboot-stm-pe-eugene-myers/
[12]: https://review.coreboot.org/admin/repos
[13]: https://cloudblogs.microsoft.com/opensource/2019/08/28/exfat-linux-kernel/
[14]: https://joinup.ec.europa.eu/collection/open-source-observatory-osor/news/120000-lliurex-desktops
[15]: https://hackaday.com/2019/08/15/spains-first-open-source-satellite/
[16]: https://www.datacenterknowledge.com/open-source/western-digitals-long-trip-open-standards-open-source-chips
[17]: https://venturebeat.com/2019/08/21/waymo-open-sources-data-set-for-autonomous-vehicle-multimodal-sensors/
