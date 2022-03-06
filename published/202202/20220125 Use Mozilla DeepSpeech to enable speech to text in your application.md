[#]: subject: "Use Mozilla DeepSpeech to enable speech to text in your application"
[#]: via: "https://opensource.com/article/22/1/voice-text-mozilla-deepspeech"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14233-1.html"

使用 DeepSpeech 在你的应用中实现语音转文字
======

> 应用中的语音识别不仅仅是一个有趣的技巧，而且是一个重要的无障碍功能。

![](https://img.linux.net.cn/data/attachment/album/202202/01/102117mvnx1o9zxxikz91z.jpg)

计算机的主要功能之一是解析数据。有些数据比其他数据更容易解析，而语音输入仍然是一项进展中的工作。不过，近年来该领域已经有了许多改进，其中之一就是 DeepSpeech，这是 Mozilla 的一个项目，Mozilla 是维护 Firefox 浏览器的基金会。DeepSpeech 是一个语音到文本的命令和库，使其对需要将语音输入转化为文本的用户和希望为其应用提供语音输入的开发者都很有用。

### 安装 DeepSpeech

DeepSpeech 是开源的，使用 Mozilla 公共许可证（MPL）发布。你可以从其 [GitHub][2] 页面下载源码。

要安装，首先为 Python 创建一个虚拟环境：

```
$ python3 -m pip install deepspeech --user
```

DeepSpeech 依靠的是机器学习。你可以自己训练它，但最简单的是在刚开始时下载预训练的模型文件。

```
$ mkdir DeepSpeech
$ cd Deepspeech
$ curl -LO \
  https://github.com/mozilla/DeepSpeech/releases/download/vX.Y.Z/deepspeech-X.Y.Z-models.pbmm
$ curl -LO \
  https://github.com/mozilla/DeepSpeech/releases/download/vX.Y.Z/deepspeech-X.Y.Z-models.scorer
```

### 用户应用

通过 DeepSpeech，你可以将语音的录音转录成书面文字。你可以从在最佳条件下干净录制的语音中得到最好的结果。然而，在紧要关头，你可以尝试任何录音，你可能会得到一些你需要手动转录的东西。

为了测试，你可以录制一个包含简单短语的音频文件：“This is a test. Hello world, this is a test”。将音频保存为一个 `.wav` 文件，名为 `hello-test.wav`。

在你的 DeepSpeech 文件夹中，通过提供模型文件、评分器文件和你的音频启动一个转录：

```
$ deepspeech --model deepspeech*pbmm \
  --scorer deepspeech*scorer \
  --audio hello-test.wav
```

输出到标准输出（你的终端）：

```
this is a test hello world this is a test
```

你可以通过使用 `--json` 选项获得 JSON 格式的输出：

```
$ deepspeech --model deepspeech*pbmm \
  -- json
  --scorer deepspeech*scorer \
  --audio hello-test.wav
```

这就把每个词和时间戳一起渲染出来：

```
{
  "transcripts": [
    {
      "confidence": -42.7990608215332,
      "words": [
        {
          "word": "this",
          "start_time": 2.54,
          "duration": 0.12
        },
        {
          "word": "is",
          "start_time": 2.74,
          "duration": 0.1
        },
        {
          "word": "a",
          "start_time": 2.94,
          "duration": 0.04
        },
        {
          "word": "test",
          "start_time": 3.06,
          "duration": 0.74
        },
[...]
```

### 开发者

DeepSpeech 不仅仅是一个转录预先录制的音频的命令。你也可以用它来实时处理音频流。GitHub 仓库 [DeepSpeech-examples][3] 中有 JavaScript、Python、C# 和用于 Android 的 Java 等各种代码。

大部分困难的工作已经完成，所以集成 DeepSpeech 通常只是引用 DeepSpeech 库，并知道如何从主机设备上获得音频（你通常通过 Linux 上的 `/dev` 文件系统或 Android 和其他平台上的 SDK 来完成。）

### 语音识别

作为一个开发者，为你的应用启用语音识别不只是一个有趣的技巧，而是一个重要的无障碍功能，它使你的应用更容易被有行动问题的人、低视力的人和长期多任务处理的人使用。作为用户，DeepSpeech 是一个有用的转录工具，可以将音频文件转换为文本。无论你的使用情况如何，请尝试 DeepSpeech，看看它能为你做什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/voice-text-mozilla-deepspeech

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://github.com/mozilla/DeepSpeech
[3]: https://github.com/mozilla/DeepSpeech-examples
