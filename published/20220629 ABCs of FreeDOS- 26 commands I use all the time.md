[#]: subject: "ABCs of FreeDOS: 26 commands I use all the time"
[#]: via: "https://opensource.com/article/22/6/26-freedos-commands"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16276-1.html"

FreeDOS 基础：从 A 到 Z
======

![][0]

> 我很高兴分享我最喜欢的 26 个 FreeDOS 命令。

我家最早的一批计算机中有一台运行着一款名称为 DOS 的命令行操作系统，即 “<ruby>磁盘操作系统<rt>Disk Operating System</rt></ruby>”。我是在 DOS 系统环境中长大的，学会了利用命令行来使我的工作更轻松。很多其他的人也是如此。我们非常爱 DOS ，所以在 1994 年 6 月 29 日，我们创建了 FreeDOS 工程。

如果你的 FreeDOS 的初学者，你可能会对如何使用其附带的不同的命令行程序感到困惑。让我们从我最喜欢的 26 个 FreeDOS 命令开始吧。要学习更多的信息，在大部分命令的后面添加 `/?` 选项来获取更多的信息:

```
C:\>attrib /?
ATTRIB v2.1 - 显示或更高文件属性。
版权所有 (c) 1998-2003，遵循 GPL2 协议。

语法：ATTRIB { options | [path][file] | /@[list] }

选项：

  +H 设置隐藏属性。     -H  清除隐藏属性。
  +S 设置系统属性。     -S  清除系统属性。
  +R 设置只读属性。     -R  清除只读属性。
  +A 设置存档属性。     -A  清楚存档属性。

  /S 处理具体指定路径中的所有目录中的文件。
  /D 处理带有通配符的参数的目录名称。
  /@ 处理文件，文件列在具体指定文件 中 [或 stdin]。

示例：

  attrib file -rhs
  attrib +a -r dir1 dir2*.dat /s
  attrib -hs/sd /@list.txt *.*
```

### A 是 ATTRIB

`ATTRIB` 程序显示或更改文件的 *属性* 。属性可以是以下四个值之一：隐藏（`H`）、系统 `S`）、只读（`R`）、存档（`A`）。

标记为隐藏的文件将不会在目录列表中显示。例如，假设你想隐藏一个名称为  `SECRET.TXT` 的文件，这样就不会有人它在那里。首先，你可以显示该文件的属性，以便查看它的当前设置：

```
C:\FILES>attrib secret.txt 
[----A] SECRET.TXT
```

为隐藏这个文件，使用加号（`+`）操作符来开启用隐藏属性，像这样：

```
C:\FILES>attrib +h secret.txt 
[----A] -> [-H--A] SECRET.TXT
C:\FILES>dir
 Volume in drive C is FREEDOS2022
 Volume Serial Number is 333D-0B18

 Directory of C:\FILES

.                   <DIR>  05-27-2022  9:22p
..                  <DIR>  05-27-2022  9:22p
         0 file(s)              0 bytes
         2 dir(s)     279,560,192 bytes free
```

`ATTRIB` 的另一种常见使用方法是操作只读属性，这样你就不会意外地覆盖重要的文件。假设你想要保护 `SECRET.TXT` 文件，这样你就不能删除或更改它。使用 `+R` 修饰符 ，打开只读属性，像这样:

```
C:\FILES>attrib +r secret.txt 
[----A] -> [---RA] SECRET.TXT
C:\FILES>del secret.txt
C:\FILES\SECRET.TXT: Permission denied
no file removed.
```

### B 是“哔哔”声

如果你需要在一个批处理文件中添加一些激情活力，你可以使用 `BEEP` 命令来获取用户的注意力。`BEEP` 不会在屏幕上显示任何内容，但是会简单地发出一个 “哔哔” 的声音信号。

注意：`BEEP` 使用个人计算机内置的扬声器来发出 “哔哔” 声。如果你使用一台虚拟机器来引导启用 FreeDOS，检查你的系统是否建立正确的模拟个人计算机扬声器。否则，你将不会听到任何声音。

### C 是 CD

像 Linux 一样，FreeDOS 支持目录，这会允许你以一种来你有帮助的方式来组织你的文件。例如，你可以在一个名称为 `FILES` 的目录中存放你的全部文件，对于某些类型的文件，你可能会有其它的目录，例如，针对字处理器文件的 `DOCS` ，或者针对表格文件的 `SPRDSHT`。

你可以使用 `CD`（即 “<ruby>更改目录<rt>change directory</rt></ruby>”） 命令来导航到一个目录。`CHDIR` 命令和 `CD` 命令一样，如果你更喜欢使用这种语法的话。

为更改到一个新的目录，使用 `CD` 目录和目标目录：

```
C:\>cd files
C:\FILES>cd sprdsht
C:\FILES\SPRDSHT>dir
Volume in drive C is FREEDOS2022
Volume Serial Number is 333D-0B18
  
Directory of C:\FILES\SPRDSHT
  
. <DIR> 05-27-2022 9:59p
.. <DIR> 05-27-2022 9:59p
FIB WKS 2,093 05-27-2022 10:07p
LAB1 WKS 2,087 05-27-2022 10:10p
MIS100 WKS 2,232 05-27-2022 10:05p
3 file(s) 6,412 bytes
2 dir(s) 279,527,424 bytes free
```

你不必一次导航一层目录。相反，你可以使用一个 `CD` 命令和提供完整的你想要更改到的目录路径:

```
C:\>cd \files\sprdsht
C:\FILES\SPRDSHT>dir
Volume in drive C is FREEDOS2022
Volume Serial Number is 333D-0B18
  
Directory of C:\FILES\SPRDSHT
  
.  <DIR> 05-27-2022 9:59p
.. <DIR> 05-27-2022 9:59p
FIB WKS 2,093 05-27-2022 10:07p
LAB1 WKS 2,087 05-27-2022 10:10p
MIS100 WKS 2,232 05-27-2022 10:05p
3 file(s) 6,412 bytes
2 dir(s) 279,527,424 bytes free
```

### D 是 DELTREE

如果需要删除一个单个文件，你可以使用 `DEL` 命令。为删除一个空的目录，你可以使用 `RMDIR` 或 `RD` 命令。但是，如果你想删除一个有很多文件和子目录的目录?

一个包含有其它目录的目录称为 *目录树* 。你可以使用 `DELTREE` 命令来删除整个目录树。例如，为删除你的 `FILES` 目录，包括其中包含的所有的文件和目录，输入这个命令:

```
C:\>deltree files

    [DEFAULT-BUILD v1.02g] of DELTREE.  The "ROOT-SAFETY-CHECK" is enabled.

Delete directory "C:\FILES"
and all its subdirectories?

[Y] [N] [Q], [ENTER] ?  Y

==> Deleting "C:\FILES" ...
```

你可以使用一个单一的 `DELTREE` 命令来轻松快捷地完成很多工作，因此，FreeDOS 的 `DELTREE` 提示会询问你是否真的想要这样做。谨慎地使用这个命令。

### E 是 EDIT

如果你需要在 FreeDOS 上编辑一个文本文件，`EDIT` 程序会让你轻松快速地完成任务。例如，要开始编辑一个名称为 `HELLO.TXT` 的文件，输入 `EDIT HELLO.TXT` 。如果 `HELLO.TXT` 文件已经存在，`EDIT` 打开文件并开始编辑。如果 `HELLO.TXT` 尚未存在，那么 `EDIT` 为你开启一个新的文件。

![Image of edit][3]

FreeDOS 的 `EDIT` 使用了一种友好的界面，对大多数人来说应该很容易使用。使用菜单来访问 `EDIT` 的各种特色功能，包括保存文件、打开一个新的文件、或者退出编辑器。为访问菜单，在你的键盘上按下 `Alt` 按键，然后使用箭头按键来避开和进入选择的动作。

![Image of save menu][4]

### F 是 FIND

如果你需要在一个文件中查找文本，`FIND` 命令可以完成这项工作。类似于在 Linux 上的 `fgrep` ，`FIND` 会打印一些包含一个字符串的行。例如，为检查 `FDCONFIG.SYS` 文件中的 "Menu Default" 条目项，像这样使用 `FIND` :

```
C:\>find "MENUDEFAULT" fdconfig.sys

---------------- FDCONFIG.SYS
MENUDEFAULT=2,5
```

如果你不确定你想要查找的字符串是使用的大写字母还是小写字母，添加 `/I` 选项来忽略字母的大小写情况:

```
C:\>find /i "menudefault" fdconfig.sys
---------------- FDCONFIG.SYS
MENUDEFAULT=2,5
```

### G 是 GRAPHICS

如果你想要捕捉屏幕，你可以使用你键盘上的 `PrtScr`（<ruby>打印屏幕<rt>Print Screen</rt></ruby>）按键来直接将你显示器上的文本打印到打印机上。不过，这只对纯文本来说有效。如果你要打印图形屏幕，你需要加载 `GRAPHICS` 程序。

`GRAPHICS` 支持不同的打印机类型，包括 HP 的 PCL 打印机、Epson 的点阵打印机，和兼容 PostScript 的打印机。例如，如果有一台连接到你的计算机的 HP 的激光打印机，你可以通过输入这条命令来为这台打印机加载支持:

```
C:\>graphics hpdefault
Running in MS GRAPHICS compatibility mode...
Using HPPCL type for type hpdefault
  If you think this is not correct, mail me (see help text).
Printing black as white and white as black
which internally uses /I of this GRAPHICS.
You can use the following command directly instead of
GRAPHICS [your options] in the future:
LH GRAPH-HP /I
Note that GRAPH-HP allows extra options:
  /E economy mode, /1 use LPT1, /2 use LPT2, /3 use LPT3,
  /R for random instead of ordered dither
  /C for 300dpi instead of 600dpi
Driver to make 'shift PrtScr' key work
even in CGA, EGA, VGA, MCGA graphics
modes loaded, in HP PCL mode.
```

### H 是 HELP

如果你刚刚来到 FreeDOS 的世界，你可以通过输入 `HELP` 来获取如何使用不同命令的提示。这将带来 FreeDOS 的帮助系统，包含所有命令的文档:

![Image of FreeDos help system][6]

### I 是 IF

你可以使用 `IF` 语句来将条件语句添加到你的命令行或*批处理文件* 。`IF` 进行一次简短的测试，然后执行一个单个命令。例如，如果存在某个文件，那么打印结果 “It's there”，你可以输入:

```
C:\>if exist kernel.sys echo It's there
It's there
```

如果你想要测试相反的东西，在测试内容前，使用 `NOT` 关键字。例如，如果两个字符串的值不相同，那么打印结果 “Not equal” ，输入这条语句:

```
C:\>if not "a"=="b" echo Not equal
Not equal
```

### J 是 JOIN

早期的 DOS 版本是相当简单的；DOS 的第一个版本甚至不支持目录。为向这些较旧的程序提供向后兼容性，我们需要 `JOIN` 程序来作为一种巧妙的应变方法。`JOIN` 使用驱动器字母代替路径，这样，你可以将旧程序放入其自己的子目录中，但是，使用一个单个驱动器字母来访问它。

让我们假设你有一个名称为 `VC` 的旧应用程序，它不懂目录。为保持 `VC` 的工作，你可以将它的路径 <ruby>连接<rt>join</rt></ruby> 到一个驱动器字母。例如:

```
JOIN V: D:\VC
```

FreeDOS 将 `JOIN` 实施为 `SWSUBST`，它也兼备类似 `SUBST` 命令的特色功能。为将 `D:\VC` 路径链接到到一个名称为 `V:` 的驱动器字母，输入:

```
C:\>swsubst v: d:\vc
C:\>dir v:
Volume in drive V is DATA
Volume Serial Number is 212C-1DF8

Directory of V:\

. <DIR> 02-21-2022 10:35p
.. <DIR> 02-21-2022 10:35p
VC COM 27,520 07-14-2019 4:48p

1 file(s) 27,520 bytes
2 dir(s) 48,306,176 bytes free
```

### K 是 KEYB

DOS 默认采用美式英语键盘布局。你的键盘是不同的，你可以使用 `KEYB` 命令来加载新的键盘语言布局。例如，为为加载一种德语键盘布局，输入:

```
C:\>keyb gr
FreeDOS KEYB 2.01 - (c) Aitor Santamaría Merino - GNU GPL 2.0
Keyboard layout : C:\FREEDOS\BIN\KEYBOARD.SYS:GR [858] (3)
```

### L 是 LABEL

FreeDOS 使用 <ruby>标签<rt>label</rt></ruby> 来命名每个软盘驱动器和硬盘驱动器。这些标签提供了一种识别磁盘可能包含内容的方法。当你需要将文件存储到单个不同的软盘上时，`LABEL` 命令是非常有用的，你可以标记一个软盘 “Data”，另一个软盘为 “Games” 。

为分配一个新的标签到一个驱动器。或者更改在一个驱动器上的现存标签。像这样使用标签:

```
D:\>label d: data
D:\>dir /w
Volume in drive D is DATA
Volume Serial Number is 212C-1DF8

Directory of D:\

[123] [ABILITY] [ASEASY] [GAMES2] [QUATTRO]
[SRC] [TEMP] [THE] [VC] [WORD]
[WS400] EDLIN16.EXE EDLIN32.EXE MYENV.BAT
3 file(s) 113,910 bytes
11 dir(s) 48,306,176 bytes free
```

### M 是 MEM

运行程序和加载驱动程序会占用内存。可以查看你的系统有多少内存，以及有多少可用来运行 DOS 程序，使用 `MEM` 命令:

```
C:\>mem

Memory Type Total Used Free
---------------- -------- -------- --------
Conventional 639K 11K 628K
Upper 104K 18K 86K
Reserved 281K 281K 0K
Extended (XMS) 15,224K 537K 14,687K
---------------- -------- -------- --------
Total memory 16,248K 847K 15,401K
  
Total under 1 MB 743K 29K 714K
  
Total Expanded (EMS) 8,576K (8,781,824 bytes)
Free Expanded (EMS) 8,192K (8,388,608 bytes)
  
Largest executable program size 628K (643,104 bytes)
Largest free upper memory block 84K ( 85,728 bytes)
FreeDOS is resident in the high memory area.
```

### N 是 NANSI

如果你想添加一点颜色到 FreeDOS 命令行，你可以使用 ANSI 转义序列。这些序列之所以叫“转义”，是因为每个序列都以代码 33（转义字符 `ESC`）和一个由美国国家标准化协会（ANSI）定义的特殊字符序列为开头。

FreeDOS 通过 `NANSI.SYS` 驱动程序来支持 ANSI 转义序列。随着 `NANSI` 的加载，你的 FreeDOS 控制台将解释 ANSI 转义序列，例如，设置文本颜色。

![Image of Nansi][8]

### O 是 oZone

FreeDOS 是一款命令行操作系统，但是一些人们更喜欢使用可备选的图形化用户界面。这就是为什么 FreeDOS 的 1.3 发行版包含一些图形化桌面的原因。我喜欢的一款名称为 oZone 的图形化桌面，它提供一种时尚、现代化外观的界面。

![Image of Ozone GUI][9]

注意，oZone 有一点烦人的错误，可能还需要一些来自外部开发者的关爱。如果你想让 oZone 变得更好，可以下载源文件代码做些贡献。

### P 是 PROMPT

标准的 FreeDOS 命令行提示符会告诉你：你所在文件系统中的位置。当你第一次启动 FreeDOS 时，你的提示符看起来像 `C:\>`, 这意味着 `\`（根）目录在 `C:` 驱动器。`>` 字符表示着你可以在那里输入命令。

在你的提示符中，如果你更喜欢不同的信息，使用 `PROMPT` 目录来更改它。你可以使用一个带有 `$` 的开头的特殊代码来显示不同的信息，例如，`$D` 用于日期、`$T` 用于时间。例如，你可以使用 `$$` 指令来使你的 FreeDOS 命令行看起来像一个 Linux 提示符，来打印一个单个美元符号:

```
C:\>prompt $$
$
```

输入 `PROMPT /?` 来查看一份全部特殊代码的列表。

### Q 是 QBASIC

FreeDOS 实际上没有 QBASIC 。它是针对 MS-DOS 的专有 BASIC 语言环境。作为备选方案，我们提供一些开放源文件的编译器，包括一些针对 BASIC 编程的编译器。

FreeBASIC 编译器可以编译外来的大多数 QBASIC 程序。这里有一个简单的 “猜数” 示例:

```
dim number as integer
dim guess as integer
randomize timer
number = int( 10 * rnd() ) + 1
print "Guess the number from 1 to 10:"
do
input guess
if guess < number then print "Too low"
if guess > number then print "Too high"
loop while guess <> number
print "That's right!"
```

使用 `FBC` 命令来编译 FreeBASIC 程序:

```
C:\DEVEL\FBC>fbc guess.bas
```

这里是这个简单游戏的快速演示:

```
C:\DEVEL\FBC>guess
Guess the number from 1 to 10:
? 5
Too high
? 3
Too low
? 4
That's right!
```

### R 是 REM

在编写程序时，注释是极好的；注释帮助我们理解程序应该要做什么。可以在批处理文件中使用 `REM` 来做同样的事。在批处理文件中，在 `REM` 的后面的任何东西都将会被忽略。

```
REM this is a comment
```

### S 是 SET

FreeDOS 命令行使用一系列称为 <ruby>环境变量<rt>environment variables</rt></ruby> 的变量，让你来自定义你的系统。你可以使用 `SET` 命令来设置这些变量。例如。使用 `DIRCMD` 变量来控制 `DIR` 如何排列目录列表。为设置 `DIRCMD` 变量，使用 `SET` 命令:

```
SET DIRCMD=/O:GNE
```

这告诉 `DIR` 先按照目录分组（`G`）来排序（`O`）输出，然后再按照名称（`N`）和扩展名（`E`）来排序结果。

### T 是 TYPE

`TYPE` 命令是最常使用的 DOS 命令之一。`TYPE` 显示一个文件的内容，类似于在 Linux 上的 `cat` 。

```
C:\DEVEL>type hello.c
#include 

int
main()
{
puts("Hello world");
return 0;
}
```

### U 是 UNZIP

在 Linux 上，你可能更熟悉标准的 Unix 存档命令: `tar`。在 FreeDOS 上也有一个 `tar` 版本（和其它大量的流行的存档程序），但是，在 DOS 上的事实上的标准的存档命令是 `ZIP` 和 `UNZIP` 。两者都默认安装在 FreeDOS 1.3 之中。

比如说，我有一些文件的一个 zip 存档。如果我想提取整个 Zip 文件，我可以只使用 `UNZIP` 命令，并将 Zip 文件作为命令行的选项来提供。这将在我当前工作目录中开始提取存档文件。除非我正在恢复一些东西的先前版本，我通常不希望覆盖我的当前文件。在这种情况下，我将提取存档到一个新的目录。你可以使用  `-d`（“<ruby>目标<rt>destination</rt></ruby>”）命令行选项来具体指定目标路径：

```
D:\SRC>unzip monkeys.zip -d monkeys.new
Warning: TZ environment variable not found, cannot use UTC times!!
Archive: monkeys.zip
creating: monkeys.new/monkeys/
inflating: monkeys.new/monkeys/banana.c
inflating: monkeys.new/monkeys/banana.obj
inflating: monkeys.new/monkeys/banana.exe
creating: monkeys.new/monkeys/putimg/
inflating: monkeys.new/monkeys/putimg/putimg.c
inflating: monkeys.new/monkeys/putimg/putimg.obj
inflating: monkeys.new/monkeys/putimg/putimg.exe
```

为学习更多关于 `ZIP` 和 `UNZIP` 命令的信息，可以阅读 [如何在 FreeDOS 上存档文件][11]。

### V 是 VER

在 DOS 的古老岁月中，`VER` 命令会报告你正在运行的 DOS 发行版本，例如：“MS-DOS 5.0.D”。对于 FreeDOS，`VER` 命令将给予你额外的详细信息，例如 FreeDOS Shell 的版本:

```
C:\DEVEL>ver
FreeCom version 0.85a - WATCOMC - XMS_Swap [Jul 10 2021 19:28:06]
```

如果你还想查看 FreeDOS 内核版本和 DOS 兼容性等级，添加 `/R` 选项:

```
C:\DEVEL>ver /r

FreeCom version 0.85a - WATCOMC - XMS_Swap [Jul 10 2021 19:28:06]

DOS version 7.10
FreeDOS kernel 2043 (build 2043 OEM:0xfd) [compiled May 14 2021]
```

### W 是 WHICH

FreeDOS 命令行可以运行来自记录在 `PATH` 变量中的不同的目录列表的程序。你可以使用 `WHICH` 命令来准确地识别出程序的位置。只需要输入 `WHICH` 加上你想要定位的程序名称：

```
C:\>which xcopy
xcopy C:\FREEDOS\BIN\XCOPY.EXE
```

### X 是 XCOPY

`COPY` 命令只能将文件从一个位置复制到另一个位置。如果你想扩大复制的范围来包括一些目录，使用 `XCOPY` 命令。我通常添加 `/E` 选项来包含所有的子目录，包括空的子目录，这样，我可以复制整个目录树。这样就可以有效地备份我正在工作的任意工程:

```
D:\SRC>xcopy /e monkeys monkeys.bak
Does MONKEYS.BAK specify a file name
or directory name on the target (File/Directory)? d
Copying D:\SRC\MONKEYS\PUTIMG\PUTIMG.C
Copying D:\SRC\MONKEYS\PUTIMG\PUTIMG.OBJ
Copying D:\SRC\MONKEYS\PUTIMG\PUTIMG.EXE
Copying D:\SRC\MONKEYS\BANANA.C
Copying D:\SRC\MONKEYS\BANANA.OBJ
Copying D:\SRC\MONKEYS\BANANA.EXE
6 file(s) copied
```

### Y 是 Yellow

这不是一个命令，而是关于 DOS 如何显示颜色的有趣的百科知识。如果你仔细留心过 FreeDOS，你可能已经注意到，文本只能获取有限的颜色范围—— 十六种文本颜色、八种背景颜色。

IBM 的 5153 彩色显示器，通过点亮不同亮度等级的微小的红、绿、蓝荧光点的方式创建 16 种文本颜色和 8 种背景颜色来为用户显示颜色。早期的个人计算机只能以“标准强度”级别来显示背景颜色；只有文本颜色可以使用明亮颜色。

如果你查看文本颜色，你有黑色、蓝色、绿色、蓝绿色、红色、品红色、橙色和白色。这些颜色的“明亮”版本有亮黑色（暗灰色）、亮蓝色、亮绿色、亮蓝绿色、亮红色、亮品红色、黄色和亮白色。橙色的“明亮”版本有实际上是黄色。没有“亮橙色”。

如果你想要学习更多关于文本颜色的信息，阅读我们关于 [FreeDOS 为什么有 16 种颜色][12] 的文章。

### Z 是 ZIP

你可以在 DOS 命令行中使用 `ZIP` 来创建文件和目录的存档。这是一种很便利的方法：可以备份你的工作，或者发布一个 “软件包” 来在未来的 FreeDOS 发行版中使用。例如，比如说，我想备份我的工程源文件代码，其中包含这些源文件文件:

```
D:\SRC>zip -9r monkeys.zip monkeys
zip warning: TZ environment variable not found, cannot use UTC times!!
adding: monkeys/ (stored 0%)
adding: monkeys/banana.c (deflated 66%)
adding: monkeys/banana.obj (deflated 26%)
adding: monkeys/banana.exe (deflated 34%)
adding: monkeys/putimg/ (stored 0%)
adding: monkeys/putimg/putimg.c (deflated 62%)
adding: monkeys/putimg/putimg.obj (deflated 29%)
adding: monkeys/putimg/putimg.exe (deflated 34%)
```

ZIP 支持很多命令行选项来完成不同的工作，但是，我使用最多的命令行选项是： `-r` 用于递归处理目录和子目录、`-9` 用于提供尽可能大的压缩比。`ZIP` 和 `UNZIP` 使用类 Unix 命令行，因此，你可以在短划线后面合并选项: `-9r` 将在 Zip 文件中给予最大压缩比和包括子目录。

关于如何使用 `ZIP` 和 `UNZIP` 命令的更多详细信息，阅读 [如何在 FreeDOS 上存档文件][13]。

### 新的 FreeDOS 指南

准备好你的 FreeDOS 旅程的下一步了吗?查看我们的新的电子书，现在开始尝试我们的 FreeDOS !

> **[FreeDOS 使用指南][14]**

> **[深入 FreeDOS 高级指南][15]**

*（题图：MJ/0b21dcc8-4c8d-457b-9e0d-fbbe5dd08c60）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/26-freedos-commands

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/freedos-fish-laptop-color.png
[2]: https://opensource.com/article/22/6/linux-attr-command
[3]: https://opensource.com/sites/default/files/2022-06/FREEDedit_0.png
[4]: https://opensource.com/sites/default/files/2022-06/Freededit-save.png
[5]: https://opensource.com/Linux%20find%20cheat%20sheet
[6]: https://opensource.com/sites/default/files/2022-06/Freedhelp.system.png
[7]: https://opensource.com/article/22/6/linux-cheat-command
[8]: https://opensource.com/sites/default/files/2022-06/FreeDnansi.png
[9]: https://opensource.com/sites/default/files/2022-06/FreeDozone.png
[10]: https://opensource.com/article/21/1/fortran
[11]: https://opensource.com/article/21/6/archive-files-freedos
[12]: https://opensource.com/article/21/6/freedos-sixteen-colors
[13]: https://opensource.com/article/21/6/archive-files-freedos
[14]: https://opensource.com/downloads/guide-using-freedos
[15]: https://opensource.com/downloads/advanced-freedos
[0]: https://img.linux.net.cn/data/attachment/album/202310/12/102950rnookbm1124y54k1.jpg