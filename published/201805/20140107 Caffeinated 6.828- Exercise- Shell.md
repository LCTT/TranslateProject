Caffeinated 6.828：练习 shell
======

通过在 shell 中实现多项功能，该作业将使你更加熟悉 Unix 系统调用接口和 shell。你可以在支持 Unix API 的任何操作系统（一台 Linux Athena 机器、装有 Linux 或 Mac OS 的笔记本电脑等）上完成此作业。请在第一次上课前将你的 shell 提交到[网站][1]。

如果你在练习中遇到困难或不理解某些内容时，你不要羞于给[员工邮件列表][2]发送邮件，但我们确实希望全班的人能够自行处理这级别的 C 编程。如果你对 C 不是很熟悉，可以认为这个是你对 C 熟悉程度的检查。再说一次，如果你有任何问题，鼓励你向我们寻求帮助。

下载 xv6 shell 的[框架][3]，然后查看它。框架 shell 包含两个主要部分：解析 shell 命令并实现它们。解析器只能识别简单的 shell 命令，如下所示：

```
ls > y
cat < y | sort | uniq | wc > y1
cat y1
rm y1
ls | sort | uniq | wc
rm y
```

将这些命令剪切并粘贴到 `t.sh` 中。

你可以按如下方式编译框架 shell 的代码：

```
$ gcc sh.c
```

它会生成一个名为 `a.out` 的文件，你可以运行它：

```
$ ./a.out < t.sh
```

执行会崩溃，因为你还没有实现其中的几个功能。在本作业的其余部分中，你将实现这些功能。

### 执行简单的命令

实现简单的命令，例如：

```
$ ls
```

解析器已经为你构建了一个 `execcmd`，所以你唯一需要编写的代码是 `runcmd` 中的 case ' '。要测试你可以运行 “ls”。你可能会发现查看 `exec` 的手册页是很有用的。输入 `man 3 exec`。

你不必实现引用（即将双引号之间的文本视为单个参数）。

### I/O 重定向

实现 I/O 重定向命令，这样你可以运行：

```
echo "6.828 is cool" > x.txt
cat < x.txt
```

解析器已经识别出 '>' 和 '<'，并且为你构建了一个 `redircmd`，所以你的工作就是在 `runcmd` 中为这些符号填写缺少的代码。确保你的实现在上面的测试输入中正确运行。你可能会发现 `open`（`man 2 open`） 和 `close` 的 man 手册页很有用。

请注意，此 shell 不会像 `bash`、`tcsh`、`zsh` 或其他 UNIX shell 那样处理引号，并且你的示例文件 `x.txt` 预计包含引号。

### 实现管道

实现管道，这样你可以运行命令管道，例如：

```
$ ls | sort | uniq | wc
```

解析器已经识别出 “|”，并且为你构建了一个 `pipecmd`，所以你必须编写的唯一代码是 `runcmd` 中的 case '|'。测试你可以运行上面的管道。你可能会发现 `pipe`、`fork`、`close` 和 `dup` 的 man 手册页很有用。

现在你应该可以正确地使用以下命令：

```
$ ./a.out < t.sh
```

无论是否完成挑战任务，不要忘记将你的答案提交给[网站][1]。

### 挑战练习

如果你想进一步尝试，可以将所选的任何功能添加到你的 shell。你可以尝试以下建议之一：

* 实现由 `;` 分隔的命令列表
* 通过实现 `(` 和 `)` 来实现子 shell
* 通过支持 `＆` 和 `wait` 在后台执行命令
* 实现参数引用


所有这些都需要改变解析器和 `runcmd` 函数。

--------------------------------------------------------------------------------

via: https://sipb.mit.edu/iap/6.828/lab/shell/

作者：[mit][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://sipb.mit.edu
[1]:https://exokernel.scripts.mit.edu/submit/
[2]:mailto:sipb-iap-6.828@mit.edu
[3]:https://sipb.mit.edu/iap/6.828/files/sh.c
