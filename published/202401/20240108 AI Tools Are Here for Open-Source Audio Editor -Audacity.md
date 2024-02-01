[#]: subject: "AI Tools Are Here for Open-Source Audio Editor 'Audacity'"
[#]: via: "https://news.itsfoss.com/audacity-ai-tools/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16560-1.html"

开源音频编辑器 Audacity 的 AI 工具来了
======

![][0]

> Audacity 现在配备了新的 AI 工具。

在过去的几年中，我们已经看到了 AI 的显著发展，包括将 AI 驱动的功能添加到各种流行的工具中。而且，我们在 [2024 年 Linux 和开源预测][1] 中已经提到了更多的人工智能。

这次是 Audacity，[Linux 的最佳音频编辑之一][2]，迎来了 AI。现在，用户可以通过利用 AI 的力量来增强其音频编辑体验。

让我们来看看这些迷人的功能都有哪些。

### 英特尔打造 AI 工具 🛠️

英特尔公司推出了由 AI 驱动的处理语音音频和音乐的新功能。

这些功能是 **OpenVino** 插件套件的一部分。对于那些不知道的人来说，英特尔的 OpenVino 是一个 AI 框架，有助于加速深度学习模型。

值得注意的一个很酷但也很重要的方面是，所有这些功能在本地的 PC 上运行！ 更具体地说，PC 的 CPU 或 GPU 将用于处理部分。

#### 播客编辑

曾经想快速转录甚至翻译音频吗？

由 OpenAI 的 Whisper 支持的转录功能可以让用户做到这一点。

![Transcription | Source: GitHub Intel][3]

   * 它能根据给定的音频样本生成包含转录/翻译文本的新标签音轨。
   * 翻译将始终以英语产生输出，而转录将以与源音频相同的语言产生输出。
   * 目前，默认情况下仅支持 _Whisper Base_ 模型。稍后可能会支持更多模型。

与现有的 “噪音去除”效果类似，**“噪音抑制”** 可帮助去除口语音频样本中不需要的背景噪音。

   * 由于它是由 AI 提供动力的，因此你可以期望此功能的效果优于噪音去除。
   * 目前，默认情况下仅支持 _denseunet_ 模型。稍后可能会支持更多模型。

#### 音乐生成

是的，你没看错：现在，你可以在机器内生成新音乐！

**音乐生成** 允许用户生成音乐片段。这要归功于一个名为 **Riffusion** 的开源项目，这是一个基于 **Stable Diffusion** 的音乐生成模型（一种流行的开源模型，用于生成图像。）

![Music Generation | Source: GitHub Intel repo][4]

   * 你通过给出文本提示并调整其他一些参数（例如持续时间）来生成音乐。
   * 在文本提示符中，你指定要生成的音乐流派，AI 将尽力在生成音乐时保持这种类型。
   * 你可以选择在默认的简单模式和可选的高级模式之间切换，以进行更多的控制，例如指定开始提示和结束提示。

此外，你甚至可以通过**音乐风格混音**，选择音乐曲目的一部分，对音乐进行混音！

#### 音乐分离

如果你想为自己喜欢的歌曲创建自己的器乐曲目，该怎么办？也许还能与朋友来一场有趣的卡拉 OK 呢？

**音乐分离**使你可以将歌曲分为声音或乐器版本。提供了两种分离模式：

![Music Separation. Source: github.com/intel/openvino-plugins-ai-audacity][5]

   * 2-Stem 为人声和器乐制作两个新音轨。
   * 4-Stem 可生成四条新音轨，包括人声、鼓声、贝司声，最后一条是其他乐器声。

### 如何使用 AI 工具？ 📥

如果你是 Linux 用户，请等一等。

虽然该插件的 [Windows 版本][6] 可供下载，但其 Linux 对应版本暂时还不可用。

如果你仍然想尝试一下，则需要自己编译该项目。[你可以参考此的官方说明][7]。

希望 Linux 构建很快到来！🤞

💬 你觉得 Audacity 的这些新人工智能功能怎么样？请在评论中告诉我们你的想法！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/audacity-ai-tools/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/predictions-linux-open-source-2024/
[2]: https://itsfoss.com/best-audio-editors-linux/
[3]: https://github.com/intel/openvino-plugins-ai-audacity/raw/main/doc/feature_doc/whisper_transcription/properties.png
[4]: https://github.com/intel/openvino-plugins-ai-audacity/raw/main/doc/feature_doc/music_generation/simple_properties.png
[5]: https://github.com/intel/openvino-plugins-ai-audacity/raw/main/doc/feature_doc/music_separation/properties.png
[6]: https://github.com/intel/openvino-plugins-ai-audacity/releases
[7]: https://github.com/intel/openvino-plugins-ai-audacity/blob/main/doc/build_doc/linux/README.md
[0]: https://img.linux.net.cn/data/attachment/album/202401/16/135942ybxu5aergzk7r8ga.jpg