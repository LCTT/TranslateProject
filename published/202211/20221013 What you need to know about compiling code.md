[#]: subject: "What you need to know about compiling code"
[#]: via: "https://opensource.com/article/22/10/compiling-code"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15213-1.html"

关于编译代码你应该知道的
======

![](https://img.linux.net.cn/data/attachment/album/202211/04/054126nec50keexencosc4.jpg)

> 用这个方便的捕鼠器比喻来理解编译代码。

源代码必须要经过编译才能够运行程序，而对于开源软件，每个人都可以获取源代码。无论你是自己编写了代码，想要编译和运行它，还是下载了某人的项目来尝试它，了解如何通过 [编译器][2] 处理源代码，以及编译器如何处理这些代码，这都很有用。

### 创建一个更好的捕鼠器

一般情况我们不会将一个捕鼠器比作电脑，但不管你信不信，它确实与你正在使用的设备（手机或电脑）的 CPU 有一些相似之处。经典的捕鼠器（我说的不是 🐈）有两种状态：打开或者释放。你可以认为 *打开* 是将捕鼠器设置好准备捕获老鼠，以及 *释放* 是捕鼠器被老鼠触发。某种意义上来说，捕鼠器就像是一台有鼠标的电脑。你可以想象一下这个代码，用一种虚构的语言来描述这个过程：

```
if mousetrap == 0 then
  There's a mouse!
else
  There's no mouse yet.
end
```

换句话说，你可以基于捕鼠器的状态发现是否有老鼠（数据）。当然，捕鼠器不是万无一失的，有可能有一只老鼠在捕鼠器旁边，由于老鼠还没有触发捕鼠器，所以它的状态还是 *打开* 的。因此该程序可以进行改进，这都是非常典型的。

### 开关

总的来说，捕鼠器就是一个开关。你会在家里使用开关打开灯。可以从开关中获得许多信息。比如，人们会从你家灯的状态了解到你是否在家。

你可以根据邻居家灯的状态来改变行为。如果邻居家所有的灯都熄灭了，那么请关掉你大声的音乐，因为人们可能已经上床睡觉了。

CPU 也使用这样的逻辑，只不过乘以几个数量级，缩小到了微观级别。当 CPU 在特定寄存器上接收到电信号时，可以触发其他一些寄存器，然后触发另一个，以此类推。如果这些寄存器有特定的意义，那么就可以通信。也许激活同一主板上某处的芯片，或者使 LED 亮起，或者改变屏幕上的像素颜色。

种瓜得瓜，种豆得豆。如果你真的想在多个位置而不是仅限于一处发现老鼠，但是你只有一个捕鼠器，那你应该开发一个应用才行。使用网络摄像头和一些基本的图像识别软件，你可以建立空厨房的模型，然后扫描变化。当老鼠进入厨房，在原先没有老鼠的图像上会有像素的变化。记录下这些数据，如果有无人机可以追踪老鼠并捕获会更好，这样就可以将老鼠赶出厨房了。这时，你通过打开和关闭信号的魔法，创造了一个更好的捕鼠器。

### 编译器

代码编译器将人们可阅读的代码转换成 CPU 可以理解的机器语言。这是非常复杂的过程，因为 CPU 非常复杂（甚至比捕鼠器更加复杂），同时因为该过程比严格“需要”的更加灵活。并不是所有的编译器都很灵活。有一些编译器只有一个目标，它们只会处理特定格式的代码文件，处理过程也因此而简单明了。

幸运的是，现代的通用编译器并不简单。它们允许你编写不同语言的代码，也允许你用不同的方式链接库文件，并且可以生成运行在不同架构上的文件。[GNU 编译器集合][4]（GCC）的 `gcc` 编译器 `--help` 会输出超过 50 行的选项，LLVM 的 `clang` 编译器的 `--help` 输出超过 1000 行。GCC 指导手册的字数超过 10 万。

当你在编译代码时会有很多选项。

当然，大多数人并不需要知道所有的选项。我从未读过 GCC 的手册页，因为它们是针对 Objective-C、Fortran 以及我从未听说过的芯片架构的。不过我重视它将代码编译为不同的架构 —— 64 位或者 32 位 —— 的能力，以及在其他行业已经落后的计算机上运行开源软件的能力。

### 编译生命周期

同样重要的是，理解编译代码的不同阶段。这是一个简单的 C 语言程序的生命周期：

1. 带有宏定义的 C 源代码 `.c` 文件，用 `cpp` 预处理为 `.i` 文件。
2. 扩展了宏定义的 C 源代码 `.i` 文件，会被 `gcc` 转译成 `.s` 文件。
3. 以汇编语言写的文本文件 `.s` 文件被汇编为目标 `.o` 文件。
4. 带有 CPU 指令的二进制目标代码，以及其他目标文件和库 `*.o` 文件，以内存区域无关的偏移量，使用 `ld` 链接以生成可执行文件。
5. 最终的二进制文件要么包含所有需要的目标，要么设置以动态链接库 `*.so` 文件加载。

你可以试试这个简单示例（可能需要对库路径做一些调整）：

```
$ cat << EOF >> hello.c
 #include
 int main(void)
 { printf("hello world\n");
   return 0; }
   EOF
$ cpp hello.c > hello.i
$ gcc -S hello.i
$ as -o hello.o hello.s
$ ld -static -o hello \
  -L/usr/lib64/gcc/x86_64-slackware-linux/5.5.0/ \
  /usr/lib64/crt1.o /usr/lib64/crti.o hello.o \
  /usr/lib64/crtn.o  --start-group -lc -lgcc \
  -lgcc_eh --end-group
$ ./hello
hello world
```

### 可获得的知识

计算机已经变得非常强大，并且用户友好。请不要走向这两种可能的极端中的任何一种：计算机不像捕鼠器和电灯开关那么简单，但它们也不是无法理解的。你可以了解编译代码、如何链接以及针对不同架构进行编译。一旦你知道了，你就可以更好地调试代码。你可以理解你下载的代码，甚至可以修复其中的一两个错误。同时从理论上来讲，你可以建造一个更好的捕鼠器，或者用捕鼠器造一个 CPU。由你决定。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/compiling-code

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[2]: https://opensource.com/article/19/5/primer-assemblers-compilers-interpreters
[3]: https://opensource.com/article/22/9/python-interpreters-2022
[4]: https://opensource.com/article/22/5/gnu-c-compiler
