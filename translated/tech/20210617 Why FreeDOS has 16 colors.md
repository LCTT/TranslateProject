[#]: subject: (Why FreeDOS has 16 colors)
[#]: via: (https://opensource.com/article/21/6/freedos-sixteen-colors)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (gpchn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

为什么 FreeDOS 有 16 种颜色
======
为什么文本只能使用这些有限的颜色显示，为什么 FreeDOS 使用这些颜色和阴影，而不是其他颜色？
答案就像技术中的许多事情一样，因为历史。

![在 1980 年代计算机上打字][1]

如果您仔细了解过 FreeDOS，您可能已经注意到文本有有限的颜色范围——16 种文本颜色和 8 种背景颜色。这类似于 Linux 显示文本颜色的方式——您或许能够在 Linux 终端中更改 _文本颜色_，但您仍然只能使用 16 种文本颜色和 8 种背景颜色。

![终端颜色][2]

DOS 文本有 16 种颜色和 8 种背景颜色
（吉姆·霍尔，[CC-BY SA 4.0][3]）

为什么文本只能使用这些有限的颜色显示，为什么 FreeDOS 使用这些颜色和阴影，而不是其他颜色？
答案就像技术中的许多事情一样，因为历史。

### PC 色彩的由来

为了解释为什么文本只有十六种颜色，让我给你讲一个关于第一台 IBM 个人计算机的故事。这个故事的部分内容可能有些杜撰，但基本内容已经足够接近。

IBM 于 1981 年发布了个人计算机 5150（“IBM PC”）。该 PC 使用了一个简单的监视器屏幕，以绿色显示文本。由于此显示器仅适用于一种颜色，因此被称为 _monochrome_（“IBM 5151 单色显示器”，搭载 IBM Monochrome Display Adapter 卡，或“MDA”）。

同年，IBM 发布了 PC 的更新版本，具有惊人的技术成就——颜色！新的 IBM 5153 彩色显示器依赖于新的 IBM 彩色图形适配器或“CGA”。正是由于这个原始的 CGA，所有的 DOS 文本都继承了它们的颜色。

但在我们讨论那一部分之前，我们首先需要了解一些关于颜色的东西。当我们谈论计算机屏幕上的颜色时，我们谈论的是混合 _三原色_（红色、绿色和蓝色）的不同值。您可以将不同级别（或“亮度”）的红光、绿光和蓝光混合在一起，以创建几乎任何颜色。混合红色和蓝色光，你会得到洋红色。混合蓝色和绿色，你会得到青色或浅绿色。均匀地混合所有颜色，你会得到白色。没有任何浅色，您会看到黑色（没有颜色）。

![三原色][4]

混合红色、绿色和蓝色光以获得不同的颜色
（吉姆·霍尔，[CC-BY SA 4.0][3]）

IBM 5153 彩色显示器通过在阴极射线管（“CRT”）上点亮微小的红色、绿色和蓝色光点来向用户呈现颜色。这些小点排列得非常紧密，并以红色、绿色和蓝色的三色点组成一个“像素”的模式排列。通过控制同时点亮哪些荧光点，IBM 5153 彩色显示器可以显示不同颜色的像素。

![CRT 像素][5]

每个红色、绿色和蓝色三元组都是一个像素
（吉姆·霍尔，[CC-BY SA 4.0][3]）

顺便说一句，即使是现代显示器也使用这种红色、绿色和蓝色点的组合来表示颜色。现代计算机的不同之处在于，每个像素都使用红色、绿色和蓝色 LED 灯（通常并排排列），而不是微小的荧光点。计算机可以打开或关闭每个 LED 灯，以混合每个像素中的红色、绿色和蓝色。

![液晶像素][6]

每个红色、绿色和蓝色三元组都是一个像素
（吉姆·霍尔，[CC-BY SA 4.0][3]）

### 定义 CGA 颜色

IBM 工程师意识到他们可以通过混合红色、绿色和蓝色像素来显示多种颜色。在最简单的情况下，您可以假设单个像素中的每个红色、绿色和蓝色点要么“开”，要么“关”。正如任何计算机程序员都会告诉你的那样，你可以将“on”和“off”表示为二进制——1（1=on）和0（0=off）。

用1或0表示红色、绿色和蓝色意味着您可以组合多达八种颜色，从 000（红色、绿色和蓝色都关闭）到 111（红色、绿色和蓝色都打开）。请注意，位模式类似于“RGB”，因此 RGB=001 是蓝色的（只有蓝色是打开的），RGB=011 是青色的（绿色和蓝色都打开了）：

| |
| :----: | 
| 000 Black |
| 001 Blue |
| 010 Green |
| 011 Cyan |
| 100 Red |
| 101 Magenta |
| 110 Yellow |
| 111 White |

但这只是最简单的情况。一位特别聪明的 IBM 工程师意识到，只需再添加一点，您就可以将颜色数量从 8 种颜色增加到 16 种。因此，我们可以使用像 iRGB 这样的位模式，而不是像 RGB 这样的位模式。我们将把这个额外的“i”位称为“强度”位，因为如果我们将“强度”位设置为 1（开），那么我们将在全亮度下点亮红色、绿色和蓝色；如果“强度”位为 0（关闭），我们可以使用一些中级亮度。

有了这个简单的修复程序，现在 CGA 可以显示 16 种颜色！为了简单起见，IBM 工程师将高强度颜色称为常规颜色名称的“明亮”版本。因此，“红色”与“亮红色”配对，“洋红色”与“亮洋红色”配对。

| | |
| :----: | :----: |
| 0000 Black | 1000 Bright Black |
| 0001 Blue | 1001 Bright Blue |
| 0010 Green | 1010 Bright Green |
| 0011 Cyan | 1011 Bright Cyan |
| 0100 Red | 1100 Bright Red |
| 0101 Magenta | 1101 Bright Magenta |
| 0110 Yellow | 1110 Bright Yellow |
| 0111 White | 1111 Bright White |

哦不，等等！这实际上不是十六种颜色。如果您注意到 iRGB=0000（黑色）和 iRGB=1000（亮黑色），它们都是相同的_黑色_。没有颜色可以“亮”，所以它们都是普通的黑色。这意味着我们只有 15 种颜色，而不是我们希望的16种颜色。

但 IBM 有聪明的工程师为他们工作，他们意识到如何解决这个问题以获得 16 种颜色。IBM 实际上没有实现直接的 RGB 到 iRGB，而是实现了_类_ iRGB 方案。随着这一变化，IBM 为每个光点设置了四个亮度级别：完全关闭、三分之一亮度、三分之二亮度和全亮度。如果“亮度”位被关闭，那么每个红色、绿色和蓝色光点将以三分之二的亮度点亮。如果您打开“亮度”位，RGB 颜色中的所有 0 都将以三分之一的亮度点亮，而所有 1 都将以全亮度点亮。

让我用另一种方式向您描述这一点，使用 Web 颜色代码表示。如果您熟悉 HTML 颜色，您可能知道您可以使用 #RGB 表示颜色，其中 RGB 表示红色、绿色和蓝色值的组合，每个值都在十六进制值 0 到 F 之间。因此，使用 IBM 修改后的 iRGB 定义，iRGB=0001 是 #00a（蓝色），iRGB=1001 是 #55f（亮蓝色），因为对于高亮度颜色，RGB=001 中的所有零点都以三分之一的亮度点亮（0 到 F 刻度上的“5”左右），RGB=001 中的所有零点都以三分之二的亮度点亮（0 到 F刻度上的“A”）。

| | |
| :----: | :----: |
| 0000 Black | 1000 Bright Black |
| 0001 Blue | 1001 Bright Blue |
| 0010 Green | 1010 Bright Green |
| 0011 Cyan | 1011 Bright Cyan |
| 0100 Red | 1100 Bright Red |
| 0101 Magenta | 1101 Bright Magenta |
| 0110 Yellow | 1110 Bright Yellow |
| 0111 White | 1111 Bright White |

有了这些颜色，我们终于完成了！我们拥有从 iRGB=0000（黑色）到 iRGB=1111（亮白色）以及介于两者之间的所有颜色的全光谱。 就像彩虹般的颜色，这很漂亮。

除了……不，等等，这里有问题！我们实际上还不能复制彩虹的所有颜色。我们在小学学到的方便的助记符是 ROYGBIV，它可以帮助我们记住彩虹的颜色有红色、橙色、黄色、绿色、蓝色、靛蓝和紫色。我们修改后的 iRGB 配色方案包括红色、黄色、绿色和蓝色——我们可以将其“伪造”为靛蓝和紫色，但是我们缺少橙色。遭了！

![彩虹][7]

一条美丽的彩虹——不幸的是它含有橙色。
（[Paweł Fijałkowski][8]，公共）

为了解决这个问题，聪明的 IBM 工程师对 RGB=110 做了最后的修复。高强度颜色(iRGB=1110) 以全亮度点亮红色和绿色荧光粉点以产生黄色，但是在低亮度颜色（iRGB=0110）下，他们以三分之二的亮度点亮红色，以三分之一的亮度点亮绿色。这将 iRGB=0110 变成了橙色——尽管它后来被称为“棕色”，因为 IBM 不得不在某处弄乱标准名称。

| | |
| :----: | :----: |
| 0000 Black | 1000 Bright Black |
| 0001 Blue | 1001 Bright Blue |
| 0010 Green | 1010 Bright Green |
| 0011 Cyan | 1011 Bright Cyan |
| 0100 Red | 1100 Bright Red |
| 0101 Magenta | 1101 Bright Magenta |
| 0110 Brown | 1110 Yellow |
| 0111 White | 1111 Bright White |

这就是 CGA 以及扩展的 DOS 获得十六种颜色的方式！如果您好奇，这也是为什么会有“亮黑色”的原因，即使它只是一种灰色阴影。

### 表示颜色（bit 和 byte）

但是你可能想知道：为什么 DOS 可以显示 16 种文本颜色，却只能显示 8 种背景颜色？为此，我们需要快速了解计算机如何将颜色信息传递给 CGA 卡。

简而言之，CGA 卡希望将每个字符的文本颜色和背景颜色编码在一个字节数据包中，一共八位。那么八位是从哪里来的呢？

我们刚刚了解了 iRGB（四位）如何生成十六种颜色。文本颜色使用 iRGB ，四位，背景颜色仅限于八种低强度颜色（RGB，三位），加起来只有七位。丢失的第八位在哪里？

最后一点可能是为 DOS 时代最重要的用户界面元素保留的——闪烁文本。虽然今天闪烁的文本可能很烦人，但在整个 1980 年代初期，闪烁的文本是表示错误消息等关键信息的友好方式。

将这个“闪烁”位添加到三个背景颜色位 (RGB) 和四个文本颜色位 (iRGB) 中会产生八个位或一个字节！计算机喜欢以完整字节为单位进行计数，这使其成为将颜色（和闪烁）信息传输到计算机的便捷方式。

因此，表示颜色（和闪烁）的完整字节是“Bbbbffff”，其中“ffff”是文本颜色的 iRGB 位模式（从 0 到 15），“bbb”是低强度的 RGB 位模式背景颜色（从 0 到 7），而 `B` 是“闪烁”位。

十六种文本颜色和八种背景颜色的限制一直持续到今天。当然，DOS 坚持使用这种颜色组合，但即使是像 GNOME 终端这样的 Linux 终端仿真器也仍然受限于 16 种文本颜色和 8 种背景颜色。当然，Linux 终端可能允许您更改使用的特定颜色，但您仍然限于十六种文本颜色和八种背景颜色。为此，您要感谢 DOS 和最初的 IBM PC。别客气！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-sixteen-colors

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[gpchn](https://github.com/gpchn)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://opensource.com/sites/default/files/uploads/16colors.png (DOS text comes in 16 colors and 8 background colors)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/rgb.svg_.png (Mix red, green, and blue light to get different colors)
[5]: https://opensource.com/sites/default/files/uploads/crt.svg_.png (Each red, green, and blue triad is a single pixel)
[6]: https://opensource.com/sites/default/files/uploads/lcd.svg_.png (Each red, green, and blue triad is a single pixel)
[7]: https://opensource.com/sites/default/files/uploads/rainbow.jpg (A beautiful rainbow - which unfortunately contains orange )
[8]: https://www.pexels.com/photo/landscape-photography-of-field-with-wind-mill-with-rainbow-1253748/
