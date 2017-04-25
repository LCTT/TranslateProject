[eval 之根][1]
============================================================

唉，`eval` 这个函数我又爱又恨。多数是后者。

```
$ perl -E'my $program = q[say "OH HAI"]; eval $program'
OH HAI
```

当 `eval` 函数在 Perl 6 中被重命名为 `EVAL` 时，我感到有点震惊（回到 2013 年，[在这][2]讨论规范之后）。我从未对这样做的理由感到非常舒服。虽然这是个很好的意见，但是在这个意见上我似乎或多或少是孤独的。

理由是“这个函数真的很奇怪，所以我们应该用大写标记”。就像我们用 `BEGIN` 和其他 phaser 一样。使用 `BEGIN` 和其他 phaser，鼓励使用大写，这点我是同意的。phaser 能将程序“脱离正常控制流”。 但是 `eval` 函数并不能。

其他大写的地方像是 .WHAT 这样的东西，它看起来像属性，但是会在编译时将代码变成完全不同的东西。因为有常规之外的情况发生，因此大写甚至是被鼓励的。

`eval` 归根到底是另一个函数。是的，这是一个潜在大量副作用的函数。但是大量标准功能都有大量的副作用。（举几个例子：`shell`、 `die`、 `exit`）你没看到有人呼吁将它们大写。

我猜有人会争论说 `eval` ”是非常特别的，因为它以正常函数没有的方式 hook 到编译器和运行时。（这也是 TimToady 在将函数重命名的提交中的[提交消息][3]中解释的。）这位是一个来自实现细节的争论，然而这并不令人满意。这也同样适用与刚才提到的那些小写函数。

为了增加冒犯性的伤害，更名后 “EVAL” 也故意这么做：

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

其次，这个错误消息（`"EVAL is a very dangerous function!!!"`）以最明显的方式提示这会有危害而不是帮助。我相信当我们向人们解释代码注入的危险时，我们需要冷静并且切合实际。不用三个感叹号。错误信息对[已经知道注入攻击的人][4]来说是有意义的，对于那些不了解风险的人员，它不会提供任何提示或线索。

（Perl 6 社区并不是唯一对 `eval` 歇斯底里的，昨天我偶然发现了一个 StackOverflow 主题，关于如何将一个有类型名称的字符串转换为 JavaScript 中的相应构造函数，一些人不幸地提出了用 `eval`，而其他人立即集结起来指出这是多么不负责任，就像膝跳反射那样 “因为 eval 是坏的”）。

第三，“MOKNEY-SEE-NO-EVAL”。拜托，我们能不能不要这样。。。😓 在打开一个强力函数时，只是随机引用了猴子以及轻率的尝试，我奇怪地发现_启用_ `EVAL` 函数的是一个称为 `NO-EVAL` 的东西。这不是一个惊喜。

不管怎样，有一天，我意识到我可以同时解决名字问题和实用性问题：

```
$ perl6 -e'my &eval = &EVAL; my $program = q[say "OH HAI"]; eval $program'
OH HAI
```

我很高兴我意识到这点并记录下来。显然这个非常危险的功能（`!!!`）如果我们把它的旧名字改回来，那也是好的。 😜

--------------------------------------------------------------------------------

via: http://strangelyconsistent.org/blog/the-root-of-all-eval

作者：[Carl Mäsak ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://strangelyconsistent.org/about
[1]:http://strangelyconsistent.org/blog/the-root-of-all-eval
[2]:https://github.com/perl6/specs/issues/50
[3]:https://github.com/perl6/specs/commit/0b7df09ecc096eed5dc30f3dbdf568bbfd9de8f6
[4]:http://bobby-tables.com/
