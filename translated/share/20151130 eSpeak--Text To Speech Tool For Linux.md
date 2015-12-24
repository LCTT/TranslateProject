eSpeak: Linux文本转语音工具
================================================================================
![Text to speech tool in Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Text-to-speech-Linux.jpg)

[eSpeak][1]是Linux的命令行工具，能把文本转变成语音。这是一款用C语言写就的精致的语音合成器，提供英语和其它多种语言支持。

eSpeak从标准输入或者输入文件中读取文本。虽然语音输出与真人声音相去甚远，但是，在你项目有用得到的地方，eSpeak仍不失为一个精致快捷的工具。

eSpeak部分主要特性如下：

- 为Linux和Windows准备的命令行工具
- 从文件或者标准输入中把文本读出来
- 提供给其它程序使用的共享库版本
- 为Windows提供SAPI5版本，在screen-readers或者其它支持Windows SAPI5接口程序的支持下，eSpeak仍然能正常使用
- 可移植到其它平台，包括安卓，OSX等
- 多种特色声音提供选择
- 语音输出可保存为[.WAV][2]格式的文件
- 部分SSML([Speech Synthesis Markup Language][3])能为HTML所支持
- 体积小巧，整个程序包括语言支持等占用不足2MB
- 可以实现文本到音素编码的转化，能被其它语音合成引擎吸纳为前端工具
- 可作为生成和调制音素数据的开发工具

### 安装eSpeak ###

基于Ubuntu的系统中，在终端运行以下命令安装eSpeak：

    sudo apt-get install espeak

eSpeak is an old tool and I presume that it should be available in the repositories of other Linux distributions such as Arch Linux, Fedora etc. You can install eSpeak easily using dnf, pacman etc.eSpeak是一个古老的工具，我推测它应该能在其它众多Linux发行版如Arch，Fedora中运行。使用dnf，pacman等命令就能轻易安装。

eSpeak用法如下：输入espeak按enter键运行程序。输入字符按enter转换为语音输出（译补）。使用Ctrl+C来关闭运行中的程序。

![eSpeak command line](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/eSpeak-example.png)

还有其它可以的选项，可以通过程序帮助进行查看。

### GUI版本：Gespeaker ###

如果你更倾向于使用GUI版本，可以安装Gespeaker，它为eSpeak提供了GTK界面。

使用以下命令来安装Gespeaker：

    sudo apt-get install gespeaker

操作接口简明易用，你完全可以自行探索。

![eSpeak GUI tool for text to speech in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/eSpeak-GUI.png)

虽然这个工具不能为大部分计算所用，但是当你的项目需要把文本转换成语音，espeak还是挺方便使用的。需则用之吧~

--------------------------------------------------------------------------------

via: http://itsfoss.com/espeak-text-speech-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/soooogreen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://espeak.sourceforge.net/
[2]:http://en.wikipedia.org/wiki/WAV
[3]:http://en.wikipedia.org/wiki/Speech_Synthesis_Markup_Language
