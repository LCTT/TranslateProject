[#]: collector: (lujun9972)
[#]: translator: (guevaraya)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10700-1.html)
[#]: subject: (Computer Laboratory – Raspberry Pi: Lesson 11 Input02)
[#]: via: (https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input02.html)
[#]: author: (Alex Chadwick https://www.cl.cam.ac.uk)

计算机实验室之树莓派：课程 11 输入02
======

课程输入 02 是以课程输入 01 为基础讲解的，通过一个简单的命令行实现用户的命令输入和计算机的处理和显示。本文假设你已经具备 [课程11：输入01][1] 的操作系统代码基础。

### 1、终端

几乎所有的操作系统都是以字符终端显示启动的。经典的黑底白字，通过键盘输入计算机要执行的命令，然后会提示你拼写错误，或者恰好得到你想要的执行结果。这种方法有两个主要优点：键盘和显示器可以提供简易、健壮的计算机交互机制，几乎所有的计算机系统都采用这个机制，这个也广泛被系统管理员应用。

> 早期的计算一般是在一栋楼里的一个巨型计算机系统，它有很多可以输命令的'终端'。计算机依次执行不同来源的命令。

让我们分析下真正想要哪些信息：

1. 计算机打开后，显示欢迎信息
2. 计算机启动后可以接受输入标志
3. 用户从键盘输入带参数的命令
4. 用户输入回车键或提交按钮
5. 计算机解析命令后执行可用的命令
6. 计算机显示命令的执行结果，过程信息
7. 循环跳转到步骤 2

这样的终端被定义为标准的输入输出设备。用于（显示）输入的屏幕和打印输出内容的屏幕是同一个（LCTT 译注：最早期的输出打印真是“打印”到打印机/电传机的，而用于输入的终端只是键盘，除非做了回显，否则输出终端是不会显示输入的字符的）。也就是说终端是对字符显示的一个抽象。字符显示中，单个字符是最小的单元，而不是像素。屏幕被划分成固定数量不同颜色的字符。我们可以在现有的屏幕代码基础上，先存储字符和对应的颜色，然后再用方法 `DrawCharacter` 把其推送到屏幕上。一旦我们需要字符显示，就只需要在屏幕上画出一行字符串。

新建文件名为 `terminal.s`，如下：

```
.section .data
.align 4
terminalStart:
.int terminalBuffer
terminalStop:
.int terminalBuffer
terminalView:
.int terminalBuffer
terminalColour:
.byte 0xf
.align 8
terminalBuffer:
.rept 128*128
.byte 0x7f
.byte 0x0
.endr
terminalScreen:
.rept 1024/8 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 768/16
.byte 0x7f
.byte 0x0
.endr
```

这是文件终端的配置数据文件。我们有两个主要的存储变量：`terminalBuffer` 和 `terminalScreen`。`terminalBuffer` 保存所有显示过的字符。它保存 128 行字符文本（1 行包含 128 个字符）。每个字符有一个 ASCII 字符和颜色单元组成，初始值为 0x7f（ASCII 的删除字符）和 0（前景色和背景色为黑）。`terminalScreen` 保存当前屏幕显示的字符。它保存 128x48 个字符，与 `terminalBuffer` 初始化值一样。你可能会觉得我仅需要 `terminalScreen` 就够了，为什么还要`terminalBuffer`，其实有两个好处：

  1. 我们可以很容易看到字符串的变化，只需画出有变化的字符。
  2. 我们可以回滚终端显示的历史字符，也就是缓冲的字符（有限制）

这种独特的技巧在低功耗系统里很常见。画屏是很耗时的操作，因此我们仅在不得已的时候才去执行这个操作。在这个系统里，我们可以任意改变 `terminalBuffer`，然后调用一个仅拷贝屏幕上字节变化的方法。也就是说我们不需要持续画出每个字符，这样可以节省一大段跨行文本的操作时间。

> 你总是需要尝试去设计一个高效的系统，如果在很少变化的情况下这个系统会运行的更快。

其他在 `.data` 段的值得含义如下：

  * `terminalStart`
    写入到 `terminalBuffer` 的第一个字符
  * `terminalStop`
    写入到 `terminalBuffer` 的最后一个字符
  * `terminalView`
    表示当前屏幕的第一个字符，这样我们可以控制滚动屏幕
  * `temrinalColour`
    即将被描画的字符颜色

`terminalStart` 需要保存起来的原因是 `termainlBuffer` 是一个环状缓冲区。意思是当缓冲区变满时，末尾地方会回滚覆盖开始位置，这样最后一个字符变成了第一个字符。因此我们需要将 `terminalStart` 往前推进，这样我们知道我们已经占满它了。如何实现缓冲区检测：如果索引越界到缓冲区的末尾，就将索引指向缓冲区的开始位置。环状缓冲区是一个比较常见的存储大量数据的高明方法，往往这些数据的最近部分比较重要。它允许无限制的写入，只保证最近一些特定数据有效。这个常常用于信号处理和数据压缩算法。这样的情况，可以允许我们存储 128 行终端记录，超过128行也不会有问题。如果不是这样，当超过第 128 行时，我们需要把 127 行分别向前拷贝一次，这样很浪费时间。

![显示 Hellow world 插入到大小为5的循环缓冲区的示意图。][2] 

> 环状缓冲区是**数据结构**一个例子。这是一个组织数据的思路，有时我们通过软件实现这种思路。

之前已经提到过 `terminalColour` 几次了。你可以根据你的想法实现终端颜色，但这个文本终端有 16 个前景色和 16 个背景色（这里相当于有 16^2 = 256 种组合）。[CGA][3]终端的颜色定义如下：


表格 1.1 - CGA 颜色编码

| 序号 | 颜色 (R, G, B)        |
| ------ | ------------------------|
| 0      | 黑 (0, 0, 0)         |
| 1      | 蓝 (0, 0, ⅔)          |
| 2      | 绿 (0, ⅔, 0)         |
| 3      | 青色 (0, ⅔, ⅔)          |
| 4      | 红色 (⅔, 0, 0)           |
| 5      | 品红 (⅔, 0, ⅔)       |
| 6      | 棕色 (⅔, ⅓, 0)         |
| 7      | 浅灰色 (⅔, ⅔, ⅔)    |
| 8      | 灰色 (⅓, ⅓, ⅓)          |
| 9      | 淡蓝色 (⅓, ⅓, 1)    |
| 10     | 淡绿色 (⅓, 1, ⅓)   |
| 11     | 淡青色 (⅓, 1, 1)    |
| 12     | 淡红色 (1, ⅓, ⅓)     |
| 13     | 浅品红 (1, ⅓, 1) |
| 14     | 黄色 (1, 1, ⅓)        |
| 15     | 白色 (1, 1, 1)         |

我们将前景色保存到颜色的低字节，背景色保存到颜色高字节。除了棕色，其他这些颜色遵循一种模式如二进制的高位比特代表增加 ⅓ 到每个组件，其他比特代表增加 ⅔ 到各自组件。这样很容易进行 RGB 颜色转换。

> 棕色作为替代色（黑黄色）既不吸引人也没有什么用处。

我们需要一个方法从 `TerminalColour` 读取颜色编码的四个比特，然后用 16 比特等效参数调用 `SetForeColour`。尝试你自己实现。如果你感觉麻烦或者还没有完成屏幕系列课程，我们的实现如下：

```
.section .text
TerminalColour:
teq r0,#6
ldreq r0,=0x02B5
beq SetForeColour

tst r0,#0b1000
ldrne r1,=0x52AA
moveq r1,#0
tst r0,#0b0100
addne r1,#0x15
tst r0,#0b0010
addne r1,#0x540
tst r0,#0b0001
addne r1,#0xA800
mov r0,r1
b SetForeColour
```

### 2、文本显示

我们的终端第一个真正需要的方法是 `TerminalDisplay`，它用来把当前的数据从 `terminalBuffer`拷贝到 `terminalScreen` 和实际的屏幕。如上所述，这个方法必须是最小开销的操作，因为我们需要频繁调用它。它主要比较 `terminalBuffer` 与 `terminalDisplay` 的文本，然后只拷贝有差异的字节。请记住 `terminalBuffer` 是以环状缓冲区运行的，这种情况，就是从 `terminalView` 到 `terminalStop`，或者 128*48 个字符，要看哪个来的最快。如果我们遇到 `terminalStop`，我们将会假定在这之后的所有字符是 7f<sub>16</sub> (ASCII 删除字符)，颜色为 0（黑色前景色和背景色）。

让我们看看必须要做的事情：

  1. 加载 `terminalView`、`terminalStop` 和 `terminalDisplay` 的地址。
  2. 对于每一行：
    1. 对于每一列：
      1. 如果 `terminalView` 不等于 `terminalStop`，根据 `terminalView` 加载当前字符和颜色
      2. 否则加载 0x7f 和颜色 0
      3. 从 `terminalDisplay` 加载当前的字符
      4. 如果字符和颜色相同，直接跳转到第 10 步
      5. 存储字符和颜色到 `terminalDisplay`
      6. 用 `r0` 作为背景色参数调用 `TerminalColour`
      7. 用 `r0 = 0x7f`（ASCII 删除字符，一个块）、 `r1 = x`、`r2 = y` 调用 `DrawCharacter`
      8. 用 `r0` 作为前景色参数调用 `TerminalColour`
      9. 用 `r0 = 字符`、`r1 = x`、`r2 = y` 调用 `DrawCharacter`
      10. 对位置参数 `terminalDisplay` 累加 2
      11. 如果 `terminalView` 不等于 `terminalStop`，`terminalView` 位置参数累加 2
      12. 如果 `terminalView` 位置已经是文件缓冲器的末尾，将它设置为缓冲区的开始位置
      13. x 坐标增加 8
    2. y 坐标增加 16

尝试去自己实现吧。如果你遇到问题，我们的方案下面给出来了：

1、我这里的变量有点乱。为了方便起见，我用 `taddr` 存储 `textBuffer` 的末尾位置。

```
.globl TerminalDisplay
TerminalDisplay:
push {r4,r5,r6,r7,r8,r9,r10,r11,lr}
x .req r4
y .req r5
char .req r6
col .req r7
screen .req r8
taddr .req r9
view .req r10
stop .req r11

ldr taddr,=terminalStart
ldr view,[taddr,#terminalView - terminalStart]
ldr stop,[taddr,#terminalStop - terminalStart]
add taddr,#terminalBuffer - terminalStart
add taddr,#128*128*2
mov screen,taddr
```

2、从 `yLoop` 开始运行。

```
mov y,#0
yLoop$:
```

2.1、
 
```
mov x,#0
xLoop$:
```
从 `xLoop` 开始运行。


2.1.1、为了方便起见，我把字符和颜色同时加载到 `char` 变量了
 
```
teq view,stop
ldrneh char,[view]
```

2.1.2、这行是对上面一行的补充说明：读取黑色的删除字符

 
```
moveq char,#0x7f
```
  
2.1.3、为了简便我把字符和颜色同时加载到 `col` 里。
 
```
ldrh col,[screen]
```

2.1.4、 现在我用 `teq` 指令检查是否有数据变化

```
teq col,char
beq xLoopContinue$
```

2.1.5、我可以容易的保存当前值


```
strh char,[screen]
```

2.1.6、我用比特偏移指令 `lsr` 和 `and` 指令从切分 `char` 变量，将颜色放到 `col` 变量，字符放到 `char` 变量，然后再用比特偏移指令 `lsr` 获取背景色后调用 `TerminalColour` 。

```
lsr col,char,#8
and char,#0x7f
lsr r0,col,#4
bl TerminalColour
```

2.1.7、写入一个彩色的删除字符

```
mov r0,#0x7f
mov r1,x
mov r2,y
bl DrawCharacter
```

2.1.8、用 `and` 指令获取 `col` 变量的低半字节，然后调用 `TerminalColour`

```
and r0,col,#0xf
bl TerminalColour
```

2.1.9、写入我们需要的字符
 
```
mov r0,char
mov r1,x
mov r2,y
bl DrawCharacter
```

2.1.10、自增屏幕指针

```
xLoopContinue$:
add screen,#2
```

2.1.11、如果可能自增 `view` 指针
 
```
teq view,stop
addne view,#2
```

2.1.12、很容易检测 `view` 指针是否越界到缓冲区的末尾，因为缓冲区的地址保存在 `taddr` 变量里

```
teq view,taddr
subeq view,#128*128*2
```

2.1.13、 如果还有字符需要显示，我们就需要自增 `x` 变量然后到 `xLoop` 循环执行

```
add x,#8
teq x,#1024
bne xLoop$
```

2.2、 如果还有更多的字符显示我们就需要自增 `y` 变量，然后到 `yLoop` 循环执行

```
add y,#16
teq y,#768
bne yLoop$
```

3、不要忘记最后清除变量

```
pop {r4,r5,r6,r7,r8,r9,r10,r11,pc}
.unreq x
.unreq y
.unreq char
.unreq col
.unreq screen
.unreq taddr
.unreq view
.unreq stop
```

### 3、行打印

现在我有了自己 `TerminalDisplay` 方法，它可以自动显示 `terminalBuffer` 内容到 `terminalScreen`，因此理论上我们可以画出文本。但是实际上我们没有任何基于字符显示的例程。 首先快速容易上手的方法便是 `TerminalClear`， 它可以彻底清除终端。这个方法不用循环也很容易实现。可以尝试分析下面的方法应该不难：

```
.globl TerminalClear
TerminalClear:
ldr r0,=terminalStart
add r1,r0,#terminalBuffer-terminalStart
str r1,[r0]
str r1,[r0,#terminalStop-terminalStart]
str r1,[r0,#terminalView-terminalStart]
mov pc,lr
```

现在我们需要构造一个字符显示的基础方法：`Print` 函数。它将保存在 `r0` 的字符串和保存在 `r1` 的字符串长度简单的写到屏幕上。有一些特定字符需要特别的注意，这些特定的操作是确保 `terminalView` 是最新的。我们来分析一下需要做什么： 

  1. 检查字符串的长度是否为 0，如果是就直接返回
  2. 加载 `terminalStop` 和 `terminalView`
  3. 计算出 `terminalStop` 的 x 坐标
  4. 对每一个字符的操作：
    1. 检查字符是否为新起一行
    2. 如果是的话，自增 `bufferStop` 到行末，同时写入黑色删除字符
    3. 否则拷贝当前 `terminalColour` 的字符
    4. 检查是否在行末
    5. 如果是，检查从 `terminalView` 到 `terminalStop` 之间的字符数是否大于一屏
    6. 如果是，`terminalView` 自增一行
    7. 检查 `terminalView` 是否为缓冲区的末尾，如果是的话将其替换为缓冲区的起始位置
    8. 检查 `terminalStop` 是否为缓冲区的末尾，如果是的话将其替换为缓冲区的起始位置
    9. 检查 `terminalStop` 是否等于 `terminalStart`， 如果是的话 `terminalStart` 自增一行。
    10. 检查 `terminalStart` 是否为缓冲区的末尾，如果是的话将其替换为缓冲区的起始位置
  5. 存取 `terminalStop` 和 `terminalView`

试一下自己去实现。我们的方案提供如下：

1、这个是 `Print` 函数开始快速检查字符串为0的代码

```
.globl Print
Print:
teq r1,#0
moveq pc,lr
```

2、这里我做了很多配置。 `bufferStart` 代表 `terminalStart`， `bufferStop` 代表`terminalStop`， `view` 代表 `terminalView`，`taddr` 代表 `terminalBuffer` 的末尾地址。

```
push {r4,r5,r6,r7,r8,r9,r10,r11,lr}
bufferStart .req r4
taddr .req r5
x .req r6
string .req r7
length .req r8
char .req r9
bufferStop .req r10
view .req r11

mov string,r0
mov length,r1

ldr taddr,=terminalStart
ldr bufferStop,[taddr,#terminalStop-terminalStart]
ldr view,[taddr,#terminalView-terminalStart]
ldr bufferStart,[taddr]
add taddr,#terminalBuffer-terminalStart
add taddr,#128*128*2
```

3、和通常一样，巧妙的对齐技巧让许多事情更容易。由于需要对齐 `terminalBuffer`，每个字符的 x 坐标需要 8 位要除以 2。


```
and x,bufferStop,#0xfe
lsr x,#1
```

4.1、我们需要检查新行
 
```
charLoop$:
ldrb char,[string]
and char,#0x7f
teq char,#'\n'
bne charNormal$
```

4.2、循环执行值到行末写入 0x7f；黑色删除字符
 
```
mov r0,#0x7f
clearLine$:
strh r0,[bufferStop]
add bufferStop,#2
add x,#1
teq x,#128 blt clearLine$
    
b charLoopContinue$
```

4.3、存储字符串的当前字符和 `terminalBuffer` 末尾的 `terminalColour` 然后将它和 x 变量自增
 
```
charNormal$:
strb char,[bufferStop]
ldr r0,=terminalColour
ldrb r0,[r0]
strb r0,[bufferStop,#1]
add bufferStop,#2
add x,#1
```

4.4、检查 x 是否为行末；128

 
```
charLoopContinue$:
cmp x,#128
blt noScroll$
```

4.5、设置 x 为 0 然后检查我们是否已经显示超过 1 屏。请记住，我们是用的循环缓冲区，因此如果 `bufferStop` 和 `view` 之前的差是负值，我们实际上是环绕了缓冲区。
 
```
mov x,#0
subs r0,bufferStop,view
addlt r0,#128*128*2
cmp r0,#128*(768/16)*2
```

4.6、增加一行字节到 `view` 的地址

```
addge view,#128*2
```

4.7、 如果 `view` 地址是缓冲区的末尾，我们就从它上面减去缓冲区的长度，让其指向开始位置。我会在开始的时候设置 `taddr` 为缓冲区的末尾地址。

```
teq view,taddr
subeq view,taddr,#128*128*2
```

4.8、如果 `stop` 的地址在缓冲区末尾，我们就从它上面减去缓冲区的长度，让其指向开始位置。我会在开始的时候设置 `taddr` 为缓冲区的末尾地址。

```
noScroll$:
teq bufferStop,taddr
subeq bufferStop,taddr,#128*128*2
```

4.9、检查 `bufferStop` 是否等于 `bufferStart`。 如果等于增加一行到 `bufferStart`。
 
```
teq bufferStop,bufferStart
addeq bufferStart,#128*2
```

4.10、如果 `start` 的地址在缓冲区的末尾，我们就从它上面减去缓冲区的长度，让其指向开始位置。我会在开始的时候设置 `taddr` 为缓冲区的末尾地址。

```
teq bufferStart,taddr
subeq bufferStart,taddr,#128*128*2
```
循环执行知道字符串结束

```
subs length,#1
add string,#1
bgt charLoop$
```

5、保存变量然后返回

```
charLoopBreak$:
sub taddr,#128*128*2
sub taddr,#terminalBuffer-terminalStart
str bufferStop,[taddr,#terminalStop-terminalStart]
str view,[taddr,#terminalView-terminalStart]
str bufferStart,[taddr]

pop {r4,r5,r6,r7,r8,r9,r10,r11,pc}
.unreq bufferStart
.unreq taddr
.unreq x
.unreq string
.unreq length
.unreq char
.unreq bufferStop
.unreq view
```

这个方法允许我们打印任意字符到屏幕。然而我们用了颜色变量，但实际上没有设置它。一般终端用特性的组合字符去行修改颜色。如 ASCII 转义（1b<sub>16</sub>）后面跟着一个 0 - f 的 16 进制的数，就可以设置前景色为 CGA 颜色号。如果你自己想尝试实现；在下载页面有一个我的详细的例子。

### 4、标志输入

现在我们有一个可以打印和显示文本的输出终端。这仅仅是说对了一半，我们需要输入。我们想实现一个方法：`ReadLine`，可以保存文件的一行文本，文本位置由 `r0` 给出，最大的长度由 `r1` 给出，返回 `r0` 里面的字符串长度。棘手的是用户输出字符的时候要回显功能，同时想要退格键的删除功能和命令回车执行功能。它们还需要一个闪烁的下划线代表计算机需要输入。这些完全合理的要求让构造这个方法更具有挑战性。有一个方法完成这些需求就是存储用户输入的文本和文件大小到内存的某个地方。然后当调用 `ReadLine` 的时候，移动 `terminalStop` 的地址到它开始的地方然后调用 `Print`。也就是说我们只需要确保在内存维护一个字符串，然后构造一个我们自己的打印函数。

> 按照惯例，许多编程语言中，任意程序可以访问 stdin 和 stdin，它们可以连接到终端的输入和输出流。在图形程序其实也可以进行同样操作，但实际几乎不用。

让我们看看 `ReadLine` 做了哪些事情：

  1. 如果字符串可保存的最大长度为 0，直接返回
  2. 检索 `terminalStop` 和 `terminalStop` 的当前值
  3. 如果字符串的最大长度大约缓冲区的一半，就设置大小为缓冲区的一半
  4. 从最大长度里面减去 1 来确保输入的闪烁字符或结束符
  5. 向字符串写入一个下划线
  6. 写入一个 `terminalView` 和 `terminalStop` 的地址到内存
  7. 调用 `Print` 打印当前字符串
  8. 调用 `TerminalDisplay`
  9. 调用 `KeyboardUpdate`
  10. 调用 `KeyboardGetChar`
  11. 如果是一个新行直接跳转到第 16 步
  12. 如果是一个退格键，将字符串长度减 1（如果其大于 0）
  13. 如果是一个普通字符，将它写入字符串（字符串大小确保小于最大值）
  14. 如果字符串是以下划线结束，写入一个空格，否则写入下划线
  15. 跳转到第 6 步
  16. 字符串的末尾写入一个新行字符
  17. 调用 `Print` 和 `TerminalDisplay`
  18. 用结束符替换新行
  19. 返回字符串的长度


为了方便读者理解，然后然后自己去实现，我们的实现提供如下：

1. 快速处理长度为 0 的情况

```
.globl ReadLine
ReadLine:
teq r1,#0
moveq r0,#0
moveq pc,lr
```

2、考虑到常见的场景，我们初期做了很多初始化动作。`input` 代表 `terminalStop` 的值，`view` 代表 `terminalView`。`Length` 默认为 `0`。 
 
```
string .req r4
maxLength .req r5
input .req r6
taddr .req r7
length .req r8
view .req r9

push {r4,r5,r6,r7,r8,r9,lr}

mov string,r0
mov maxLength,r1
ldr taddr,=terminalStart
ldr input,[taddr,#terminalStop-terminalStart]
ldr view,[taddr,#terminalView-terminalStart]
mov length,#0
```

3、我们必须检查异常大的读操作，我们不能处理超过 `terminalBuffer` 大小的输入（理论上可行，但是 `terminalStart` 移动越过存储的 terminalStop`，会有很多问题）。

```
cmp maxLength,#128*64
movhi maxLength,#128*64
```

4、由于用户需要一个闪烁的光标，我们需要一个备用字符在理想状况在这个字符串后面放一个结束符。

```
sub maxLength,#1
```

5、写入一个下划线让用户知道我们可以输入了。

```
mov r0,#'_'
strb r0,[string,length]
```

6、保存 `terminalStop` 和 `terminalView`。这个对重置一个终端很重要，它会修改这些变量。严格讲也可以修改 `terminalStart`，但是不可逆。

```
readLoop$:
str input,[taddr,#terminalStop-terminalStart]
str view,[taddr,#terminalView-terminalStart]
```

7、写入当前的输入。由于下划线因此字符串长度加 1
 
```
mov r0,string
mov r1,length
add r1,#1
bl Print
```

8、拷贝下一个文本到屏幕

```
bl TerminalDisplay
```


9、获取最近一次键盘输入
 
```
bl KeyboardUpdate
```

10、检索键盘输入键值

```
bl KeyboardGetChar
```

11、如果我们有一个回车键，循环中断。如果有结束符和一个退格键也会同样跳出循环。
 
```
teq r0,#'\n'
beq readLoopBreak$
teq r0,#0
beq cursor$
teq r0,#'\b'
bne standard$
```

12、从 `length` 里面删除一个字符
 
```
delete$:
cmp length,#0
subgt length,#1
b cursor$
```

13、写回一个普通字符
 
```
standard$:
cmp length,maxLength
bge cursor$
strb r0,[string,length]
add length,#1
```

14、加载最近的一个字符，如果不是下划线则修改为下换线，如果是则修改为空格

```
cursor$:
ldrb r0,[string,length]
teq r0,#'_'
moveq r0,#' '
movne r0,#'_'
strb r0,[string,length]
```

15、循环执行值到用户输入按下
 
```
b readLoop$
readLoopBreak$:
```

16、在字符串的结尾处存入一个新行字符

```
mov r0,#'\n'
strb r0,[string,length]
```

17、重置 `terminalView` 和 `terminalStop` 然后调用 `Print` 和 `TerminalDisplay` 显示最终的输入

```
str input,[taddr,#terminalStop-terminalStart]
str view,[taddr,#terminalView-terminalStart]
mov r0,string
mov r1,length
add r1,#1
bl Print
bl TerminalDisplay
```

18、写入一个结束符

```
mov r0,#0
strb r0,[string,length]
```

19、返回长度

```
mov r0,length
pop {r4,r5,r6,r7,r8,r9,pc}
.unreq string
.unreq maxLength
.unreq input
.unreq taddr
.unreq length
.unreq view
```

### 5、终端：机器进化

现在我们理论用终端和用户可以交互了。最显而易见的事情就是拿去测试了！删除 `main.s` 里 `bl UsbInitialise` 后面的代码后如下：

```
reset$:
  mov sp,#0x8000
  bl TerminalClear
  
  ldr r0,=welcome
  mov r1,#welcomeEnd-welcome
  bl Print

loop$:
  ldr r0,=prompt
  mov r1,#promptEnd-prompt
  bl Print
  
  ldr r0,=command
  mov r1,#commandEnd-command
  bl ReadLine
  
  teq r0,#0
  beq loopContinue$
  
  mov r4,r0
  
  ldr r5,=command
  ldr r6,=commandTable
  
  ldr r7,[r6,#0]
  ldr r9,[r6,#4]
  commandLoop$:
    ldr r8,[r6,#8]
    sub r1,r8,r7
    
    cmp r1,r4
    bgt commandLoopContinue$
    
    mov r0,#0
    commandName$:
      ldrb r2,[r5,r0]
      ldrb r3,[r7,r0]
      teq r2,r3
      bne commandLoopContinue$
      add r0,#1
      teq r0,r1
      bne commandName$
    
    ldrb r2,[r5,r0]
    teq r2,#0
    teqne r2,#' '
    bne commandLoopContinue$
    
    mov r0,r5
    mov r1,r4
    mov lr,pc
    mov pc,r9
    b loopContinue$
  
  commandLoopContinue$:
    add r6,#8
    mov r7,r8
    ldr r9,[r6,#4]
    teq r9,#0
    bne commandLoop$
  
  ldr r0,=commandUnknown
  mov r1,#commandUnknownEnd-commandUnknown
  ldr r2,=formatBuffer
  ldr r3,=command
  bl FormatString
  
  mov r1,r0
  ldr r0,=formatBuffer
  bl Print

loopContinue$:
  bl TerminalDisplay
  b loop$

echo:
  cmp r1,#5
  movle pc,lr

  add r0,#5
  sub r1,#5
  b Print

ok:
  teq r1,#5
  beq okOn$
  teq r1,#6
  beq okOff$
  mov pc,lr
  
  okOn$:
    ldrb r2,[r0,#3]
    teq r2,#'o'
    ldreqb r2,[r0,#4]
    teqeq r2,#'n'
    movne pc,lr
    mov r1,#0
    b okAct$
  
  okOff$:
    ldrb r2,[r0,#3]
    teq r2,#'o'
    ldreqb r2,[r0,#4]
    teqeq r2,#'f'
    ldreqb r2,[r0,#5]
    teqeq r2,#'f'
    movne pc,lr
    mov r1,#1
  
  okAct$:
  
    mov r0,#16
    b SetGpio

.section .data
.align 2
welcome: .ascii "Welcome to Alex's OS - Everyone's favourite OS"
welcomeEnd:
.align 2
prompt: .ascii "\n> "
promptEnd:
.align 2
command:
  .rept 128
    .byte 0
  .endr
commandEnd:
.byte 0
.align 2
commandUnknown: .ascii "Command `%s' was not recognised.\n"
commandUnknownEnd:
.align 2
formatBuffer:
  .rept 256
    .byte 0
  .endr
formatEnd:

.align 2
commandStringEcho: .ascii "echo"
commandStringReset: .ascii "reset"
commandStringOk: .ascii "ok"
commandStringCls: .ascii "cls"
commandStringEnd:

.align 2
commandTable:
.int commandStringEcho, echo
.int commandStringReset, reset$
.int commandStringOk, ok
.int commandStringCls, TerminalClear
.int commandStringEnd, 0
```

这块代码集成了一个简易的命令行操作系统。支持命令：`echo`、`reset`、`ok` 和 `cls`。`echo` 拷贝任意文本到终端，`reset` 命令会在系统出现问题的是复位操作系统，`ok` 有两个功能：设置 OK 灯亮灭，最后 `cls` 调用 TerminalClear 清空终端。

试试树莓派的代码吧。如果遇到问题，请参照问题集锦页面吧。

如果运行正常，祝贺你完成了一个操作系统基本终端和输入系列的课程。很遗憾这个教程先讲到这里，但是我希望将来能制作更多教程。有问题请反馈至 awc32@cam.ac.uk。

你已经在建立了一个简易的终端操作系统。我们的代码在 commandTable 构造了一个可用的命令表格。每个表格的入口是一个整型数字，用来表示字符串的地址，和一个整型数字表格代码的执行入口。 最后一个入口是 为 0 的 `commandStringEnd`。尝试实现你自己的命令，可以参照已有的函数，建立一个新的。函数的参数 `r0` 是用户输入的命令地址，`r1` 是其长度。你可以用这个传递你输入值到你的命令。也许你有一个计算器程序，或许是一个绘图程序或国际象棋。不管你的什么点子，让它跑起来！


--------------------------------------------------------------------------------

via: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input02.html

作者：[Alex Chadwick][a]
选题：[lujun9972][b]
译者：[guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.cl.cam.ac.uk
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10676-1.html
[2]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/images/circular_buffer.png
[3]: https://en.wikipedia.org/wiki/Color_Graphics_Adapter
