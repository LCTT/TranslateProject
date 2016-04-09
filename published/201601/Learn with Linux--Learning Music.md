与 Linux 一起学习：玩音乐
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-featured.png)

[与 Linux 一起学习：][1]的所有文章：

- [与 Linux 一起学习：学习打字][2]
- [与 Linux 一起学习：物理模拟][3]
- [与 Linux 一起学习：玩音乐][4]
- [与 Linux 一起学习：两款地理软件][5]
- [与 Linux 一起学习：掌握数学][6]

引言：Linux 提供大量的教学软件和工具，面向各个年级段以及不同年龄段，提供大量学科的练习实践，其中大多数是可以与用户进行交互的。本“与 Linux 一起学习：”系列就来介绍一些教学软件。

学习音乐是一个很好的消遣方式。训练你的耳朵能识别音阶与和弦、掌握一门乐器、控制自己的嗓音，这些都需要大量的练习，以及会遇到很多困难。音乐理论非常博大精深，有太多东西需要记忆，你需要非常勤奋才能将这些东西变成你的“技术”。在你的音乐之路上，Linux 提供了杰出的软件来帮助你前行。它们不能让你立刻成为一个音乐家，但可以作为一个降低学习难度的好助手。

### Gnu Solfège ###

[Solfège][7] 是一个世界流行的音乐教学工具，适用于各个级别的音乐教育。很多流行的教学方法（比如著名的柯达伊教学法）就使用 Solfège 作为它们的基础。相比于学到音乐知识，Solfège 更关注于让用户不断练习音乐。它预期的用户是那些已经有一些音乐基础，并且想不断练习音乐技巧的学生。 

以下是 GNU 网站的开发者声明：

> “当你在高校、学院、音乐学校中学习音乐，你一般要进行的一些听力训练，比如视唱，会比较简单，但是通常需要两个人配合，一个问，一个答。[...] GNU Solfège 尝试着解决这个问题，你可以在没有其他人的帮助下完成更多的简单机械式练习。只是别忘了这些练习只是整个音乐训练过程的一部分。”

这款软件兑现了它的承诺，你可以在试听帮手的帮助下练习几乎所有音乐技巧。

Debian 和 Ubuntu 的仓库上有这款软件，在终端运行下面命令安装软件：

    sudo apt-get install solfege

它开启的时候会出现一个简单的开始界面。

![learnmusic-solfege-main](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-main.png)

这些选项几乎包含了所有种类，大多数链接里面都有子类，你可以从中选择独立的练习。

![learnmusic-solfege-scales](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-scales.png)

![learnmusic-solfege-hun](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-hun.png)

软件提供多种练习和测试项目，都能通过外接的 MIDI 设备（LCTT 译注：MIDI，Musical Instrument Digital Interface，乐器数字接口）或者声卡来播放音乐。这些练习还配合音符播放，以及支持慢动作回放功能。

很重要的一点是如果你在 Ubuntu 下使用 Solfège，默认情况下你可能没法听到声音（除非你有外接 MIDI 设备）。如果出现了这种情况，点击“File -> Prefernces -> Sound Setup”，选择合适的设备（一般情况下选 ALSA 都能解决问题）。

![learnmusic-solfege-midi](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-solfege-midi.png)

Solfège 对你的日常练习非常有帮助，经常使用它，可以在你开始唱 do-re-mi 之前练好你的音乐听觉。

### Tete （听力训练） ###

[Tete][8] （这款听力训练软件）是一款简单但有效的 JAVA 软件，用于[训练听力][9]。它通过在不同背景下播放不同和弦以及不同 MIDI 声音来训练你分辨不同的音阶。[从 SourceForge 下载][10]，然后解压它。

    unzip Tete-*

进入解压出来的目录：

    cd Tete-*

这里假设你的系统已经安装好了 JAVA，你可以使用下面的命令执行 Java 文件：

    java -jar Tete-[版本号]

（可以在输入“Tete-”后按 Tab 键进行自动补全。）

Tete 只有一个简单的界面，所有内容都在这里了。

![learnmusic-tete-main](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-tete-main.png)

你可以选择表演音阶（见上图），和弦（下图），

![learnmusic-tete-chords](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-tete-chords.png)

或音程。

![learnmusic-tete-intervals](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-tete-intervals.png)

你可以“精调”很多选项，包括 midi 乐器的声音、提升或降低音阶以及回放的快慢等等。SourceForge 网站上有关于 Tete 的非常有用的教程，介绍了这个软件的各个方面。

### JalMus ###

Jalmus 是用 JAVA 写的键盘音符阅读训练器。可以外接 MIDI 键盘，也可以使用虚拟键盘。它提供很多简单的课程练习来训练你的音符阅读能力。虽然这个软件在2013年之后就不再更新了，但还是比较实用的。

进入 [sourceforge 页面][11]下载最后版本（v2.3）的 JAVA 安装器，或者在终端输入下面的命令下载：

    wget http://garr.dl.sourceforge.net/project/jalmus/Jalmus-2.3/installjalmus23.jar

下载完成后，加载安装器：

    java -jar installjalmus23.jar

跨平台的 JAVA 安装器会一步一步引导你完成安装的。

Jalmus 的主界面非常朴素。

![learnmusic-jalmus-main](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-main.jpg)

你可以在“Lessons”菜单中找到各种不同难度的课程，从非常简单（一行音符从左边向右滑过，键盘上相应的按键会高亮显示），

![learnmusic-jalmus-singlenote](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-singlenote.png)

到非常困难（有多行音符从右向左滑过，你需要按顺序键入音符）。

![learnmusic-jalmus-multinote](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-multinote.png)

Jalmus 也包含一些阅读单个音符的训练，内容和课程相似，只是没有那些视觉上的提示了。当完成训练后，屏幕上会显示你的乐谱。它还提供不同难度的节拍训练，你能听到并看到这些训练里面播放的节拍。在多行乐谱同时播放时，一个节拍器（能听见能看见）可以帮你理解

![learnmusic-jalmus-rhythm](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-rhythm.png)

和阅读乐谱。

![learnmusic-jalmus-score](https://www.maketecheasier.com/assets/uploads/2015/07/learnmusic-jalmus-score.png)

所有这些功能都是可配置的，你可以选择打开或者关闭它们。

总的来说，Jalmus 可能是节奏训练软件中属于功能最强的，虽然它不是学音乐必备的软件，但在节奏训练这个特殊的领域，它做得很出色。

### 号外 ###

#### TuxGuitar ####

对于吉他练习者，[TuxGuitar][12] 看起来很像 Windows 下面的 Guitar Pro 软件（它也可以读 Guitar Pro 格式的文件）。

#### PianoBooster ####

[Piano Booster][13] 可以练习钢琴技巧，它能播放 MIDI 文件，你可以使用外接键盘来弹钢琴，同时还能查看屏幕上滑过的乐谱。

### 总结 ###

Linux 提供很多优秀的工具供你学习，如果你对音乐感兴趣，你完全不用担心没有帮你练习音乐技术的软件。实际上，可供学习音乐的学生选择的优秀软件数量远比上面介绍的要多。如果你还知道其他的音乐训练软件，请在写下你的评论，让我们能够知道。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/linux-learning-music/

作者：[Attila Orosz][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
[1]:https://www.maketecheasier.com/series/learn-with-linux/
[2]:https://www.maketecheasier.com/learn-to-type-in-linux/
[3]:https://www.maketecheasier.com/linux-physics-simulation/
[4]:https://www.maketecheasier.com/linux-learning-music/
[5]:https://www.maketecheasier.com/linux-geography-apps/
[6]:https://www.maketecheasier.com/learn-linux-maths/
[7]:https://en.wikipedia.org/wiki/Solf%C3%A8ge
[8]:http://tete.sourceforge.net/index.shtml
[9]:https://en.wikipedia.org/wiki/Ear_training
[10]:http://sourceforge.net/projects/tete/files/latest/download
[11]:http://sourceforge.net/projects/jalmus/files/Jalmus-2.3/
[12]:http://tuxguitar.herac.com.ar/
[13]:http://www.linuxlinks.com/article/20090517041840856/PianoBooster.html
