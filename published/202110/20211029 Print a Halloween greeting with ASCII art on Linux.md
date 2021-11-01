[#]: subject: "Print a Halloween greeting with ASCII art on Linux"
[#]: via: "https://opensource.com/article/21/10/ascii-linux-halloween"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13939-1.html"

在 Linux 上用 ASCII 艺术打印万圣节问候语
======

> 使用 Linux 或 FreeDOS 从一个 C 程序中生成彩色的 ASCII 艺术。

![FreeDOS 上的庆祝万圣节 ASCII 艺术][1]

利用扩展 ASCII 字符集和它的绘画元素集合的全彩 ASCII 艺术在 DOS 上曾经相当流行。你可以在你的下一个 FreeDOS 程序中加入 ASCII 艺术，作为一个很酷的“欢迎”屏幕，或者作为一个提供了更多程序信息的彩色“退出”屏幕，来增加一点视觉上的乐趣。

但是，这种 ASCII 艺术的风格并不仅仅局限于 FreeDOS 程序。你可以在 Linux 终端模式的程序中使用同样的方法。虽然 Linux 使用 [ncurses][2] 来控制屏幕，而不是 DOS 的 [conio][3]，但相关的概念也适用于 Linux 程序。本文探讨了如何从 C 语言程序中生成彩色 ASCII 艺术。

### ASCII 艺术文件

你可以使用各种工具来绘制你的 ASCII 艺术。在这个例子中，我使用了一个叫做 TheDraw 的老式 DOS 应用程序，但是你可以在 Linux 上找到现代的开源 ASCII 艺术程序，比如 [Moebius][4]（Apache 许可证）或者 [PabloDraw][5]（MIT 许可证）。只要你知道保存的数据是什么样子的，你使用什么工具并不重要。

下面是一个 ASCII 艺术文件样本的一部分，以 C 源代码保存。请注意，这个代码片段定义了几个值。`IMAGEDATA_WIDTH` 和 `IMAGEDATA_DEPTH` 定义了屏幕上的列数和行数。在这里，它是一个 80x25 的 ASCII 艺术“图像”。`IMAGEDATA_LENGTH` 定义了 `IMAGEDATA` 数组中的条目数量。ASCII 艺术画面中的每个字符可以用两个字节的数据表示。要显示的字符和包含该字符的前景和背景颜色的颜色属性。对于一个 80x25 的屏幕，每个字符都与一个属性配对，该数组包含 4000 个条目（即 `80*25*2=4000`）。

```
#define IMAGEDATA_WIDTH 80
#define IMAGEDATA_DEPTH 25
#define IMAGEDATA_LENGTH 4000
unsigned char IMAGEDATA [] = {
    '.', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
    ' ', 0x08,  ' ', 0x08,  '.', 0x0F,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
    ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  '.', 0x0F,
    ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
    ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
```

数组的其它部分依此类推。

为了在屏幕上显示这种 ASCII 艺术，你需要写一个小小的程序来读取数组并以正确的颜色打印每个字符。

### 设置一个颜色属性

这个 ASCII 艺术文件中的颜色属性在一个字节中定义了背景和前景的颜色，用十六进制的值表示，如 `0x08` 或 `0x6E`。十六进制是适合表达这样的颜色“对”的紧凑方式。

像 Linux 上的 ncurses 或 DOS 上的 conio 这样的字符模式系统 [只能显示 16 种颜色][6]。这就是十六种可能的文本颜色和八种背景颜色。用二进制计算十六个值（从 0 到 15）只需要四个二进制位。

> `1111` 是二进制的 15

而且方便的是，十六进制可以用一个字符表示 0 到 15：`0`、`1`、`2`、`3`、`4`、`5`、`6`、`7`、`8`、`9`、`A`、`B`、`C`、`D`、`E` 和 `F`。所以十六进制的值 `F` 是数字 15，或二进制的 `1111`。

通过颜色对，你可以用一个八位的字节来编码背景和前景的颜色。这就是文本颜色的四个二进制位（十六进制中的 0 到 15 或 0 到 F）和背景颜色的三个二进制位（十六进制中的 0 到 7 或 0 到 E）。字节中剩余的二进制位在这里没有使用，所以我们可以忽略它。

为了将颜色对或属性转换成你的程序可以使用的颜色值，你需要 [使用位掩码][7]，只指定用于文字颜色或背景颜色的位。使用 FreeDOS 上的 OpenWatcom C 编译器，你可以编写这个函数，从颜色属性中适当地设置颜色。

```
void
textattr(int newattr)
{
  _settextcolor(newattr & 15);         /* 0000xxxx */
  _setbkcolor((newattr >> 4) & 7);     /* 0xxx0000 */
}
```

`_settextcolor` 函数只设置文本颜色，`_setbkcolor` 函数设置背景颜色。两者都定义在 `graph.h` 中。注意，由于颜色属性在一个字节值中包括了背景色和前景色，`textattr` 函数使用 `&`（二进制的“与”运算）来设置一个位掩码，只隔离了属性中的最后四个位。这就是颜色对存储前景颜色的值 0 到 15 的地方。

为了得到背景色，该函数首先执行了一个位移，将位“推”到右边。这就把“上”位放到了“下”位范围，所以任何像 `0xxx0000` 这样的位都变成了 `00000xxx`。我们可以用另一个的位掩码 7（二进制 `0111`）来挑选出背景颜色值。

### 显示 ASCII 艺术

`IMAGEDATA` 数组包含整个 ASCII 艺术屏幕和每个字符的颜色值。为了在屏幕上显示 ASCII 艺术，你的程序需要扫描该数组，设置颜色属性，然后一次在屏幕上显示一个字符。

让我们在屏幕的底部留出空间，以便向用户提供单独的信息或提示。也就是说，我不想显示一个 80 列 ASCII 屏幕的所有 25 行，而只想显示前 24 行。

```
  /* print one line less than the 80x25 that's in there:
     80 x 24 x 2 = 3840 */

  for (pos = 0; pos < 3840; pos += 2) {
...
  }
```

在 `for` 循环里面，我们需要设置颜色，然后打印字符。OpenWatcom C 编译器提供了一个函数 `_outtext` 来显示带有当前颜色值的文本。然而，这需要传递一个字符串，如果我们需要一个一个地处理每个字符，在一行中的每个字符需要不同颜色的情况下，效率就会很低。

相反，OpenWatcom 有一个类似的函数，叫做 `_outmem`，允许你指示要显示多少个字符。对于一次一个字符，我们可以在 `IMAGEDATA` 数组中提供一个字符值的指针，并告诉 `_outtext` 只显示一个字符。这将使用当前的颜色属性显示该字符，这就是我们需要的。

```
  for (pos = 0; pos < 3840; pos += 2) {
    ch = &IMAGEDATA[pos];              /* pointer assignment */
    attr = IMAGEDATA[pos + 1];
 
    textattr(attr);
    _outmem(ch, 1);
  }
```

这个更新的 `for` 循环通过向 `IMAGEDATA` 数组分配一个指针来设置字符 `ch`。接下来, 循环设置文本属性, 然后用 `_outmem` 显示字符.

### 整合起来

有了 `textattr` 函数和处理数组的 `for` 循环, 我们可以编写一个完整的程序来显示 ASCII 艺术文件的内容。对于这个例子，将 ASCII 艺术文件保存为 `imgdata.inc`，并用 `#include` 语句将其包含在源文件中。

```
#include <stdio.h>
#include <conio.h>
#include <graph.h>

#include "imgdata.inc"

void
textattr(int newattr)
{
  _settextcolor(newattr & 15);         /* 0000xxxx */
  _setbkcolor((newattr >> 4) & 7);     /* 0xxx0000 */
}

int
main()
{
  char *ch;
  int attr;
  int pos;

  if (_setvideomode(_TEXTC80) == 0) {
    fputs("Error setting video mode", stderr);
    return 1;
  }

  /* draw the array */

  _settextposition(1, 1);              /* top left */

  /* print one line less than the 80x25 that's in there:
     80 x 24 x 2 = 3840 */

  for (pos = 0; pos < 3840; pos += 2) {
    ch = &IMAGEDATA[pos];              /* pointer assignment */
    attr = IMAGEDATA[pos + 1];

    textattr(attr);
    _outmem(ch, 1);
  }

  /* done */

  _settextposition(25, 1);             /* bottom left */

  textattr(0x0f);
  _outtext("Press any key to quit");

  getch();

  textattr(0x00);
  return 0;
}
```

在 FreeDOS 上使用 OpenWatcom C 编译器编译该程序，你会得到一个显示这个节日信息的新程序。

![ASCII艺术中的万圣节信息][8]

*万圣节快乐（Jim Hall, [CC-BY-SA 4.0][9])*

万圣节快乐，各位！

- [在此下载 inc 代码文件][10]
- [在此下载 C 代码文件][11]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/ascii-linux-halloween

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-halloween-4x3.jpg?itok=6e_42rs9 (Happy Halloween ASCII art on FreeDOS)
[2]: https://opensource.com/article/21/8/ncurses-linux
[3]: https://opensource.com/article/21/9/programming-dos-conio
[4]: https://blocktronics.github.io/moebius/
[5]: https://github.com/blocktronics/pablodraw
[6]: https://opensource.com/article/21/6/freedos-sixteen-colors
[7]: https://opensource.com/article/21/8/binary-bit-fields-masks
[8]: https://opensource.com/sites/default/files/freedos-halloween-4x3.png
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/imgdata.inc_.txt
[11]: https://opensource.com/sites/default/files/uploads/hallown.c.txt
