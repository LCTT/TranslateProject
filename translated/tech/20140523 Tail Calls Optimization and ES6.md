#[尾调用，优化，和 ES6][1]


在探秘“栈”的倒数第二篇文章中，我们提到了**尾调用**、编译优化、以及新发布的 JavaScript 上*特有的*尾调用。

当一个函数 F 调用另一个函数作为它的结束动作时，就发生了一个**尾调用**。在那个时间点，函数 F 绝对不会有多余的工作：函数 F 将“球”传给被它调用的任意函数之后，它自己就“消失”了。这就是关键点，因为它打开了尾调用优化的“可能之门”：我们可以简单地重用函数 F 的栈帧，而不是为函数调用 [创建一个新的栈帧][6]，因此节省了栈空间并且避免了新建一个栈帧所需要的工作量。下面是一个用 C 写的简单示例，然后使用 [mild 优化][7] 来编译它的结果：

简单的尾调用 [下载][2]

```
int add5(int a)
{
	return a + 5;
}

int add10(int a)
{
	int b = add5(a); // not tail
	return add5(b); // tail
}

int add5AndTriple(int a){
	int b = add5(a); // not tail
	return 3 * add5(a); // not tail, doing work after the call
}

int finicky(int a){
	if (a > 10){
		return add5AndTriple(a); // tail
	}

	if (a > 5){
		int b = add5(a); // not tail
		return finicky(b); // tail
	}

	return add10(a); // tail
}
```

在编译器的输出中，在预期会有一个 [调用][9] 的地方，你可以看到一个 [跳转][8] 指令，一般情况下你可以发现尾调用优化（以下简称 TCO）。在运行时中，TCO 将会引起调用栈的减少。

一个通常认为的错误观念是，尾调用必须要 [递归][10]。实际上并不是这样的：一个尾调用可以被递归，比如在上面的 `finicky()` 中，但是，并不是必须要使用递归的。在调用点只要函数 F 完成它的调用，我们将得到一个单独的尾调用。是否能够进行优化这是一个另外的问题，它取决于你的编程环境。

“是的，它总是可以！”，这是我们所希望的最佳答案，它是在这个结构下这个案例最好的结果，就像是，在 [SICP][11]（顺便说一声，如果你的程序不像“一个魔法师使用你的咒语召唤你的电脑精灵”那般有效，建议你读一下那本书）上所讨论的那样。它是 [Lua][12] 的案例。而更重要的是，它是下一个版本的 JavaScript —— ES6 的案例，这个规范定义了[尾的位置][13]，并且明确了优化所需要的几个条件，比如，[严格模式][14]。当一个编程语言保证可用 TCO 时，它将支持特有的尾调用。

现在，我们中的一些人不能抛开那些 C 的习惯，心脏出血，等等，而答案是一个更复杂的“有时候（sometimes）”，它将我们带进了编译优化的领域。我们看一下上面的那个 [简单示例][15]；把我们 [上篇文章][16] 的阶乘程序重新拿出来：

递归阶乘 [下载][3]

```
#include  <stdio.h>

int factorial(int n)
{
	int previous = 0xdeadbeef;

	if (n == 0 || n == 1) {
    	return 1;
    }

	previous = factorial(n-1);
    return n * previous;
}

int main(int argc)
{
	int answer = factorial(5);
    printf("%d\n", answer);
}
```

像第 11 行那样的，是尾调用吗？答案是：“不是”，因为它被后面的 n 相乘了。但是，如果你不去优化它，GCC 使用 [O2 优化][18] 的 [结果][17] 会让你震惊：它不仅将阶乘转换为一个 [无递归循环][19]，而且 `factorial(5)` 调用被消除了，以一个 120 (5! == 120) 的 [编译时常数][20]来替换。这就是调试优化代码有时会很难的原因。好的方面是，如果你调用这个函数，它将使用一个单个的栈帧，而不会去考虑 n 的初始值。编译算法是非常有趣的，如果你对它感兴趣，我建议你去阅读 [构建一个优化编译器][21] 和 [ACDI][22]。

但是，这里**没有**做尾调用优化时到底发生了什么？通过分析函数的功能和无需优化的递归发现，GCC 比我们更聪明，因为一开始就没有使用尾调用。由于过于简单以及很确定的操作，这个任务变得很简单。我们给它增加一些可以引起混乱的东西（比如，getpid()），我们给 GCC 增加难度：

递归 PID 阶乘 [下载][4]

```
#include <stdio.h> 
#include <sys/types.h>
#include <unistd.h>

int pidFactorial(int n)
{
	if (1 == n) {
		return getpid(); // tail
	}

	return n * pidFactorial(n-1) * getpid(); // not tail
}

int main(int argc)
{
	int answer = pidFactorial(5);
	printf("%d\n", answer);
}
```

优化它，unix 精灵！现在，我们有了一个常规的 [递归调用][23] 并且这个函数分配 O(n) 栈帧来完成工作。GCC 在递归的基础上仍然 [为 getpid 使用了 TCO][24]。如果我们现在希望让这个函数尾调用递归，我需要稍微变一下：

tailPidFactorial.c [下载][5]

```
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int tailPidFactorial(int n, int acc)
{
	if (1 == n) {
		return acc * getpid(); // not tail
	}
	
	acc = (acc * getpid() * n);
	return tailPidFactorial(n-1, acc); // tail
}

int main(int argc)
{
	int answer = tailPidFactorial(5, 1);
	printf("%d\n", answer);
}
```

现在，结果的累加是 [一个循环][25]，并且我们获得了真实的 TCO。但是，在你庆祝之前，我们能说一下关于在 C 中的一般案例吗？不幸的是，虽然优秀的 C 编译器在大多数情况下都可以实现 TCO，但是，在一些情况下它们仍然做不到。例如，正如我们在 [函数开端][26] 中所看到的那样，函数调用者在使用一个标准的 C 调用规则调用一个函数之后，它要负责去清理栈。因此，如果函数 F 带了两个参数，它只能使 TCO 调用的函数使用两个或者更少的参数。这是 TCO 的众多限制之一。Mark Probst 写了一篇非常好的论文，他们讨论了 [在 C 中正确使用尾递归][27]，在这篇论文中他们讨论了这些属于 C 栈行为的问题。他也演示一些 [疯狂的、很酷的欺骗方法][28]。

“有时候” 对于任何一种关系来说都是不坚定的，因此，在 C 中你不能依赖 TCO。它是一个在某些地方可以或者某些地方不可以的离散型优化，而不是像特有的尾调用一样的编程语言的特性，在实践中，可以使用编译器来优化绝大部分的案例。但是，如果你想必须要实现 TCO，比如将架构编译转换进 C，你将会 [很痛苦][29]。

因为 JavaScript 现在是非常流行的转换对象，特有的尾调用在那里尤其重要。因此，从 kudos 到 ES6 的同时，还提供了许多其它的重大改进。它就像 JS 程序员的圣诞节一样。

这就是尾调用和编译优化的简短结论。感谢你的阅读，下次再见！

--------------------------------------------------------------------------------

via:https://manybutfinite.com/post/tail-calls-optimization-es6/

作者：[Gustavo Duarte][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://duartes.org/gustavo/blog/about/
[1]:https://manybutfinite.com/post/tail-calls-optimization-es6/
[2]:https://manybutfinite.com/code/x86-stack/tail.c
[3]:https://manybutfinite.com/code/x86-stack/factorial.c
[4]:https://manybutfinite.com/code/x86-stack/pidFactorial.c
[5]:https://manybutfinite.com/code/x86-stack/tailPidFactorial.c
[6]:https://manybutfinite.com/post/journey-to-the-stack
[7]:https://github.com/gduarte/blog/blob/master/code/x86-stack/asm-tco.sh
[8]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tail-tco.s#L27
[9]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tail.s#L37-L39
[10]:https://manybutfinite.com/post/recursion/
[11]:http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html
[12]:http://www.lua.org/pil/6.3.html
[13]:https://people.mozilla.org/~jorendorff/es6-draft.html#sec-tail-position-calls
[14]:https://people.mozilla.org/~jorendorff/es6-draft.html#sec-strict-mode-code
[15]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tail.c
[16]:https://manybutfinite.com/post/recursion/
[17]:https://github.com/gduarte/blog/blob/master/code/x86-stack/factorial-o2.s
[18]:https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
[19]:https://github.com/gduarte/blog/blob/master/code/x86-stack/factorial-o2.s#L16-L19
[20]:https://github.com/gduarte/blog/blob/master/code/x86-stack/factorial-o2.s#L38
[21]:http://www.amazon.com/Building-Optimizing-Compiler-Bob-Morgan-ebook/dp/B008COCE9G/
[22]:http://www.amazon.com/Advanced-Compiler-Design-Implementation-Muchnick-ebook/dp/B003VM7GGK/
[23]:https://github.com/gduarte/blog/blob/master/code/x86-stack/pidFactorial-o2.s#L20
[24]:https://github.com/gduarte/blog/blob/master/code/x86-stack/pidFactorial-o2.s#L43
[25]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tailPidFactorial-o2.s#L22-L27
[26]:https://manybutfinite.com/post/epilogues-canaries-buffer-overflows/
[27]:http://www.complang.tuwien.ac.at/schani/diplarb.ps
[28]:http://www.complang.tuwien.ac.at/schani/jugglevids/index.html
[29]:http://en.wikipedia.org/wiki/Tail_call#Through_trampolining