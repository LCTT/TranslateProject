gdb 如何工作？
============================================================

大家好！今天，我开始进行我的 [ruby 堆栈跟踪项目][1]，我意识到，我现在了解了一些关于 gdb 内部如何工作的内容。

最近，我使用 gdb 来查看我的 Ruby 程序，所以，我们将对一个 Ruby 程序运行 gdb 。它实际上就是一个 Ruby 解释器。首先，我们需要打印出一个全局变量的地址：`ruby_current_thread`。

### 获取全局变量

下面展示了如何获取全局变量 `ruby_current_thread` 的地址：

```
$ sudo gdb -p 2983
(gdb) p & ruby_current_thread
$2 = (rb_thread_t **) 0x5598a9a8f7f0 <ruby_current_thread>

```

变量能够位于的地方有堆、栈或者程序的文本段。全局变量也是程序的一部分。某种程度上，你可以把它们想象成是在编译的时候分配的。因此，我们可以很容易的找出全局变量的地址。让我们来看看，gdb 是如何找出 `0x5598a9a87f0` 这个地址的。

我们可以通过查看位于 `/proc` 目录下一个叫做 `/proc/$pid/maps` 的文件，来找到这个变量所位于的大致区域。


```
$ sudo cat /proc/2983/maps | grep bin/ruby
5598a9605000-5598a9886000 r-xp 00000000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
5598a9a86000-5598a9a8b000 r--p 00281000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
5598a9a8b000-5598a9a8d000 rw-p 00286000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby

```

所以，我们看到，起始地址 `5598a9605000` 和 `0x5598a9a8f7f0` 很像，但并不一样。哪里不一样呢，我们把两个数相减，看看结果是多少：

```
(gdb) p/x 0x5598a9a8f7f0 - 0x5598a9605000
$4 = 0x48a7f0

```

你可能会问，这个数是什么？让我们使用 `nm` 来查看一下程序的符号表。

```
sudo nm /proc/2983/exe | grep ruby_current_thread
000000000048a7f0 b ruby_current_thread

```

我们看到了什么？能够看到 `0x48a7f0` 吗？是的，没错。所以，如果我们想找到程序中一个全局变量的地址，那么只需在符号表中查找变量的名字，然后再加上在 `/proc/whatever/maps` 中的起始地址，就得到了。

所以现在，我们知道 gdb 做了什么。但是，gdb 实际做的事情更多，让我们跳过直接转到…

### 解引用指针

```
(gdb) p ruby_current_thread
$1 = (rb_thread_t *) 0x5598ab3235b0

```

我们要做的下一件事就是解引用 `ruby_current_thread` 这一指针。我们想看一下它所指向的地址。为了完成这件事，gdb 会运行大量系统调用比如：

```
ptrace(PTRACE_PEEKTEXT, 2983, 0x5598a9a8f7f0, [0x5598ab3235b0]) = 0

```

你是否还记得 `0x5598a9a8f7f0` 这个地址？gdb 会问：“嘿，在这个地址中的实际内容是什么？”。`2983` 是我们运行 gdb 这个进程的 ID。gdb 使用 `ptrace` 这一系统调用来完成这一件事。

好极了！因此，我们可以解引用内存并找出内存地址中存储的内容。一些有用的 gdb 命令能够分别知道 `x/40w` 和 `x/40b` 这两个变量哪一个会在给定地址展示 40 个字/字节。

### 描述结构

一个内存地址中的内容可能看起来像下面这样。大量的字节！

```
(gdb) x/40b ruby_current_thread
0x5598ab3235b0:	16	-90	55	-85	-104	85	0	0
0x5598ab3235b8:	32	47	50	-85	-104	85	0	0
0x5598ab3235c0:	16	-64	-55	115	-97	127	0	0
0x5598ab3235c8:	0	0	2	0	0	0	0	0
0x5598ab3235d0:	-96	-83	-39	115	-97	127	0	0

```

这很有用，但也不是非常有用！如果你是一个像我一样的人类并且想知道它代表什么，那么你需要更多内容，比如像这样：

```
(gdb) p *(ruby_current_thread)
$8 = {self = 94114195940880, vm = 0x5598ab322f20, stack = 0x7f9f73c9c010,
	stack_size = 131072, cfp = 0x7f9f73d9ada0, safe_level = 0,    raised_flag = 0,
	last_status = 8, state = 0, waiting_fd = -1, passed_block = 0x0,
	passed_bmethod_me = 0x0, passed_ci = 0x0,    top_self = 94114195612680,
	top_wrapper = 0, base_block = 0x0, root_lep = 0x0, root_svar = 8, thread_id =
	140322820187904,

```

太好了。现在就更加有用了。gdb 是如何知道这些所有域的，比如 `stack_size` ？输入 `DWARF`。`DWARF` 是存储额外程序调试数据的一种方式，从而调试器比如 gdb 能够更好的工作。它通常存储为一部分二进制。如果我对我的 Ruby 二进制文件运行 `dwarfdump` 命令，那么我将会得到下面的输出：

（我已经重新编排使得它更容易理解）

```
DW_AT_name                  "rb_thread_struct"
DW_AT_byte_size             0x000003e8
DW_TAG_member
  DW_AT_name                  "self"
  DW_AT_type                  <0x00000579>
  DW_AT_data_member_location  DW_OP_plus_uconst 0
DW_TAG_member
  DW_AT_name                  "vm"
  DW_AT_type                  <0x0000270c>
  DW_AT_data_member_location  DW_OP_plus_uconst 8
DW_TAG_member
  DW_AT_name                  "stack"
  DW_AT_type                  <0x000006b3>
  DW_AT_data_member_location  DW_OP_plus_uconst 16
DW_TAG_member
  DW_AT_name                  "stack_size"
  DW_AT_type                  <0x00000031>
  DW_AT_data_member_location  DW_OP_plus_uconst 24
DW_TAG_member
  DW_AT_name                  "cfp"
  DW_AT_type                  <0x00002712>
  DW_AT_data_member_location  DW_OP_plus_uconst 32
DW_TAG_member
  DW_AT_name                  "safe_level"
  DW_AT_type                  <0x00000066>

```

所以，`ruby_current_thread` 的类型名为 `rb_thread_struct`，它的大小为 0x3e8 （或 1000 字节），它有许多成员项，`stack_size` 是其中之一，在偏移为 24 的地方，它有类型 `31\` 。`31` 是什么？不用担心，我们也可以在 DWARF 信息中查看。

```
< 1><0x00000031>    DW_TAG_typedef
                      DW_AT_name                  "size_t"
                      DW_AT_type                  <0x0000003c>
< 1><0x0000003c>    DW_TAG_base_type
                      DW_AT_byte_size             0x00000008
                      DW_AT_encoding              DW_ATE_unsigned
                      DW_AT_name                  "long unsigned int"

```

所以，`stack_size` 具有类型 `size_t`，即 `long unsigned int`，它是 8 字节的。这意味着我们可以查看栈大小。

如果我们有了 DWARF 调试数据，该如何分解：

1.  查看 `ruby_current_thread` 所指向的内存区域

2.  加上 24 字节来得到 `stack_size` 

3.  读 8 字节（以小端的格式，因为是在 x86 上）

4.  得到答案！

在上面这个例子中是 131072 或 128 kb 。

对我来说，这使得调试信息的用途更加明显。如果我们不知道这些所有变量所表示的额外元数据，那么我们无法知道在 `0x5598ab325b0` 这一地址的字节是什么。

这就是为什么你可以从你的程序中单独安装一个程序的调试信息，因为 gdb 并不关心从何处获取额外的调试信息。

### DWARF 很迷惑

我最近阅读了大量的 DWARF 信息。现在，我使用 libdwarf，使用体验不是很好，这个 API 很令人迷惑，你将以一种奇怪的方式初始化所有东西，它真的很慢（需要花费 0.3 s 的时间来读取我的 Ruby 程序的所有调试信息，这真是可笑）。有人告诉我，libdw 比 elfutils 要好一些。

同样，你可以查看 `DW_AT_data_member_location` 来查看结构成员的偏移。我在 Stack Overflow 上查找如何完成这件事，并且得到[这个答案][2]。基本上，以下面这样一个检查开始：

```
dwarf_whatform(attrs[i], &form, &error);
    if (form == DW_FORM_data1 || form == DW_FORM_data2
        form == DW_FORM_data2 || form == DW_FORM_data4
        form == DW_FORM_data8 || form == DW_FORM_udata) {

```

继续往前。为什么会有 800 万种不同的 `DW_FORM_data` 需要检查？发生了什么？我没有头绪。

不管怎么说，我的印象是，DWARF 是一个庞大而复杂的标准（可能是人们用来生成 DWARF 的库不匹配），但是这是我们所拥有的，所以我们只能用它来工作。

我能够编写代码并查看 DWARF 并且我的代码实际上大多数能够工作，这就很酷了，除了程序崩溃的时候。我就是这样工作的。

### 展开栈路径

在这篇文章的早期版本中，我说过，gdb 使用 libunwind 来展开栈路径，这样说并不总是对的。

有一位对 gdb 有深入研究的人发了大量邮件告诉我，他们花费了大量时间来尝试如何展开栈路径从而能够做得比 libunwind 更好。这意味着，如果你在程序的一个奇怪的中间位置停下来了，你所能够获取的调试信息又很少，那么你可以对栈做一些奇怪的事情，gdb 会尝试找出你位于何处。

### gdb 能做的其他事

我在这儿所描述的一些事请（查看内存，理解 DWARF 所展示的结构）并不是 gdb 能够做的全部事情。阅读 Brendan Gregg 的[昔日 gdb 例子][3]，我们可以知道，gdb 也能够完成下面这些事情：

*   反汇编

*   查看寄存器内容

在操作程序方面，它可以：

*   设置断点，单步运行程序

*   修改内存（这是一个危险行为）

了解 gdb 如何工作使得当我使用它的时候更加自信。我过去经常感到迷惑，因为 gdb 有点像 C，当你输入 `ruby_current_thread->cfp->iseq`，就好像是在写 C 代码。但是你并不是在写 C 代码。我很容易遇到 gdb 的限制，不知道为什么。

知道使用 DWARF 来找出结构内容给了我一个更好的心理模型和更加正确的期望！这真是极好的！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2016/08/10/how-does-gdb-work/

作者：[Julia Evans][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/
[1]:http://jvns.ca/blog/2016/06/12/a-weird-system-call-process-vm-readv/
[2]:https://stackoverflow.com/questions/25047329/how-to-get-struct-member-offset-from-dwarf-info
[3]:http://www.brendangregg.com/blog/2016-08-09/gdb-example-ncurses.html
