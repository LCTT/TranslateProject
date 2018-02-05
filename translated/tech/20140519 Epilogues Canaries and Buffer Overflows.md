[探秘“栈”之旅（II）—— 谢幕，金丝雀，和缓冲区溢出][1]
============================================================

上一周我们讲解了 [栈是如何工作的][2] 以及在函数的开端上栈帧是如何被构建的。今天，我们来看一下它的相反的过程，在函数结束时，栈帧是如何被销毁的。重新回到我们的 add.c 上：

简单的一个做加法的程序 - add.c

```
int add(int a, int b)
{
		int result = a + b;
		return result;
}

int main(int argc)
{
		int answer;
		answer = add(40, 2);
}
```


在运行到第 4 行时，在把 `a + b` 值赋给 `result` 后，这时发生了什么：

![](https://manybutfinite.com/img/stack/returnFromAdd.png)

第一个指令是有些多余而且有点傻的，因为我们知道 `eax` 已经等于了 `result` ，但这就是关闭优化时得到的结果。剩余的指令接着运行，这一小段做了两个任务：重置 `esp` 并将它指向到当前栈帧开始的地方，另一个是恢复在 `ebp` 中保存的值。这两个操作在逻辑上是独立的，因此，在图中将它们分开来说，但是，如果你使用一个调试器去跟踪，你就会发现它们都是自动发生的。

在运行完毕后，恢复了前一个栈帧。`add` 调用唯一留下的东西就是在栈顶部的返回地址。它包含了运行完 `add` 之后在 `main` 中的指令的地址。它带来的是 `ret` 指令：它弹出返回地址到 `eip` 寄存器（译者注：32位的指令寄存器），这个寄存器指向下一个要执行的指令。现在程序将返回到 `main` ，主要部分如下：

![](https://manybutfinite.com/img/stack/returnFromMain.png)

`main` 从 `add` 中拷贝返回值到本地变量 `answer`，然后，运行它的“谢幕仪式”，这一点和其它的函数是一样的。在 `main` 中唯一的怪异之处是，它在 `ebp` 中保存了 `null` 值，因为，在我们的代码中它是第一个栈帧。最后一步执行的是，返回到 C 运行时库（libc），它将退回到操作系统中。这里为需要的人提供了一个 [完整的返回顺序][3] 的图。

现在，你已经理解了栈是如何运作的，所以我们现在可以来看一下，一直以来最著名的黑客行为：挖掘缓冲区溢出。这是一个有漏洞的程序：

有漏洞的程序 - buffer.c

```
void doRead()
{
		char buffer[28];
		gets(buffer);
}

int main(int argc)
{
		doRead();
}
```

上面的代码中使用了 [gets][4] 从标准输入中去读取内容。`gets` 持续读取直到一个新行或者文件结束。下图是读取一个字符串之后栈的示意图：

![](https://manybutfinite.com/img/stack/bufferCopy.png)

在这里存在的问题是，`gets` 并不知道缓冲区大小：它毫无查觉地持续读取输入内容，并将读取的内容填入到栈那边的缓冲区，清除保存在 `ebp` 中的值，返回地址，下面的其它内容也是如此。对于挖掘行为，攻击者制作一个载荷片段并将它“喂”给程序。在这个时候，栈应该是下图所示的样子，然后去调用 `gets`：

![](https://manybutfinite.com/img/stack/bufferOverflowExploit.png)

基本的想法是提供一个恶意的汇编代码去运行，通过覆写栈上的返回地址指向到那个代码。这有点像病毒侵入一个细胞，颠覆它，然后引入一些 RNA 去达到它的目的。

和病毒一样，挖掘者的载荷有许多特别的功能。它从使用几个 `nop` 指令开始，以提升成功挖掘漏洞的可能性。这是因为返回的地址是一个靠猜测的且不受约束的地址，因此，攻击者并不知道保存它的代码的栈的准确位置。但是，只要它们进入一个 `nop`，这个漏洞挖掘工作就会进行：处理器将运行 `nops`，直到击中它希望去运行的指令。

exec /bin/sh 表示运行一个 shell（假设漏洞是在一个网络程序中，因此，这个漏洞可能提供一个访问系统的 shell）的原生汇编指令。将原生汇编指令嵌入到一个程序中，使程序产生一个命令窗口或者用户输入的想法是很可怕的，但是，那只是让安全研究如此有趣且“脑洞大开”的一部分而已。对于防范这个怪异的 `get`， 给你提供一个思路，有时候，在有漏洞的程序上，让它的输入转换为小写或者大写，将迫使攻击者写的汇编指令的完整字节不属于小写或者大写的 ascii 字母的范围内。

最后，攻击者重放几次猜测的返回地址，这将再次提升他们的胜算。通过从一个 4 字节的边界上多次重放，它们可能会覆写栈上的原始返回地址。

幸亏，现代操作系统有了 [防止缓冲区溢出][5] 的一系列保护措施，包括不可执行的栈和栈金丝雀（stack canaries）。这个 “金丝雀（canary）” 名字来自 [煤矿中的金丝雀（canary in a coal mine）][6] 中的表述（译者注：指在煤矿工人下井时，带一只金丝雀，因为金丝雀对煤矿中的瓦斯气体非常敏感，如果进入煤矿后，金丝雀死亡，说明瓦斯超标，矿工会立即撤出煤矿。金丝雀做为煤矿中瓦斯预警器来使用），是对丰富的计算机科学词汇的补充，用 Steve McConnell 的话解释如下：

> 计算机科学拥有比其它任何领域都丰富多彩的语言，在其它的领域中你进入一个无菌室，小心地将温度控制在 68°F，然后，能找到病毒、特洛伊木马、蠕虫、臭虫、炸弹、崩溃、爆发、扭曲的变性者、以及致命错误吗？ Steve McConnell 代码大全 2

不管怎么说，这里所谓的“栈金丝雀”应该看起来是这个样子的：

![](https://manybutfinite.com/img/stack/bufferCanary.png)

金丝雀是通过汇编来实现的。例如，由于 GCC 的 [栈保护器][7] 选项的原因使金丝雀被用于任何可能有漏洞的函数上。函数开端加载一个神奇的值到金丝雀的位置，并且在函数结束调用时确保这个值完好无损。如果这个值发生了变化，那就表示发生了一个缓冲区溢出（或者 bug），这时，程序通过 [__stack_chk_fail][8] 被终止运行。由于金丝雀处于栈的关键位置上，它使得栈缓冲区溢出的漏洞挖掘变得非常困难。

深入栈的探秘之旅结束了。我并不想过于深入。下一周我将深入递归、尾调用以及其它相关内容。或许要用到谷歌的 V8 引擎。为总结函数的开端和结束的讨论，我引述了美国国家档案馆纪念雕像上的一句名言：（what is past is prologue）

![](https://manybutfinite.com/img/stack/past-is-prologue.jpg)

--------------------------------------------------------------------------------

via:https://manybutfinite.com/post/epilogues-canaries-buffer-overflows/

作者：[Gustavo Duarte][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://duartes.org/gustavo/blog/about/
[1]:https://manybutfinite.com/post/epilogues-canaries-buffer-overflows/
[2]:https://manybutfinite.com/post/journey-to-the-stack
[3]:https://manybutfinite.com/img/stack/returnSequence.png
[4]:http://linux.die.net/man/3/gets
[5]:http://paulmakowski.wordpress.com/2011/01/25/smashing-the-stack-in-2011/
[6]:http://en.wiktionary.org/wiki/canary_in_a_coal_mine
[7]:http://gcc.gnu.org/onlinedocs/gcc-4.2.3/gcc/Optimize-Options.html
[8]:http://refspecs.linux-foundation.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/libc---stack-chk-fail-1.html