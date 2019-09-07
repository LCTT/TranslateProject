[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11316-1.html)
[#]: subject: (5 open source speed-reading applications)
[#]: via: (https://opensource.com/article/19/8/speed-reading-open-source)
[#]: author: (Jaouhari Youssef https://opensource.com/users/jaouhari)

5 个开源的速读应用
======

> 使用这五个应用训练自己更快地阅读文本。

![](https://img.linux.net.cn/data/attachment/album/201909/07/151320r39o26onsp3sq1qo.jpg)

英国散文家和政治家 [Joseph Addison][2] 曾经说过，“读书益智，运动益体。”如今，我们大多数人（如果不是全部）都是通过计算机显示器、电视屏幕、移动设备、街道标志、报纸、杂志上阅读，以及在工作场所和学校阅读论文来训练我们的大脑。

鉴于我们每天都会收到大量的书面信息，通过做一些挑战我们经典的阅读习惯并教会我们吸收更多内容和数据的特定练习，来训练我们的大脑以便更快地阅读似乎是有利的。学习这些技能的目的不仅仅是浏览文本，因为没有理解的阅读就是浪费精力。目标是提高你的阅读速度，同时仍然达到高水平的理解。

### 阅读和处理输入

在深入探讨速读之前，让我们来看看阅读过程。根据法国眼科医生 Louis Emile Javal 的说法，阅读分为三个步骤：

  1. 固定
  2. 处理
  3. <ruby>[扫视][3]<rt>saccade</rt></ruby>

在第一步，我们确定文本中的固定点，称为最佳识别点。在第二步中，我们在眼睛固定的同时引入（处理）新信息。最后，我们改变注视点的位置，这是一种称为扫视的操作，此时未获取任何新信息。

在实践中，阅读更快的读者之间的主要差异是固定时间短于平均值，更长距离扫视，重读更少。

### 阅读练习

阅读不是人类的自然过程，因为它是人类生存跨度中一个相当新的发展。第一个书写系统是在大约 5000 年前创建的，它不足以让人们发展成为阅读机器。因此，我们必须运用我们的阅读技巧，在这项沟通的基本任务中变得更加娴熟和高效。

第一项练习包括减少默读，也被称为无声语音，这是一种在阅读时内部发音的习惯。它是一个减慢阅读速度的自然过程，因为阅读速度限于语速。减少默读的关键是只说出一些阅读的单词。一种方法是用其他任务来占据内部声音，例如用口香糖。

第二个练习包括减少回归，或称为重读。回归是一种懒惰的机制，因为我们的大脑可以随时重读任何材料，从而降低注意力。

### 5 个开源应用来训练你的大脑

有几个有趣的开源应用可用于锻炼你的阅读速度。

一个是 [Gritz][4]，它是一个开源文件阅读器，它一次一个地弹出单词，以减少回归。它适用于 Linux、Windows 和 MacOS，并在 GPL 许可证下发布，因此你可以随意使用它。

其他选择包括 [Spray Speed-Reader][5]，一个用 JavaScript 编写的开源速读应用，以及 [Sprits-it!][6]，一个开源 Web 应用，可以快速阅读网页。

对于 Android 用户，[Comfort Reader][7] 是一个开源的速读应用。它可以在 [F-droid][8] 和 [Google Play][9] 应用商店中找到。

我最喜欢的应用是 [Speedread][10]，它是一个简单的终端程序，它可以在最佳阅读点逐字显示文本。要安装它，请在你的设备上克隆 Github 仓库，然后输入相应的命令来选择以喜好的每分钟字数 （WPM）来阅读文档。默认速率为 250 WPM。例如，要以 400 WPM 阅读 `your_text_file.txt`，你应该输入：

```
`cat your_text_file.txt | ./speedread -w 400`
```

下面是该程序的运行界面：

![Speedread demo][11]

由于你可能不会只阅读[纯文本][12]，因此可以使用 [Pandoc][13] 将文件从标记格式转换为文本格式。你还可以使用 Android 终端模拟器 [Termux][14] 在 Android 设备上运行 Speedread。

### 其他方案

对于开源社区来说，构建一个解决方案是一个有趣的项目，它仅为了通过使用特定练习来提高阅读速度，以此改进如默读和重读。我相信这个项目会非常有益，因为在当今信息丰富的环境中，提高阅读速度非常有价值。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/speed-reading-open-source

作者：[Jaouhari Youssef][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jaouhari
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_stack_library_reading.jpg?itok=uulcS8Sw (stack of books)
[2]: https://en.wikipedia.org/wiki/Joseph_Addison
[3]: https://en.wikipedia.org/wiki/Saccade
[4]: https://github.com/jeffkowalski/gritz
[5]: https://github.com/chaimpeck/spray
[6]: https://github.com/the-happy-hippo/sprits-it
[7]: https://github.com/mschlauch/comfortreader
[8]: https://f-droid.org/packages/com.mschlauch.comfortreader/
[9]: https://play.google.com/store/apps/details?id=com.mschlauch.comfortreader
[10]: https://github.com/pasky/speedread
[11]: https://opensource.com/sites/default/files/uploads/speedread_demo.gif (Speedread demo)
[12]: https://plaintextproject.online/
[13]: https://opensource.com/article/18/9/intro-pandoc
[14]: https://termux.com/
