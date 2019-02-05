[#]: collector: (lujun9972)
[#]: translator: (oska874)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Computer Laboratory – Raspberry Pi: Lesson 5 OK05)
[#]: via: (https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok05.html)
[#]: author: (Robert Mullins http://www.cl.cam.ac.uk/~rdm34)

translating by ezio

树莓派计算机实验室 课程 5 OK05
======

OK05 课程构建于课程 OK04 的基础，使用更多代码方式烧、保存写莫尔斯码的 SOS 序列(`...---...`)。这里假设你已经有了 [课程 4: OK04][1] 操作系统的代码基础。

### 1 数据

到目前为止，我们与操作系统有关的所有内容都提供了遵循的说明。然而有时候，说明只是一半。我们的操作系统可能需要数据

> 一些早期的操作系统确实只允许特定文件中的特定类型的数据，但是这通常被认为太严格了。现代方法确实使程序变得复杂的多。

通常，只是数据的值很重要。你可能经过训练，认为数据是指定类型，比如，一个文本文件包含文章，一个图像文件包含一幅图片，等等。说实话，这只是一个理想罢了。计算机上的全部数据都是二进制数字，重要的是我们选择用什么来解释这些数据。在这个例子中，我们会将一个闪灯序列作为数据保存下来。

在 `main.s` 结束处复制下面的代码：

```
.section .data %定义 .data 段
.align 2 %对齐
pattern: %定义整形变量
.int 0b11111111101010100010001000101010
```

>`.align num` 保证下一行代码的地址是 `2^num` 的整数倍。

>`.int val` 输出数值 `val`。

要区分数据和代码，我们将数据都放在 `.data` 区域。我已经将该区域包含在操作系统的内存布局图。我已经选择将数据放到代码后面。将我们的指令和数据分开保存的原因是，如果最后我们在自己的操作系统上实现一些安全措施，我们就需要知道代码的那些部分是可以执行的，而那些部分是不行的。

我在这里使用了两个新命令 `.align` 和 `.int`。`.align` 保证下来的数据是按照 2 的乘方对齐的。在这个里，我使用 `.align 2` ，意味着数据最终存放的地址是 `2^2=4` 的整数倍。这个操作是很重要的，因为我们用来读取内寸的指令 `ldr` 要求内存地址是 4 的倍数。

The .int command copies the constant after it into the output directly. That means that 111111111010101000100010001010102 will be placed into the output, and so the label pattern actually labels this piece of data as pattern.

命令 `.int` 直接复制它后面的常量到输出。这意味着 `11111111101010100010001000101010`(二进制数) 将会被存放到输出，所以标签模式实际将标记这段数据作为模式。

> 关于数据的一个挑战是寻找一个高效和有用的展示形式。这种保存一个开、关的时间单元的序列的方式，运行起来很容易，但是将很难编辑，因为摩尔斯的原理 `-` 或 `.` 丢失了。

如我提到的，数据可以意味这你想要的所有东西。在这里我编码了摩尔斯代码 SOS 序列，对于不熟悉的人，就是 `...---...`。我使用 0 表示一个时间单元的 LED 灭灯，而 1 表示一个时间单元的 LED 亮。这样，我们可以像这样编写一些代码在数据中显示一个序列，然后要显示不同序列，我们所有需要做的就是修改这段数据。下面是一个非常简单的例子，操作系统必须一直执行这段程序，解释和展示数据。

复制下面几行到 `main.s` 中的标记 `loop$` 之前。

```
ptrn .req r4 %重命名 r4 为 ptrn
ldr ptrn,=pattern %加载 pattern 的地址到 ptrn
ldr ptrn,[ptrn] %加载地址 ptrn 所在内存的值
seq .req r5 %重命名 r5 为 seq
mov seq,#0 %seq 赋值为 0
```

这段代码加载 `pattrern` 到寄存器 `r4`，并加载 0 到寄存器 `r5`。`r5` 将是我们的序列位置，所以我们可以追踪有多少 `pattern` 我们已经展示了。

下面的代码将非零值放入 `r1` ，如果仅仅是如果，这里有个 1 在当前位置的 `pattern`。

```
mov r1,#1 %加载1到 r1
lsl r1,seq %对r1 的值逻辑左移 seq 次
and r1,ptrn %按位与
```

这段代码对你调用 `SetGpio` 很有用，它必须有一个非零值来关掉 LED，而一个0值会打开 LED。

现在修改 `main.s` 中全部你的代码，这样代码中每次循环会根据当前的序列数设置 LED，等待 250000 毫秒（或者其他合适的延时），然后增加序列数。当这个序列数到达 32 就需要返回 0.看看你是否能实现这个功能，作为额外的挑战，也可以试着只使用一条指令。

### 2 Time Flies When You're Having Fun... 当你玩得开心时，过得很快

你现在准备好在树莓派上实验。应该闪烁一串包含 3 个短脉冲，3 个长脉冲，然后 3 个更短脉冲的序列。在一次延时之后，这种模式应该重复。如果这部工作，请查看我们的问题页。

一旦它工作，祝贺你已经达到 OK 系列教程的结束。

在这个谢列我们学习了汇编代码，GPIO 控制器和系统定时器。我们已经学习了函数和 ABI，以及几个基础的操作系统原理，和关于数据的知识。

你现在已经准备好下面几个更高级的课程的某一个。
 * [Screen][2] 系列是接下来的，会教你如何通过汇编代码使用屏幕。
 * [Input][3] 系列教授你如何使用键盘和鼠标。
 
到现在，你已经有了足够的信息来制作操作系统，用其它方法和 GPIO 交互。如果你有任何机器人工具，你可能会想尝试编写一个通过 GPIO 管教控制的机器人操作系统。

--------------------------------------------------------------------------------

via: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok05.html

作者：[Robert Mullins][a]
选题：[lujun9972][b]
译者：[ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cl.cam.ac.uk/~rdm34
[b]: https://github.com/lujun9972
[1]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok04.html
[2]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html
[3]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input01.html
