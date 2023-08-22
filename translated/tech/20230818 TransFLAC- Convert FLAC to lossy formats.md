[#]: subject: "TransFLAC: Convert FLAC to lossy formats"
[#]: via: "https://fedoramagazine.org/transflac-convert-flac-to-lossy-formats/"
[#]: author: "Gerald B. Cox https://fedoramagazine.org/author/gbcox/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

TransFLAC：将 FLAC 转换为有损格式
======

![][1]

### **FLAC：无损音频压缩格式**

[FLAC][2]，即自由无损音频编解码器，是一种无损音频压缩格式，可保留所有原始音频数据。这意味着 FLAC 文件可以解码成与原始音频文件完全相同的副本，而不会有任何质量上的损失。不过，无损压缩通常会比有损压缩的文件大小更大，这就是为什么需要一种将 FLAC 转为有损格式的方法。这就是 TransFLAC 可以提供帮助的地方。

FLAC 是一种流行的数字音频文件存档格式，也可用于在家用电脑上存储音乐收藏。音乐流媒体服务也越来越普遍地提供 FLAC 作为高品质音频的一种选择。

对于存储空间有限的便携设备，通常使用 MP3、AAC 和 OGG Vorbis 等有损音频格式。这些格式的文件大小比无损格式小得多，但音质仍然很好。

一般来说，FLAC 是对无损音频质量要求较高的应用（如存档、母带制作和认真聆听）的不错选择。对于文件大小更为重要的应用，如在便携设备上存储音乐或通过互联网串流音乐，有损格式是不错的选择。

### TransFLAC：将 FLAC 转换为有损格式

[TransFLAC][3] 是一款命令行应用，可将 FLAC 音频文件转换为指定质量级别的有损格式。它能使 FLAC 和有损格式库保持部分或完全同步。TransFLAC 还能同步目录结构中存储的专辑封面、专辑封底和文件夹文件。你可以在终端窗口中交互式运行 TransFLAC，也可以使用 cron 或 systemd 等应用安排其自动运行。

必须指定以下四个参数：


  1. **输入 FLAC 目录**：要递归搜索 FLAC 音频文件的目录。目录名的大小写很重要。TransFLAC 会将目录树中的所有 FLAC 音频文件转换为指定的有损编解码格式。程序将解决遇到的任何符号链接，并显示物理路径。

  2. **输出有损目录**：有损音频文件的存储目录。目录名的大小写很重要。程序将解析遇到的任何符号链接并显示物理路径。

  3. **有损编解码器**：用于转换 FLAC 音频文件的编解码器。编解码器名称的大小写并不重要。对于给定的文件大小或比特率，OPUS 通常能提供最佳音质，是推荐的编解码器。
      有效值为 [opus][4] | [ogg][5] | [aac][6] | [mp3][7]

  4. **编解码器质量**： 用于编码有损音频文件的质量预设。质量名称的大小写并不重要。**OPUS STANDARD** 质量提供全带宽、立体声音乐、良好的音频质量和透明度，是推荐的设置。
      有效值为 低 | 中 | 标准 | 高 | 优质



**TransFLAC** 允许对配置中的某些项目进行[自定义][8]。项目 [wiki][9] 提供了更多信息。

在 [Fedora Linux][10] 上**安装**：

```

    $ sudo dnf install transflac

```

![][11]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/transflac-convert-flac-to-lossy-formats/

作者：[Gerald B. Cox][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gbcox/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/08/transflac-816x345.jpg
[2]: https://xiph.org/flac/
[3]: https://bitbucket.org/gbcox/transflac/wiki/Home
[4]: https://opus-codec.org/
[5]: https://xiph.org/vorbis/
[6]: https://en.wikipedia.org/wiki/Fraunhofer_FDK_AAC
[7]: https://lame.sourceforge.io/
[8]: https://bitbucket.org/gbcox/transflac/wiki/src-tf-conf-override.sh
[9]: https://bitbucket.org/gbcox/transflac/wiki/TransFLAC
[10]: https://fedoraproject.org/
[11]: https://fedoramagazine.org/wp-content/uploads/2023/08/transflac_demo-2.svg
