eval 之源
============================================================

（LCTT 译注：本文标题 “The root of all eval” 影射著名歌曲“The root of all evil”（万恶之源））

唉，`eval` 这个函数让我爱恨交织，而且多半是后者居多。

```
$ perl -E'my $program = q[say "OH HAI"]; eval $program'
OH HAI
```

当 `eval` 函数在 Perl 6 中被重命名为 `EVAL` 时，我感到有点震惊（这要追溯到 2013 年，[在这里][2]讨论规范之后）。我一直没有从内心接受这样这样的做法。虽然这是个很好的意见，但是在这个意见上我似乎或多或少是孤独的。

理由是“这个函数真的很奇怪，所以我们应该用大写标记”。就像我们用 `BEGIN` 和其他 phaser 一样。使用 `BEGIN` 和其他 phaser，鼓励使用大写，这点我是同意的。phaser 能将程序“脱离正常控制流”。 但是 `eval` 函数并不能。（LCTT 译注： 在 Perl 6 当中，[phaser](https://docs.perl6.org/language/phasers)  是在一个特定的执行阶段中调用的代码块。）

其他大写的地方像是 .WHAT 这样的东西，它看起来像属性，但是会在编译时将代码变成完全不同的东西。因为这发生在常规情况之外，因此大写甚至是被鼓励的。

`eval` 归根到底是另一个函数。是的，这是一个潜在存在大量副作用的函数。但是那么多的标准函数都有大量的副作用。（举几个例子：`shell`、 `die`、 `exit`）你没看到有人呼吁将它们大写。

我猜有人会争论说 `eval` 是非常特别的，因为它以正常函数所没有的方式钩到编译器和运行时里面。（这也是 TimToady 在将该函数重命名的提交中的[提交消息][3]中解释的。）这是一个来自实现细节的争论，然而这并不令人满意。这也同样适用与刚才提到的那些小写函数。

雪上加霜的是，更名后 `EVAL` 也更难于使用：

```
$ perl6 -e'my $program = q[say "OH HAI"]; EVAL $program'
===SORRY!=== Error while compiling -e
EVAL is a very dangerous function!!! (use the MONKEY-SEE-NO-EVAL pragma to override this error,
but only if you're VERY sure your data contains no injection attacks)
at -e:1
------> program = q[say "OH HAI"]; EVAL $program⏏<EOL>

$ perl6 -e'use MONKEY-SEE-NO-EVAL; my $program = q[say "OH HAI"]; EVAL $program'
OH HAI
```

首先，注入攻击是一个真实的问题，并不是一个笑话。我们应该互相教育对方和新手。

其次，这个错误消息（`"EVAL is a very dangerous function!!!"`）完全是恐吓多于帮助。我觉得当我们向人们解释代码注入的危险时，我们需要冷静并且切合实际，而不是用三个感叹号。这个错误信息对[已经知道什么是注入攻击的人][4]来说是有意义的，对于那些不了解这种风险的人员，它没有提供任何提示或线索。

（Perl 6 社区并不是唯一对 `eval` 歇斯底里的，昨天我偶然发现了一个 StackOverflow 主题，关于如何将一个有类型名称的字符串转换为 JavaScript 中的相应构造函数，一些人不幸地提出了用 `eval`，而其他人立即集结起来指出这是多么不负责任，就像膝跳反射那样——“因为 eval 是坏的”）。

第三，“MOKNEY-SEE-NO-EVAL”。拜托，我们能不能不要这样……汗，启用一个核弹级的函数时，就像是猴子般的随机引用和轻率的尝试，我奇怪地发现_启用_ `EVAL` 函数的是一个称为 `NO-EVAL` 的东西。这并不符合“<ruby>最少惊喜<rt>Least Surprise</rt></ruby>”原则。

不管怎样，有一天，我意识到我可以同时解决全大写名字问题和该指令的必要问题：

```
$ perl6 -e'my &eval = &EVAL; my $program = q[say "OH HAI"]; eval $program'
OH HAI
```

我很高兴我能想到这点子并记录下来。显然我们把它改回了旧名字，这个非常危险的功能（`!!!`）就又好了。 耶！


--------------------------------------------------------------------------------

via: http://strangelyconsistent.org/blog/the-root-of-all-eval

作者：[Carl Mäsak][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://strangelyconsistent.org/about
[1]:http://strangelyconsistent.org/blog/the-root-of-all-eval
[2]:https://github.com/perl6/specs/issues/50
[3]:https://github.com/perl6/specs/commit/0b7df09ecc096eed5dc30f3dbdf568bbfd9de8f6
[4]:http://bobby-tables.com/
