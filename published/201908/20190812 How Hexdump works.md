[#]: collector: (lujun9972)
[#]: translator: (0x996)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11288-1.html)
[#]: subject: (How Hexdump works)
[#]: via: (https://opensource.com/article/19/8/dig-binary-files-hexdump)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Hexdump 如何工作
======

> Hexdump 能帮助你查看二进制文件的内容。让我们来学习 Hexdump 如何工作。

![](https://img.linux.net.cn/data/attachment/album/201908/31/111531h9kzcqooluooqoo7.jpg)

Hexdump 是个用十六进制、十进制、八进制数或 ASCII 码显示二进制文件内容的工具。它是个用于检查的工具，也可用于[数据恢复][2]、逆向工程和编程。

### 学习基本用法

Hexdump 让你毫不费力地得到输出结果，依你所查看文件的尺寸，输出结果可能会非常多。本文中我们会创建一个 1x1 像素的 PNG 文件。你可以用图像处理应用如 [GIMP][3] 或 [Mtpaint][4] 来创建该文件，或者也可以在终端内用 [ImageMagick][5] 创建。

用 ImagiMagick 生成 1x1 像素 PNG 文件的命令如下：

```
$ convert -size 1x1 canvas:black pixel.png
```

你可以用 `file` 命令确认此文件是 PNG 格式：

```
$ file pixel.png
pixel.png: PNG image data, 1 x 1, 1-bit grayscale, non-interlaced
```

你可能好奇 `file` 命令是如何判断文件是什么类型。巧的是，那正是 `hexdump` 将要揭示的原理。眼下你可以用你常用的图像查看软件来看看你的单一像素图片（它看上去就像这样：`.`），或者你可以用  `hexdump` 查看文件内部：

```
$ hexdump pixel.png
0000000 5089 474e 0a0d 0a1a 0000 0d00 4849 5244
0000010 0000 0100 0000 0100 0001 0000 3700 f96e
0000020 0024 0000 6704 4d41 0041 b100 0b8f 61fc
0000030 0005 0000 6320 5248 004d 7a00 0026 8000
0000040 0084 fa00 0000 8000 00e8 7500 0030 ea00
0000050 0060 3a00 0098 1700 9c70 51ba 003c 0000
0000060 6202 474b 0044 dd01 138a 00a4 0000 7407
0000070 4d49 0745 07e3 081a 3539 a487 46b0 0000
0000080 0a00 4449 5441 d708 6063 0000 0200 0100
0000090 21e2 33bc 0000 2500 4574 7458 6164 6574
00000a0 633a 6572 7461 0065 3032 3931 302d 2d37
00000b0 3532 3254 3a30 3735 353a 2b33 3231 303a
00000c0 ac30 5dcd 00c1 0000 7425 5845 6474 7461
00000d0 3a65 6f6d 6964 7966 3200 3130 2d39 3730
00000e0 322d 5435 3032 353a 3a37 3335 312b 3a32
00000f0 3030 90dd 7de5 0000 0000 4549 444e 42ae
0000100 8260
0000102
```

透过一个你以前可能从未用过的视角，你所见的是该示例 PNG 文件的内容。它和你在图像查看软件中看到的是完全一样的数据，只是用一种你或许不熟悉的方式编码。

### 提取熟悉的字符串

尽管默认的数据输出结果看上去毫无意义，那并不意味着其中没有有价值的信息。你可以用 `--canonical` 选项将输出结果，或至少是其中可翻译的部分，翻译成更加熟悉的字符集：

```
$ hexdump --canonical foo.png 
00000000  89 50 4e 47 0d 0a 1a 0a  00 00 00 0d 49 48 44 52  |.PNG........IHDR|
00000010  00 00 00 01 00 00 00 01  01 00 00 00 00 37 6e f9  |.............7n.|
00000020  24 00 00 00 04 67 41 4d  41 00 00 b1 8f 0b fc 61  |$....gAMA......a|
00000030  05 00 00 00 20 63 48 52  4d 00 00 7a 26 00 00 80  |.... cHRM..z&...|
00000040  84 00 00 fa 00 00 00 80  e8 00 00 75 30 00 00 ea  |...........u0...|
00000050  60 00 00 3a 98 00 00 17  70 9c ba 51 3c 00 00 00  |`..:....p..Q<...|
00000060  02 62 4b 47 44 00 01 dd  8a 13 a4 00 00 00 07 74  |.bKGD..........t|
00000070  49 4d 45 07 e3 07 1a 08  39 35 87 a4 b0 46 00 00  |IME.....95...F..|
00000080  00 0a 49 44 41 54 08 d7  63 60 00 00 00 02 00 01  |..IDAT..c`......|
00000090  e2 21 bc 33 00 00 00 25  74 45 58 74 64 61 74 65  |.!.3...%tEXtdate|
000000a0  3a 63 72 65 61 74 65 00  32 30 31 39 2d 30 37 2d  |:create.2019-07-|
000000b0  32 35 54 32 30 3a 35 37  3a 35 33 2b 31 32 3a 30  |25T20:57:53+12:0|
000000c0  30 ac cd 5d c1 00 00 00  25 74 45 58 74 64 61 74  |0..]....%tEXtdat|
000000d0  65 3a 6d 6f 64 69 66 79  00 32 30 31 39 2d 30 37  |e:modify.2019-07|
000000e0  2d 32 35 54 32 30 3a 35  37 3a 35 33 2b 31 32 3a  |-25T20:57:53+12:|
000000f0  30 30 dd 90 e5 7d 00 00  00 00 49 45 4e 44 ae 42  |00...}....IEND.B|
00000100  60 82                                             |`.|
00000102
```

在右侧的列中，你看到的是和左侧一样的数据，但是以 ASCII 码展现的。如果你仔细看，你可以从中挑选出一些有用的信息，如文件格式（PNG）以及文件创建、修改日期和时间（向文件底部寻找一下）。

`file` 命令通过头 8 个字节获取文件类型。程序员会参考 [libpng 规范][6] 来知晓需要查看什么。具体而言，那就是你能在该图像文件的头 8 个字节中看到的字符串 `PNG`。这个事实显而易见，因为它揭示了 `file` 命令是如何知道要报告的文件类型。

你也可以控制 `hexdump` 显示多少字节，这在处理大于一个像素的文件时很实用：

```
$ hexdump --length 8 pixel.png
0000000 5089 474e 0a0d 0a1a
0000008
```

`hexdump` 不只限于查看 PNG 或图像文件。你也可以用 `hexdump` 查看你日常使用的二进制文件，如 [ls][7]、[rsync][8]，或你想检查的任何二进制文件。

### 用 hexdump 实现 cat 命令

阅读 PNG 规范的时候你可能会注意到头 8 个字节中的数据与 `hexdump` 提供的结果看上去不一样。实际上，那是一样的数据，但以一种不同的转换方式展现出来。所以 `hexdump` 的输出是正确的，但取决于你在寻找的信息，其输出结果对你而言不总是直接了当的。出于这个原因，`hexdump` 有一些选项可供用于定义格式和转化其转储的原始数据。

转换选项可以很复杂，所以用无关紧要的东西练习会比较实用。下面这个简易的介绍，通过重新实现 [cat][9] 命令来演示如何格式化 `hexdump` 的输出。首先，对一个文本文件运行 `hexdump` 来查看其原始数据。通常你可以在硬盘上某处找到  <ruby>[GNU 通用许可证][10]<rt>GNU General Public License</rt></ruby>（GPL）的一份拷贝，也可以用你手头的任何文本文件。你的输出结果可能不同，但下面是如何在你的系统中找到一份 GPL（或至少其部分）的拷贝：

```
$ find /usr/share/doc/ -type f -name "COPYING" | tail -1
/usr/share/doc/libblkid-devel/COPYING
```

对其运行 `hexdump`：

```
$ hexdump /usr/share/doc/libblkid-devel/COPYING
0000000 6854 7369 6c20 6269 6172 7972 6920 2073
0000010 7266 6565 7320 666f 7774 7261 3b65 7920
0000020 756f 6320 6e61 7220 6465 7369 7274 6269
0000030 7475 2065 7469 6120 646e 6f2f 0a72 6f6d
0000040 6964 7966 6920 2074 6e75 6564 2072 6874
0000050 2065 6574 6d72 2073 666f 7420 6568 4720
0000060 554e 4c20 7365 6573 2072 6547 656e 6172
0000070 206c 7550 6c62 6369 4c0a 6369 6e65 6573
0000080 6120 2073 7570 6c62 7369 6568 2064 7962
[...]
```

如果该文件输出结果很长，用 `--length`（或短选项 `-n`）来控制输出长度使其易于管理。

原始数据对你而言可能没什么意义，但你已经知道如何将其转换为 ASCII 码：

```
hexdump --canonical /usr/share/doc/libblkid-devel/COPYING
00000000  54 68 69 73 20 6c 69 62  72 61 72 79 20 69 73 20  |This library is |
00000010  66 72 65 65 20 73 6f 66  74 77 61 72 65 3b 20 79  |free software; y|
00000020  6f 75 20 63 61 6e 20 72  65 64 69 73 74 72 69 62  |ou can redistrib|
00000030  75 74 65 20 69 74 20 61  6e 64 2f 6f 72 0a 6d 6f  |ute it and/or.mo|
00000040  64 69 66 79 20 69 74 20  75 6e 64 65 72 20 74 68  |dify it under th|
00000050  65 20 74 65 72 6d 73 20  6f 66 20 74 68 65 20 47  |e terms of the G|
00000060  4e 55 20 4c 65 73 73 65  72 20 47 65 6e 65 72 61  |NU Lesser Genera|
00000070  6c 20 50 75 62 6c 69 63  0a 4c 69 63 65 6e 73 65  |l Public.License|
[...]
```

这个输出结果有帮助但太累赘且难于阅读。要将 `hexdump` 的输出结果转换为其选项不支持的其他格式，可组合使用 `--format`（或 `-e`）和专门的格式代码。用来自定义格式的代码和 `printf` 命令使用的类似，所以如果你熟悉 `printf`  语句，你可能会觉得 `hexdump` 自定义格式不难学会。

在 `hexdump` 中，字符串 `%_p` 告诉 `hexdump` 用你系统的默认字符集输出字符。`--format` 选项的所有格式符号必须以*单引号*包括起来：

```
$ hexdump -e'"%_p"' /usr/share/doc/libblkid-devel/COPYING
This library is fre*
 software; you can redistribute it and/or.modify it under the terms of the GNU Les*
er General Public.License as published by the Fre*
 Software Foundation; either.version 2.1 of the License, or (at your option) any later.version..*
The complete text of the license is available in the..*
/Documentation/licenses/COPYING.LGPL-2.1-or-later file..
```

这次的输出好些了，但依然不方便阅读。传统上 UNIX 文本文件假定 80 个字符的输出宽度（因为很久以前显示器一行只能显示 80 个字符）。

尽管这个输出结果未被自定义格式限制输出宽度，你可以用附加选项强制 `hexdump` 一次处理 80 字节。具体而言，通过 80 除以 1 这种形式，你可以告诉 `hexdump` 将 80 字节作为一个单元对待：

```
$ hexdump -e'80/1 "%_p"' /usr/share/doc/libblkid-devel/COPYING
This library is free software; you can redistribute it and/or.modify it under the terms of the GNU Lesser General Public.License as published by the Free Software Foundation; either.version 2.1 of the License, or (at your option) any later.version...The complete text of the license is available in the.../Documentation/licenses/COPYING.LGPL-2.1-or-later file..
```

现在该文件被分割成 80 字节的块处理，但没有任何换行。你可以用 `\n` 字符自行添加换行，在 UNIX 中它代表换行：

```
$ hexdump -e'80/1 "%_p""\n"'
This library is free software; you can redistribute it and/or.modify it under th
e terms of the GNU Lesser General Public.License as published by the Free Softwa
re Foundation; either.version 2.1 of the License, or (at your option) any later.
version...The complete text of the license is available in the.../Documentation/
licenses/COPYING.LGPL-2.1-or-later file..
```

现在你已经（大致上）用 `hexdump` 自定义格式实现了 `cat` 命令。

### 控制输出结果

实际上自定义格式是让 `hexdump` 变得有用的方法。现在你已经（至少是原则上）熟悉 `hexdump` 自定义格式，你可以让 `hexdump -n 8` 的输出结果跟 `libpng` 官方规范中描述的 PNG 文件头相匹配了。

首先，你知道你希望 `hexdump` 以 8 字节的块来处理 PNG 文件。此外，你可能通过识别这些整数从而知道 PNG 格式规范是以十进制数表述的，根据 `hexdump` 文档，十进制用 `%d` 来表示：

```
$ hexdump -n8 -e'8/1 "%d""\n"' pixel.png
13780787113102610
```

你可以在每个整数后面加个空格使输出结果变得完美：

```
$ hexdump -n8 -e'8/1 "%d ""\n"' pixel.png
137 80 78 71 13 10 26 10
```

现在输出结果跟 PNG 规范完美匹配了。

### 好玩又有用

Hexdump 是个迷人的工具，不仅让你更多地领会计算机如何处理和转换信息，而且让你了解文件格式和编译的二进制文件如何工作。日常工作时你可以随机地试着对不同文件运行 `hexdump`。你永远不知道你会发现什么样的信息，或是什么时候具有这种洞察力会很实用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/dig-binary-files-hexdump

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[0x996](https://github.com/0x996)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://www.redhat.com/sysadmin/find-lost-files-scalpel
[3]: http://gimp.org
[4]: https://opensource.com/article/17/2/mtpaint-pixel-art-animated-gifs
[5]: https://opensource.com/article/17/8/imagemagick
[6]: http://www.libpng.org/pub/png/spec/1.2/PNG-Structure.html
[7]: https://opensource.com/article/19/7/master-ls-command
[8]: https://opensource.com/article/19/5/advanced-rsync
[9]: https://opensource.com/article/19/2/getting-started-cat-command
[10]: https://en.wikipedia.org/wiki/GNU_General_Public_License
