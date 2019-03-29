[#]: collector: (lujun9972)
[#]: translator: (ezio )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Computer Laboratory – Raspberry Pi: Lesson 10 Input01)
[#]: via: (https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input01.html)
[#]: author: (Alex Chadwick https://www.cl.cam.ac.uk)


计算机实验课 – 树莓派: 课程 10 输入01
======

欢迎进入输入课程系列。在本系列，你将会学会如何使用键盘接收输入给树莓派。我们将会从揭示输入开始本课，然后开始传统的文本命令。

这是第一堂输入课，会教授一些关于驱动和链接的理论，同样也包含键盘的知识，最后以在屏幕上显示文本结束。

### 1 开始

希望你已经完成了 OK 系列课程， 这会对你完成屏幕系列课程很有帮助。很多 OK 课程上的文件会被使用而不会做解释。如果你没有这些文件，或者希望使用一个正确的实现， 可以从该堂课的[下载页][1]下载模板。如果你使用你自己的实现，请删除调用了 `SetGraphicsAddress` 之后全部的代码。

### 2 USB

```
USB 标准的设计目的是通过复杂的硬件来简化硬件。
```

如你所知，树莓派 B 型有两个 USB 接口，通常用来连接一个鼠标和一个键盘。这是一个非常好的设计决策，USB 是一个非常通用的接口， 很多种设备都可以使用它。这就很容易为它设计新外设，很容易为它编写设备驱动， 而且通过 USB 集线器可以非常容易扩展。还能更好吗？当然是不能，实际上对一个操作系统开发者来说，这就是我们的噩梦。USB 标准太大了。 我是真的，在你思考如何连接设备之前，它的文档将近 700 页。

我和很多爱好操作系统的开发者谈过这些，而他们全部都说几句话：不要抱怨。“实现这个需要花费很久时间”，“你不可能写出关于 USB 的教程”，“收益太小了”。在很多方面，他们是对的，我不可能写出一个关于 USB 标准的教程， 那得花费几周时间。我同样不能教授如何为全部所有的设备编写外设驱动，所以使用自己写的驱动是没什么用的。然而，我可以做仅次于最好的事情是获取一个正常工作的 USB 驱动，拿一个键盘驱动，然后教授如何在操作系统中使用它们。我开始寻找可以运行在一个甚至不知道文件是什么的操作系统的自由驱动，但是我一个都找不到。他们都太高层了。所以我尝试写一个。每个人都是对的，这耗费了我几周时间。然而我高兴的说我我做这些工作没有获取操作系统以外的帮助，并且可以和鼠标和键盘通信。这句不是完整的，高效的，或者正确的，但是它能工作。驱动是以 C 编写的，而且有兴趣的可以在下载页找到全部源代码。

所以，这一个教程不会是 USB 标准的课程（一点也没有）。实际上我们将会看到如何使用其他人的代码。

### 3 链接

```
链接允许我们制作可重用的代码库，所有人都可以在他们的程序中使用。
```

既然我们要引进外部代码到操作系统，我们就需要谈一谈链接。链接是一种过程，可以在程序或者操作系统中链接函数。这意味着当一个程序生成之后，我们不必要编写每一个函数（几乎可以肯定，实际上并非如此）。链接就是我们做的用来把我们程序和别人代码中的函数连结在一起。这个实际上已经在我们的操作系统进行了，因为链接器吧所有不同的文件链接在一起，每个都是分开编译的。


```
程序经常知识调用库，这些库会调用其它的库，知道最终调用了我们写的操作系统。
```

有两种链接：静态和动态。静态链接就像我们在制作自己的操作系统时进行的。链接器找到全部函数的地址，然后在链接结束前，将这些地址都写入代码中。动态链接是在程序“完成”之后。当程序加载后，动态链接器检查程序，然后在操作系统的库找到所有不在程序里的函数。这就是我们的操作系统最终应该能够完成的一项工作，但是现在所有东西都将是静态链接的。

我编写的 USB 驱动程序适合静态编译。这意味着我给你我的每个文件的编译后的代码，然后链接器找到你的代码中的那些没有实现的函数，就将这些函数链接到我的代码。在本课的 [下载页][1] 是一个 makefile 和我的 USB 驱动，这是接下来需要的。下载并使用这 makefile 替换你的代码中的 makefile， 同事将驱动放在和这个 makefile 相同的文件夹。

### 4 键盘

为了将输入传给我们的操作系统，我们需要在某种程度上理解键盘是如何实际工作的。键盘有两种按键：普通键和修饰键。普通按键是字母、数字、功能键，等等。他们构成了键盘上几乎每一个按键。修饰键是最多 8 个特殊键。他们是左 shift ， 右 shift， 左 ctrl，右 ctrl，左 alt， 右 alt，左 GUI 和右 GUI。键盘可以检测出所有的组合中那个修饰键被按下了，以及最多 6 个普通键。每次一个按钮变化了（i.e. 是按下了还是释放了），键盘就会报告给电脑。通常，键盘也会有 3 个 LED 灯，分别指示 Caps 锁定，Num 锁定，和 Scroll 锁定，这些都是由电脑控制的，而不是键盘自己。键盘也可能由更多的灯，比如电源、静音，等等。

为了帮助标准 USB 键盘，产生了一个按键值的表，每个键盘按键都一个唯一的数字，每个可能的 LED 也类似。下面的表格列出了前 126 个值。

Table 4.1 USB 键盘值

| 序号 | 描述             | 序号 | 描述          | 序号      | 描述              | 序号  | 描述            |          |
| ------ | ---------------- | ------- | ---------------------- | -------- | -------------- | --------------- | -------------------- |----|
| 4      | a and A                 | 5      | b and B              | 6           | c and C                  | 7       | d and D                |          |
| 8      | e and E                 | 9      | f and F              | 10          | g and G                  | 11      | h and H                |          |
| 12     | i and I                 | 13     | j and J              | 14          | k and K                  | 15      | l and L                |          |
| 16     | m and M                 | 17     | n and N              | 18          | o and O                  | 19      | p and P                |          |
| 20     | q and Q                 | 21     | r and R              | 22          | s and S                  | 23      | t and T                |          |
| 24     | u and U                 | 25     | v and V              | 26          | w and W                  | 27      | x and X                |          |
| 28     | y and Y                 | 29     | z and Z              | 30          | 1 and !                  | 31      | 2 and @                |          |
| 32     | 3 and #                 | 33     | 4 and $              | 34          | 5 and %                  | 35      | 6 and ^                |          |
| 36     | 7 and &                 | 37     | 8 and *              | 38          | 9 and (                  | 39      | 0 and )                |          |
| 40     | Return (Enter)          | 41     | Escape               | 42          | Delete (Backspace)       | 43      | Tab                    |          |
| 44     | Spacebar                | 45     | - and _              | 46          | = and +                  | 47      | [ and {                |          |
| 48     | ] and }                 | 49     | \ and                | 50          | # and ~                  | 51      | ; and : |
| 52     | ' and "                 | 53     | ` and ~              | 54          | , and <                  | 55      | . and >                |          |
| 56     | / and ?                 | 57     | Caps Lock            | 58          | F1                       | 59      | F2                     |          |
| 60     | F3                      | 61     | F4                   | 62          | F5                       | 63      | F6                     |          |
| 64     | F7                      | 65     | F8                   | 66          | F9                       | 67      | F10                    |          |
| 68     | F11                     | 69     | F12                  | 70          | Print Screen             | 71      | Scroll Lock            |          |
| 72     | Pause                   | 73     | Insert               | 74          | Home                     | 75      | Page Up                |          |
| 76     | Delete forward          | 77     | End                  | 78          | Page Down                | 79      | Right Arrow            |          |
| 80     | Left Arrow              | 81     | Down Arrow           | 82          | Up Arrow                 | 83      | Num Lock               |          |
| 84     | Keypad /                | 85     | Keypad *             | 86          | Keypad -                 | 87      | Keypad +               |          |
| 88     | Keypad Enter            | 89     | Keypad 1 and End     | 90          | Keypad 2 and Down Arrow  | 91      | Keypad 3 and Page Down |          |
| 92     | Keypad 4 and Left Arrow | 93     | Keypad 5             | 94          | Keypad 6 and Right Arrow | 95      | Keypad 7 and Home      |          |
| 96     | Keypad 8 and Up Arrow   | 97     | Keypad 9 and Page Up | 98          | Keypad 0 and Insert      | 99      | Keypad . and Delete    |          |
| 100    | \ and                   | 101                  | Application | 102                      | Power   | 103                    | Keypad = |
| 104    | F13                     | 105    | F14                  | 106         | F15                      | 107     | F16                    |          |
| 108    | F17                     | 109    | F18                  | 110         | F19                      | 111     | F20                    |          |
| 112    | F21                     | 113    | F22                  | 114         | F23                      | 115     | F24                    |          |
| 116    | Execute                 | 117    | Help                 | 118         | Menu                     | 119     | Select                 |          |
| 120    | Stop                    | 121    | Again                | 122         | Undo                     | 123     | Cut                    |          |
| 124    | Copy                    | 125    | Paste                | 126         | Find                     | 127     | Mute                   |          |
| 128    | Volume Up               | 129    | Volume Down          |             |                          |         |                        |          |

完全列表可以在[HID 页表 1.12][2]的 53 页，第 10 节找到

### 5 车轮后的螺母

```
这些总结和代码的描述组成了一个 API - 应用程序产品接口。

```

通常，当你使用其他人的代码，他们会提供一份自己代码的总结，描述代码都做了什么，粗略介绍了是如何工作的，以及什么情况下会出错。下面是一个使用我的 USB 驱动的相关步骤要求。

Table 5.1  CSUD 中和键盘相关的函数 
| 函数                | 参数                       | 返回值              | 描述   |
| ----------------------- | ----------------------- | ----------------------- | -----------------------|
| UsbInitialise           | None                            | r0 is result code    | 这个方法是一个集多种功能于一身的方法，它加载USB驱动程序，枚举所有设备并尝试与它们通信。这种方法通常需要大约一秒钟的时间来执行，但是如果插入几个USB集线器，执行时间会明显更长。在此方法完成之后，键盘驱动程序中的方法就可用了，不管是否确实插入了键盘。返回代码如下解释。|
| UsbCheckForChange       | None                            | None                 | 本质上提供与 `usbinitialization` 相同的效果，但不提供相同的一次初始化。该方法递归地检查每个连接的集线器上的每个端口，如果已经添加了新设备，则添加它们。如果没有更改，这应该是非常快的，但是如果连接了多个设备的集线器，则可能需要几秒钟的时间。|
| KeyboardCount           | None                            | r0 is count          | 返回当前连接并检测到的键盘数量。`UsbCheckForChange` 可能会对此进行更新。默认情况下最多支持4个键盘。多达这么多的键盘可以通过这个驱动程序访问。|
| KeyboardGetAddress      | r0 is index                     | r0 is address        | 检索给定键盘的地址。所有其他函数都需要一个键盘地址，以便知道要访问哪个键盘。因此，要与键盘通信，首先要检查计数，然后检索地址，然后使用其他方法。注意，在调用 `UsbCheckForChange` 之后，此方法返回的键盘顺序可能会改变。
|
| KeyboardPoll            | r0 is address                   | r0 is result code    | 从键盘读取当前键状态。这是通过直接轮询设备来操作的，与最佳实践相反。这意味着，如果没有频繁地调用此方法，可能会错过一个按键。所有读取方法只返回上次轮询时的值。
|
| KeyboardGetModifiers    | r0 is address                   | r0 is modifier state | 检索上次轮询时修饰符键的状态。这是两边的 `shift` 键、`alt` 键和 `GUI` 键。这回作为一个位字段返回，这样，位0中的1表示左控件被保留，位1表示左 `shift`，位2表示左 `alt` ，位3表示左 `GUI`，位4到7表示前几位的右版本。如果有问题，`r0` 包含0。|
| KeyboardGetKeyDownCount | r0 is address                   | r0 is count          | 检索当前按下键盘的键数。这排除了修饰键。这通常不能超过6次。如果有错误，这个方法返回0。|
| KeyboardGetKeyDown      | r0 is address, r1 is key number | r0 is scan code      | 检索特定下拉键的扫描代码(见表4.1)。通常，要计算出哪些键是关闭的，可以调用 `KeyboardGetKeyDownCount`，然后多次调用 `KeyboardGetKeyDown` ，将 `r1` 的值递增，以确定哪些键是关闭的。如果有问题，返回0。在不调用 `KeyboardGetKeyDownCount` 并将0解释为未持有的键的情况下调用此方法是安全的(但不建议这样做)。注意，顺序或扫描代码可以随机更改(有些键盘按数字排序，有些键盘按时间排序，没有任何保证)。|
| KeyboardGetKeyIsDown    | r0 is address, r1 is scan code  | r0 is status         | 除了 `KeyboardGetKeyDown` 之外，还可以检查下拉键中是否有特定的扫描代码。如果不是，返回0;如果是，返回一个非零值。当检测特定的扫描代码(例如寻找ctrl+c)更快。出错时，返回0。
|
| KeyboardGetLedSupport   | r0 is address                   | r0 is LEDs           | 检查特定键盘支持哪些led。第0位代表数字锁定，第1位代表大写锁定，第2位代表滚动锁定，第3位代表合成，第4位代表假名，第5位代表能量，第6位代表静音，第7位代表合成。根据USB标准，这些led都不是自动更新的(例如，当检测到大写锁定扫描代码时，必须手动设置大写锁定)。|
| KeyboardSetLeds         | r0 is address, r1 is LEDs       | r0 is result code    | 试图打开/关闭键盘上指定的 LED 灯。查看下面的结果代码值。参见 `KeyboardGetLedSupport` 获取 LED 的值。
|

```
返回值是一种处理错误的简单方法，但是通常更优雅的解决途径存在于更高层次的代码。
```

有几种方法返回 ‘返回值’。这些都是 C 代码的老生常谈了，就是用数字代表函数调用发生了什么。通常情况， 0 总是代表操作成功。下面的是驱动用到的返回值。

Table 5.2 - CSUD 返回值

| 代码 | 描述                                                             |
| ---- | ----------------------------------------------------------------------- |
| 0    | 方法成功完成。                                        |
| -2   | 参数: 函数调用了无效参数。                               |
| -4   | 设备: 设备没有正确响应请求。                                 |
| -5   | 不匹配: 驱动不适用于这个请求或者设备。                  |
| -6   | 编译器: 驱动没有正确编译，或者被破坏了。           |
| -7   | 内存: 驱动用尽了内存。                                  |
| -8   | 超时: 设备没有在预期的时间内响应请求。               |
| -9   | 断开连接: 被请求的设备断开连接，或者不能使用。  |

驱动的通常用法如下：

  1. 调用 `UsbInitialise`
  2. 调用 `UsbCheckForChange`
  3. 调用 `KeyboardCount`
  4. 如果返回 0，重复步骤 2。
  5. 针对你支持的每种键盘:
    1. 调用 ·KeyboardGetAddress·
    2. 调用 ·KeybordGetKeyDownCount·
    3. 针对每个按下的按键:
      1. 检查它是否已经被按下了
      2. 保存按下的按键
    4. 针对每个保存的按键:
      3. 检查按键是否被释放了
      4. 如果释放了就删除
  6. 根据按下/释放的案件执行操作
  7. 重复步骤 2.


最后，你可能做所有你想对键盘做的事，而这些方法应该允许你访问键盘的全部功能。在接下来的两节课，我们将会着眼于完成文本终端的输入部分，类似于大部分的命令行电脑，以及命令的解释。为了做这些，我们将需要在更有用的形式下得到一个键盘输入。你可能注意到我的驱动是（故意）没有太大帮助，因为它并没有方法来判断是否一个案件刚刚按下或释放了，它只有芳芳来判断当前那个按键是按下的。这就意味着我们需要自己编写这些方法。

### 6 可用更新

重复检查更新被称为 ‘轮询’。这是针对驱动 IO 中断而言的，这种情况下设备在准备好后会发一个信号。

首先，让我们实现一个 `KeyboardUpdate` 方法，检查第一个键盘，并使用轮询方法来获取当前的输入，以及保存最后一个输入来对比。然后我们可以使用这个数据和其它方法来将扫描码转换成按键。这个方法应该按照下面的说明准确操作：

  1. 提取一个保存好的键盘地址（初始值为 0）。
  2. 如果不是0 ，进入步骤9.
  3. 调用 `UsbCheckForChange` 检测新键盘。
  4. 调用 `KeyboardCount` 检测有几个键盘在线。
  5. 如果返回0，意味着没有键盘可以让我们操作，只能退出了。
  6. 调用 `KeyboardGetAddress` 参数是 0，获取第一个键盘的地址。
  7. 保存这个地址。
  8. 如果这个值是0，那么退出，这里应该有些问题。
  9. 调用 `KeyboardGetKeyDown` 6 次，获取每次按键按下的值并保存。
  10. 调用 `KeyboardPoll`
  11. 如果返回值非 0，进入步骤 3。这里应该有些问题（比如键盘断开连接）。

要保存上面提到的值，我们将需要下面 `.data` 段的值。

```
.section .data
.align 2
KeyboardAddress:
.int 0
KeyboardOldDown:
.rept 6
.hword 0
.endr
```

```
.hword num 直接将半字的常数插入文件。
```

```
.rept num [commands] .endr 复制 `commands` 命令到输出 num 次。
```

试着自己实现这个方法。对此，我的实现如下：

1. 
```
.section .text
.globl KeyboardUpdate
KeyboardUpdate:
push {r4,r5,lr}

kbd .req r4
ldr r0,=KeyboardAddress
ldr kbd,[r0]
```
我们加载键盘的地址。

2. 
```
teq kbd,#0
bne haveKeyboard$
```
如果地址非0，就说明我们有一个键盘。调用 `UsbCheckForChanges` 慢，所以如果全部事情都起作用，我们要避免调用这个函数。

3. 
```
getKeyboard$:
bl UsbCheckForChange
```
如果我们一个键盘都没有，我们就必须检查新设备。

4. 
```
bl KeyboardCount
```
如果有心键盘添加，我们就会看到这个。

5. 
```
teq r0,#0
ldreq r1,=KeyboardAddress
streq r0,[r1]
beq return$
```
如果没有键盘，我们就没有键盘地址。

6. 
```
mov r0,#0
bl KeyboardGetAddress
```
让我们获取第一个键盘的地址。你可能想要更多。

7. 
```
ldr r1,=KeyboardAddress
str r0,[r1]
```
保存键盘地址。

8. 
```
teq r0,#0
beq return$
mov kbd,r0
```
如果我们没有地址，这里就没有其它活要做了。

9. 
```
saveKeys$:
  mov r0,kbd
  mov r1,r5
  bl KeyboardGetKeyDown
  
  ldr r1,=KeyboardOldDown
  add r1,r5,lsl #1
  strh r0,[r1]
  add r5,#1
  cmp r5,#6
  blt saveKeys$
```
Loop through all the keys, storing them in KeyboardOldDown. If we ask for too many, this returns 0 which is fine.
查询遍全部按键，在 `KeyboardOldDown` 保存下来。如果我们询问的太多了，返回 0 也是正确的。

10. 
```
mov r0,kbd
bl KeyboardPoll
```
现在哦我们得到了新的按键。

11. 
```
teq r0,#0
bne getKeyboard$

return$:
pop {r4,r5,pc}
.unreq kbd
```
最后我们要检查 `KeyboardOldDown` 是否工作了。如果没工作，那么我们可能是断开连接了。

有了我们新的 `KeyboardUpdate` 方法，检查输入变得简单到固定周期调用这个方法，而它甚至可以检查断开连接，等等。这是一个有用的方法，因为我们实际的按键处理会根据条件不同而有所差别，所以能够用一个函数调以它的原始方式获取当前的输入是可行的。下一个方法我们理想希望的是 `KeyboardGetChar`，简单的返回下一个按下的按钮的 ASCII 字符，或者如果没有按键按下就返回 0。这可以扩展到支持将一个按键多次按下，如果它保持了一个特定时间，也支持‘锁定’键和修饰键。

要使这个方法有用，如果我们有一个 `KeyWasDown` 方法，如果给定的扫描代码不在keyboard dolddown值中，它只返回0，否则返回一个非零值。你可以自己尝试一下。与往常一样，可以在下载页面找到解决方案。

### 7 查找表

```
在编程的许多领域，程序越大，速度越快。查找表很大，但是速度很快。有些问题可以通过查找表和普通函数的组合来解决。
```

`KeyboardGetChar`方法如果写得不好，可能会非常复杂。有 100 多种扫描代码，每种代码都有不同的效果，这取决于 shift 键或其他修饰符的存在与否。并不是所有的键都可以转换成一个字符。对于一些字符，多个键可以生成相同的字符。在有如此多可能性的情况下，一个有用的技巧是查找表。查找表与物理意义上的查找表非常相似，它是一个值及其结果的表。对于一些有限的函数，推导出答案的最简单方法就是预先计算每个答案，然后通过检索返回正确的答案。在这种情况下,我们可以建立一个序列的值在内存中,n值序列的ASCII字符代码扫描代码n。这意味着我们的方法只会发现如果一个键被按下,然后从表中检索它的值。此外，当按住shift键时，我们可以为值创建一个单独的表，这样shift键就可以简单地更改正在处理的表。

在 `.section` `.data` 命令之后，复制下面的表：

```
.align 3
KeysNormal:
    .byte 0x0, 0x0, 0x0, 0x0, 'a', 'b', 'c', 'd'
    .byte 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l'
    .byte 'm', 'n', 'o', 'p', 'q', 'r', 's', 't'
    .byte 'u', 'v', 'w', 'x', 'y', 'z', '1', '2'
    .byte '3', '4', '5', '6', '7', '8', '9', '0'
    .byte '\n', 0x0, '\b', '\t', ' ', '-', '=', '['
    .byte ']', '\\\', '#', ';', '\'', '`', ',', '.'
    .byte '/', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, '/', '*', '-', '+'
    .byte '\n', '1', '2', '3', '4', '5', '6', '7'
    .byte '8', '9', '0', '.', '\\\', 0x0, 0x0, '='

.align 3
KeysShift:
    .byte 0x0, 0x0, 0x0, 0x0, 'A', 'B', 'C', 'D'
    .byte 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L'
    .byte 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T'
    .byte 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '"'
    .byte '£', '$', '%', '^', '&', '*', '(', ')'
    .byte '\n', 0x0, '\b', '\t', ' ', '_', '+', '{'
    .byte '}', '|', '~', ':', '@', '¬', '<', '>'
    .byte '?', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, '/', '*', '-', '+'
    .byte '\n', '1', '2', '3', '4', '5', '6', '7'
    .byte '8', '9', '0', '.', '|', 0x0, 0x0, '='
```

```
.byte num 直接插入字节常量 num 到文件。
```

```
大部分的汇编器和编译器识别转义序列；插入特殊字符的字符序列，如\t。
```

这些表直接将前 104 个扫描代码映射到 ASCII 字符，作为一个字节表。我们还有一个单独的表来描述 `shift` 键对这些扫描代码的影响。我使用 ASCII `null`字符(0)表示所有没有直接映射的 ASCII 键(例如函数键)。退格映射到ASCII退格字符(8表示 `\b` )， `enter` 映射到ASCII新行字符(10表示 `\n`)， `tab` 映射到ASCII水平制表符(9表示 `\t` )。


`KeyboardGetChar` 方法需要做以下工作:
  1. 检查 `KeyboardAddress` 是否返回 0。如果是，则返回0。
  2. 调用 `KeyboardGetKeyDown` 最多 6 次。每次：
    1. 如果按键时0，跳出循环。
    2. 调用 `KeyWasDown`。 如果返回是，处理下一个按键。
    3. 如果扫描码超过 103，进入下一个按键。
    4. 调用 `KeyboardGetModifiers`
    5. 如果 `shift` 是被按着的，就加载 `KeysShift` 的地址。否则加载 `KeysNormal` 的地址。
    6. 从表中读出 ASCII 码值。
    7. 如果是 0，进行下一个按键，否则返回 ASCII 码值并退出。
  3. 返回0。


试着自己实现。我的实现展示在下面：

1. 
```
.globl KeyboardGetChar
KeyboardGetChar:
ldr r0,=KeyboardAddress
ldr r1,[r0]
teq r1,#0
moveq r0,#0
moveq pc,lr
```
简单的检查我们是否有键盘。

2. 
```
push {r4,r5,r6,lr}
kbd .req r4
key .req r6
mov r4,r1
mov r5,#0
keyLoop$:
  mov r0,kbd
  mov r1,r5
  bl KeyboardGetKeyDown
```
r5 will hold the index of the key, r4 holds the keyboard address.
`r5` 将会保存按键的索引， `r4` 保存键盘的地址。

    1. 
    ```
    teq r0,#0
    beq keyLoopBreak$
    ```
    如果扫描码是0，它要么意味着有错，要么说明没有更多按键了。

    2. 
    ```
    mov key,r0
    bl KeyWasDown
    teq r0,#0
    bne keyLoopContinue$
    ```
    如果按键已经按下了，那么他就没意思了，我们只想知道按下的按键。

    3. 
    ```
    cmp key,#104
    bge keyLoopContinue$
    ```
    如果一个按键有个超过 104 的扫描码，他将会超出我们的表，所以它是无关的按键。

    4. 
    ```
    mov r0,kbd
    bl KeyboardGetModifiers
    ```
    我们需要知道修饰键来推断字符。

    5. 
    ```
    tst r0,#0b00100010
    ldreq r0,=KeysNormal
    ldrne r0,=KeysShift
    ```
    当将字符更改为其移位变体时，我们要同时检测左 `shift` 键和右 `shift` 键。记住，`tst` 指令计算的是逻辑和，然后将其与 0 进行比较，所以当且仅当移位位都为 0 时，它才等于0。


    1. 
    ```
    ldrb r0,[r0,key]
    ```
    现在我们可以从查找表加载按键了。

    1. 
    ```
    teq r0,#0
    bne keyboardGetCharReturn$
    keyLoopContinue$:
    add r5,#1
    cmp r5,#6
    blt keyLoop$
    ```
    如果查找码包含一个 0，我们必须继续。为了继续，我们要增加索引，并检查是否到 6 次了。

1. 
```
keyLoopBreak$:
mov r0,#0
keyboardGetCharReturn$:
pop {r4,r5,r6,pc}
.unreq kbd
.unreq key
```
在这里我们返回我们的按键，如果我们到达 `keyLoopBreak$` ，然后我们就知道这里没有按键被握住，所以返回0。

### 8 记事本操作系统

现在我们有了 `KeyboardGetChar` 方法，可以创建一个操作系统，只输入用户对着屏幕所写的内容。为了简单起见，我们将忽略所有不寻常的键。在 `main.s` ,删除`bl SetGraphicsAddress` 之后的所有代码。调用 `UsbInitialise`，将 `r4` 和 `r5` 设置为 0，然后循环执行以下命令:

  1. 调用 `KeyboardUpdate`
  2. 调用 `KeyboardGetChar`
  3. 如果返回 0，跳转到步骤1
  4. 复制 `r4` 和 `r5` 到 `r1` 和 `r2` ，然后调用 `DrawCharacter`
  5. 把 `r0` 加到 `r4`
  6. 如果 `r4` 是 1024，将 `r1` 加到 `r5`，然后设置 `r4` 为 0。
  7. 如果 `r5` 是 768，设置 `r5` 为0
  8. 跳转到步骤1



现在编译这个，然后在 PI 上测试。您几乎可以立即开始在屏幕上输入文本。如果没有，请参阅我们的故障排除页面。

当它工作时，祝贺您，您已经实现了与计算机的接口。现在您应该开始意识到，您几乎已经拥有了一个原始的操作系统。现在，您可以与计算机交互，发出命令，并在屏幕上接收反馈。在下一篇教程[输入02][3]中，我们将研究如何生成一个全文本终端，用户在其中输入命令，然后计算机执行这些命令。

--------------------------------------------------------------------------------

via: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input01.html

作者：[Alex Chadwick][a]
选题：[lujun9972][b]
译者：[ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.cl.cam.ac.uk
[b]: https://github.com/lujun9972
[1]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/downloads.html
[2]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/downloads/hut1_12v2.pdf
[3]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input02.html
