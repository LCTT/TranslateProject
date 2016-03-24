eSpeak: Linux 文本转语音工具
================================================================================
![Text to speech tool in Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Text-to-speech-Linux.jpg)

[eSpeak][1]是一款 Linux 命令行工具，能把文本转换成语音。它是一款简洁的语音合成器，用C语言编写而成，它支持英语和其它多种语言。

eSpeak 从标准输入或者输入文件中读取文本。虽然语音输出与真人声音相去甚远，但是，在你项目需要的时候，eSpeak 仍不失为一个简便快捷的工具。

eSpeak 部分主要特性如下：

- 提供给 Linux 和 Windows 的命令行工具
- 从文件或者标准输入中把文本读出来
- 提供给其它程序使用的共享库版本
- 为 Windows 提供 SAPI5 版本，所以它能用于 screen-readers 或者其它支持 Windows SAPI5 接口的程序
- 可移植到其它平台，包括安卓，OSX等
- 提供多种声音特性选择
- 语音输出可保存为 [.WAV][2] 格式的文件
- 配合 HTML 部分可支持 SSML(语音合成标记语言，[Speech Synthesis Markup Language][3])
- 体积小巧，整个程序连同语言支持等占用小于2MB
- 可以实现文本到音素编码（phoneme code）的转化，因此可以作为其它语音合成引擎的前端工具
- 开发工具可用于生产和调整音素数据

### 安装 eSpeak ###

基于 Ubuntu 的系统中，在终端运行以下命令安装 eSpeak：

    sudo apt-get install espeak

eSpeak 是一个古老的工具，我推测它应该能在其它众多 Linux 发行版中运行，比如 Arch，Fedora。使用 dnf，pacman 等命令就能轻松安装。

eSpeak 用法如下：输入 espeak 运行程序。输入字符按 enter 转换为语音输出（LCTT 译注：补充）。使用 Ctrl+C 来关闭运行中的程序。

![eSpeak command line](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/eSpeak-example.png)

还有一些其他的选项可用，可以通过程序帮助进行查看。

### GUI 版本：Gespeaker ###

如果你更倾向于使用 GUI 版本，可以安装 Gespeaker，它为 eSpeak 提供了 GTK 界面。

使用以下命令来安装 Gespeaker：

    sudo apt-get install gespeaker

操作界面简明易用，你完全可以自行探索。

![eSpeak GUI tool for text to speech in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/eSpeak-GUI.png)

虽然这些工具在大多数计算任务下用不到，但是当你的项目需要把文本转换成语音时，使用 espeak 还是挺方便的。是否使用 espeak 这款语音合成器，选择权就交给你们啦。

--------------------------------------------------------------------------------

via: http://itsfoss.com/espeak-text-speech-linux/

作者：[Abhishek][a]
译者：[soooogreen](https://github.com/soooogreen)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://espeak.sourceforge.net/
[2]:http://en.wikipedia.org/wiki/WAV
[3]:http://en.wikipedia.org/wiki/Speech_Synthesis_Markup_Language
