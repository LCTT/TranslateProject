[HaitaoBio](https://github.com/HaitaoBio) translating...

Linux 命令行工具使用小贴士及技巧 3 - 环境变量 CDPATH
============================================================

### 文章导航

1.  [The CDPATH environment variable 环境变量 CDPATH ][1]
2.  [Points to keep in mind 要点][2]
3.  [Conclusion 总结][3]

在这个系列的第一部分，我们详细地讨论了 `cd -` 命令，并且在第二部分，我们深入探究了 `pushd` 和 `popd` 两个命令

继续对命令行的讨论，在这篇教程中，我们将会通过简单易懂的实例来讨论 `CDPATH` 这个环境变量。我们也会讨论关于此变量的一些进阶细节。

_在这之前，先声明一下此教程中的所有实例都已经在 Ubuntu 14.04 和 4.3.11(1) 版本的 Bash 下测试过。_

### 环境变量 CDPATH

即使你的命令行在特定的目录下 - 但也必须在切换目录时提供绝对路径。比如，在 _/home/himanshu/Downloads_ 目录下确认当前的目录位置:

```sh
$ pwd
/home/himanshu/Downloads
```

要切换至 _/home/himanshu/Desktop_ 目录，我一般会这样做:

```sh
cd /home/himanshu/Desktop/
```
或者
```sh
cd ~/Desktop/
```
或者
```sh
cd ../Desktop/
```

能不能只是运行以下命令就能简单地实现呢:
```sh
cd Desktop
```

是的，这完全有可能。这就是环境变量 `CDPATH` 出现的时候了。你可使用这个变量来为 `cd` 命令定义基础目录。

如果你想尝试打印它的值，你会看见这个环境变量默认是空值的:

```sh
$ echo $CDPATH
$
```

现在 ，考虑到已经详细地对它进行了讨论，接着让我们定义这个环境变量为 _/home/himanshu_，作为 `cd` 命令的基础目录来使用把。

最简单的做法时这样:

```sh
export CDPATH=/home/himanshu
```

现在，我能做到之前所不能做到的事了 - 当前工作目录在 _/home/himanshu/Downloads_ 目录里时，成功地运行了 `cd Desktop` 命令。

```sh
$ pwd
/home/himanshu/Downloads
$ cd Desktop/
/home/himanshu/Desktop
$
```

这表明了我可以使用 `cd` 命令来到达 _`/home/himanshu`_ 下的任意一个目录，而不需要在 `cd ` 命令中显式地指定 _`/home/himanshu`_ 或者 _`~`_，又或者是 _`../`_ (或者多个 _`../`_)。

### 要点

现在你应该知道是怎样利用环境变量 CDPATH 来简易地在 _/home/himanshu/Downloads_ 和 _/home/himanshu/Desktop_ 之间切换。现在，考虑以下这种情况， 在 _/home/himanshu/Desktop_ 目录里包含一个名字叫做 _Downloads_ 的子目录，这是之后将要切换到的目录。

但突然你会意识到 _cd Desktop_ 会切换到 _/home/himanshu/Desktop_。所以，为了确保这不会发生，你可以这样做:

```sh
cd ./Downloads
```

当上述的命令执行没有问题时，就会带来额外的效果( 无论这有多大 )，特别是考虑到你在类似的情况发生时必须这样做。所以，有一个更加优雅的解决方案来处理，就是以如下方式来设定 `CDPATH` 环境变量。

```sh
export CDPATH=".:/home/himanshu"
```

这意味这你在告诉 `cd` 命令先在当前的工作目录查找该目录，然后再尝试搜寻 _/home/himanshu_ 目录。当然， `cd` 命令是否以这样的方式运行，完全取决于你的偏好和要求 - 我在这个讨论下的提起这些是为了让你知道这种情况也有可能发生。

就如你现在所知道的，一旦环境变量 `CDPATH` 被设置，它的值 - 或者它所包含的路径集合 - 就是系统中给 `cd` 命令搜索目录的地方 ( 除了包含了你所使用的绝对路径 )

继续说，如果一个 bash 脚本以相对路径使用 `cd` 命令的话，最好还是先清除或者重置环境变量 `CDPATH`,除非你觉得遇上不可预测的麻烦也无所谓。还有一个可选的方法，比起在终端使用 `export` 命令来设置 `CDPATH`，你可以在测试完交互式/非交互式 shell 之后，在你的 `.bashrc` 文件里设置环境变量，这样可以确保你对环境变量的改动只对交互式 shell 生效。

环境变量中，路径出现的顺序同样也是很重要。举个例子，如果当前目录是在 _/home/himanshu_ 目录之前列出来，`cd` 命令就会先搜索当前的工作目录然后才会移动到 _/home/himanshu_ 目录。然而，如果该值为 _"/home/himanshu:."_，搜索就首先从 _/home/himanshu_ 开始，然后到当前目录。不必要地说一句，这会影响 `cd` 命令的行为，并且不注意路径的顺序可能会导致一些麻烦。

要牢记在心的是，环境变量 `CDPATH`，就像其名字表达的，只对 `cd` 命令有作用。意味着在 _/home/himanshu/Downloads_ 目录里面时，你能运行 `_cd Desktop_` 命令来切换到 _/home/himanshu/Desktop_ 目录，当你不能使用 `ls`。以下是一个例子:

```sh
$ pwd
/home/himanshu/Downloads
$ ls Desktop
ls: cannot access Desktop: No such file or directory
$
```

然而，这还是有点用处的。例如，我们可以用以下方式来便捷地打包文件:

```sh
$ cd Desktop/;ls
/home/himanshu/Desktop
backup backup~ Downloads gdb.html outline~ outline.txt outline.txt~
```

好了，这样就能在任何情况下运行了。

另一个重点是: 就像你观察到的，无论你使用 `CDPATH` 环境变量集来运行 `cd` 命令，该命令都会在输出里产生你切换到的目录的完整路径。顺带一说，不是所有人都想在每次运行 `cd` 命令时都看到这些信息。

为了确保输出能偶被制止，你可以使用以下命令:

```sh
alias cd='>/dev/null cd'
```
无论 `cd` 命令是否运行成功，上述的命令的不会输出任何东西，但无论命令是否失败都能允许产生错误信息。

最后，假如你遇到设置 CDPATH 环境变量后忘记其值，你不应该使用 shell 的 tab 自动补全功能，应该尝试安装并启动 bash 自动补全( bash-completion )。更多请参考 [here][4]。

### 总结

`CDPATH` 环境变量时一把双刃剑，如果没有掌握完善的知识和不注意地使用，会令你陷入困境，并花费你大量宝贵时间去解决问题。当然，这不代表你不应该试一下；如果你决定要使用 `CDPATH` 时，只需要了解一下所有的可用选项，就会带来很大的帮助，然后继续使用它。

你已经能够熟练地使用 `CDPATH` 了吗，你有更多的贴士要分享？请在评论区里发表一下你的想法吧。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/

作者：[Ansh][a]
译者：[HaitaoBio](https://github.com/HaitaoBio)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/
[1]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/#the-cdpath-environment-variable
[2]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/#points-to-keep-in-mind
[3]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/#conclusion
[4]:http://bash-completion.alioth.debian.org/
