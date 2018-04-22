使用 fc 修改历史命令
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/fc-command-720x340.png)

fc (**F**ix **C**ommands 的缩写) 是个 shell 内置命令，用于在交互式 shell 里列出、编辑和执行最近输入的命令。你可以用你喜欢的编辑器编辑最近的命令并再次执行，而不用把它们整个重新输入一遍。除了可以避免重复输入又长又复杂的命令，它对修正拼写错误来说也很有用。因为是 shell 内置命令，大多 shell 都包含它，比如 Bash 、 Zsh 、 Ksh 等。在这篇短文中，我们来学一学在 Linux 中使用 fc 命令。

### fc 命令教程及示例

**列出最近执行的命令**

执行不带参数的"fc -l"命令，它会列出最近 **16** 个命令。
```
$ fc -l
507 fish
508 fc -l
509 sudo netctl restart wlp9s0sktab
510 ls -l
511 pwd
512 uname -r
513 uname -a
514 touch ostechnix.txt
515 vi ostechnix.txt
516 echo "Welcome to OSTechNix"
517 sudo apcman -Syu
518 sudo pacman -Syu
519 more ostechnix.txt
520 wc -l ostechnix.txt
521 cat ostechnix.txt
522 clear

```

**-r** 选项用于将输出反向排序。
```
$ fc -lr

```

**-n** 选项用于隐藏行号。
```
$ fc -ln
 nano ~/.profile
 source ~/.profile
 source ~/.profile
 fc -ln
 fc -l
 sudo netctl restart wlp9s0sktab
 ls -l
 pwd
 uname -r
 uname -a
 echo "Welcome to OSTechNix"
 sudo apcman -Syu
 cat ostechnix.txt
 wc -l ostechnix.txt
 more ostechnix.txt
 clear

```

这样行号就不再显示了。

如果想以某个命令开始，只需在 **-l** 选项后面加上行号即可。比如，要显示行号 520 至最近的命令，可以这样：
```
$ fc -l 520
520 ls -l
521 pwd
522 uname -r
523 uname -a
524 echo "Welcome to OSTechNix"
525 sudo apcman -Syu
526 cat ostechnix.txt
527 wc -l ostechnix.txt
528 more ostechnix.txt
529 clear
530 fc -ln
531 fc -l

```

要列出一段范围内的命令，将始末行号作为 "fc -l" 的参数即可，比如 520 至 525：
```
$ fc -l 520 525
520 ls -l
521 pwd
522 uname -r
523 uname -a
524 echo "Welcome to OSTechNix"
525 sudo apcman -Syu

```

除了使用行号，我们还可以使用字符。比如，要列出最近一个 "pwd" 至上一个命令之间的所以命令，只需要像下面这样使用起始字母即可：
```
$ fc -l p
521 pwd
522 uname -r
523 uname -a
524 echo "Welcome to OSTechNix"
525 sudo apcman -Syu
526 cat ostechnix.txt
527 wc -l ostechnix.txt
528 more ostechnix.txt
529 clear
530 fc -ln
531 fc -l
532 fc -l 520
533 fc -l 520 525
534 fc -l 520
535 fc -l 522
536 fc -l l

```

要列出所有 "pwd" 和 "more" 之间的命令，你可以都使用起始字母，像这样：
```
$ fc -l p m

```

或者，使用开始命令的首字母以及结束命令的行号：
```
$ fc -l p 528

```

或者都使用行号：
```
$ fc -l 521 528

```

这三个命令都显示一样的结果。

**编辑并执行上一个命令**

我们经常敲错命令，这时你可以用默认编辑器修正拼写错误并执行而不用将命令重新再敲一遍。

编辑并执行上一个命令：
```
$ fc

```

这会在默认编辑器里载入上一个命令。


![][2]

你可以看到，我上一个命令是 "fc -l"。你可以随意修改，它会在你保存退出编辑器时自动执行。这在命令或参数又长又复杂时很有用。需要注意的是，它同时也可能是**毁灭性**的。比如，如果你的上一个命令是危险的 `rm -fr <some-path>`，当它自动执行时你可能丢掉你的重要数据。所以，小心谨慎对待每一个命令。

**更改默认编辑器**

另一个有用的选项是 **-e** ，它可以用来为 fc 命令选择不同的编辑器。比如，如果我们想用 "nano" 来编辑上一个命令:
```
$ fc -e nano

```

这个命令会打开 nano 编辑器（而不是默认编辑器）编辑上一个命令。

![][3]

如果你觉得用 **-e** 选项太麻烦，你可以修改你的默认编辑器，只需要将环境变量 **FCEDIT** 设为你想要让 **fc** 使用的编辑器名称即可。

比如，要把 "nano" 设为默认编辑器，编辑你的 **~/.profile** 或其他初始化文件： ( LCTT 译注：如果 ~/.profile 不存在可自己创建；如果使用的是 bash ，可以编辑 ~/.bash_profile )
```
$ vi ~/.profile

```

添加下面一行：
```
FCEDIT=nano
# ( LCTT译注：如果在子 shell 中会用到 fc ，最好在这里 `export FCEDIT` )

```

你也可以使用编辑器的完整路径：
```
FCEDIT=/usr/local/bin/emacs

```

输入 **:wq** 保存退出。要使改动立即生效，运行以下命令：
```
$ source ~/.profile

```

现在再输入 "fc" 就可以使用 "nano" 编辑器来编辑上一个命令了。

**不编辑而直接执行上一个命令**

我们现在知道 "fc" 命令不带任何参数的话会将上一个命令载入编辑器。但有时你可能不想编辑，仅仅是想再次执行上一个命令。这很简单，在末尾加上连字符(-)就可以了：
```
$ echo "Welcome to OSTechNix"
Welcome to OSTechNix

$ fc -e -
echo "Welcome to OSTechNix"
Welcome to OSTechNix

```

如你所见，"fc" 带了 **-e** 选项，但并没有编辑上一个命令（例中的 echo " Welcome to OSTechNix"）。

需要注意的是，有些选项仅对指定 shell 有效。比如下面这些选项可以用在 **zsh** 中，但在 Bash 或 Ksh 中则不能用。

**显示命令的执行时间**

想要知道命令是在什么时候执行的，可以用 **-d** 选项：
```
fc -ld
1 18:41 exit
2 18:41 clear
3 18:42 fc -l
4 18:42 sudo netctl restart wlp9s0sktab
5 18:42 ls -l
6 18:42 pwd
7 18:42 uname -r
8 18:43 uname -a
9 18:43 cat ostechnix.txt
10 18:43 echo "Welcome to OSTechNix"
11 18:43 more ostechnix.txt
12 18:43 wc -l ostechnix.txt
13 18:43 cat ostechnix.txt
14 18:43 clear
15 18:43 fc -l

```

这样你就可以查看最近命令的具体执行时间了。

使用选项 **-f** ，可以为每个命令显示完整的时间戳。
```
 fc -lf
 1 4/5/2018 18:41 exit
 2 4/5/2018 18:41 clear
 3 4/5/2018 18:42 fc -l
 4 4/5/2018 18:42 sudo netctl restart wlp9s0sktab
 5 4/5/2018 18:42 ls -l
 6 4/5/2018 18:42 pwd
 7 4/5/2018 18:42 uname -r
 8 4/5/2018 18:43 uname -a
 9 4/5/2018 18:43 cat ostechnix.txt
 10 4/5/2018 18:43 echo "Welcome to OSTechNix"
 11 4/5/2018 18:43 more ostechnix.txt
 12 4/5/2018 18:43 wc -l ostechnix.txt
 13 4/5/2018 18:43 cat ostechnix.txt
 14 4/5/2018 18:43 clear
 15 4/5/2018 18:43 fc -l
 16 4/5/2018 18:43 fc -ld

```

当然，欧洲的老乡们还可以使用 **-E** 选项来显示欧洲时间格式。
```
 fc -lE
 2 5.4.2018 18:41 clear
 3 5.4.2018 18:42 fc -l
 4 5.4.2018 18:42 sudo netctl restart wlp9s0sktab
 5 5.4.2018 18:42 ls -l
 6 5.4.2018 18:42 pwd
 7 5.4.2018 18:42 uname -r
 8 5.4.2018 18:43 uname -a
 9 5.4.2018 18:43 cat ostechnix.txt
 10 5.4.2018 18:43 echo "Welcome to OSTechNix"
 11 5.4.2018 18:43 more ostechnix.txt
 12 5.4.2018 18:43 wc -l ostechnix.txt
 13 5.4.2018 18:43 cat ostechnix.txt
 14 5.4.2018 18:43 clear
 15 5.4.2018 18:43 fc -l
 16 5.4.2018 18:43 fc -ld
 17 5.4.2018 18:49 fc -lf

```

### fc 用法总结

  * 当不带任何参数时，fc 将上一个命令载入默认编辑器。
  * 当带一个数字作为参数时，fc 将数字指定的命令载入默认编辑器。
  * 当带一个字符作为参数时，fc 将最近一个以指定字符开头的命令载入默认编辑器。
  * 当有两个参数时，它们分别指定需要列出的命令范围的开始和结束。



更多细节，请参考 man 手册。
```
$ man fc

```

好了，今天就这些。希望这篇文章能帮助到你。更多精彩内容，敬请期待！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-fc-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
译者：[Dotcra](https://github.com/Dotcra)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/04/fc-command-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/04/fc-command-2.png
