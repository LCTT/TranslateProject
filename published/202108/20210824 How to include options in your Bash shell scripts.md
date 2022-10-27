[#]: subject: "How to include options in your Bash shell scripts"
[#]: via: "https://opensource.com/article/21/8/option-parsing-bash"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13730-1.html"

如何在 Bash shell 脚本中解析命令行选项
======

> 给你的 shell 脚本添加选项。

![](https://img.linux.net.cn/data/attachment/album/202108/29/110849lvhr1bjg1r43sfcx.jpg)

终端命令通常具有 [选项或开关][2]，用户可以使用它们来修改命令的执行方式。关于命令行界面的 [POSIX 规范][3] 中就对选项做出了规范，这也是最早的 UNIX 应用程序建立的一个由来已久的惯例，因此你在创建自己的命令时，最好知道如何将选项包含进 [Bash 脚本][4] 中。

与大多数语言一样，有若干种方法可以解决 Bash 中解析选项的问题。但直到今天，我最喜欢的方法仍然是我从 Patrick Volkerding 的 Slackware 构建脚本中学到的方法，当我第一次发现 Linux 并敢于冒险探索操作系统所附带的纯文本文件时，这些脚本就是我的 shell 脚本的引路人。

### Bash 中的选项解析

在 Bash 中解析选项的策略是循环遍历所有传递给 shell 脚本的参数，确定它们是否是一个选项，然后转向下一个参数。重复这个过程，直到没有选项为止。

```
#!/bin/bash

while [ True ]; do
if [ "$1" = "--alpha" -o "$1" = "-a" ]; then
    ALPHA=1
    shift 1
else
    break
fi
done

echo $ALPHA
```

在这段代码中，我创建了一个 `while` 循环，它会一直进行循环操作，直到处理完所有参数。`if` 语句会试着将在第一个位置（`$1`）中找到的参数与 `--alpha` 或 `-a` 匹配。（此处的待匹配项是任意选项名称，并没有特殊意义。在实际的脚本中，你可以使用 `--verbose` 和 `-v` 来触发详细输出）。

`shift` 关键字会使所有参数位移一位，这样位置 2（`$2`）的参数移动到位置 1（`$1`）。处理完所有参数后会触发 `else` 语句，进而中断 `while` 循环。

在脚本的末尾，`$ALPHA` 的值会输出到终端。

测试一下这个脚本:

```
$ bash ./test.sh --alpha
1
$ bash ./test.sh

$ bash ./test.sh -a
1
```

可以看到，选项被正确地检测到了。

### 在 Bash 中检测参数

但上面的脚本还有一个问题：多余的参数被忽略了。

```
$ bash ./test.sh --alpha foo
1
$
```

要想捕获非选项名的参数，可以将剩余的参数转储到 [Bash 数组][5] 中。

```
#!/bin/bash

while [ True ]; do
if [ "$1" = "--alpha" -o "$1" = "-a" ]; then
    ALPHA=1
    shift 1
else
    break
fi
done

echo $ALPHA

ARG=( "${@}" )
for i in ${ARG[@]}; do
    echo $i
done
```

测试一下新版的脚本：

```
$ bash ./test.sh --alpha foo
1
foo
$ bash ./test.sh foo

foo
$ bash ./test.sh --alpha foo bar
1
foo
bar
```

### 带参选项

有一些选项需要传入参数。比如，你可能希望允许用户设置诸如颜色或图形分辨率之类的属性，或者将应用程序指向自定义配置文件。

要在 Bash 中实现这一点，你仍然可以像使用布尔开关一样使用 `shift` 关键字，但参数需要位移两位而不是一位。

```
#!/bin/bash

while [ True ]; do
if [ "$1" = "--alpha" -o "$1" = "-a" ]; then
    ALPHA=1
    shift 1
elif [ "$1" = "--config" -o "$1" = "-c" ]; then
    CONFIG=$2
    shift 2
else
    break
fi
done

echo $ALPHA
echo $CONFIG

ARG=( "${@}" )

for i in ${ARG[@]}; do
    echo $i
done
```

在这段代码中，我添加了一个 `elif` 子句来将每个参数与 `--config` 和 `-c` 进行比较。如果匹配，名为 `CONFIG` 的变量的值就设置为下一个参数的值（这就表示 `--config` 选项需要一个参数）。所有参数都位移两位：其中一位是跳过 `--config` 或 `-c`，另一位是跳过其参数。与上节一样，循环重复直到没有匹配的参数。

下面是新版脚本的测试：

```
$ bash ./test.sh --config my.conf foo bar
my.conf
foo
bar
$ bash ./test.sh -a --config my.conf baz
1
my.conf
baz
```

### Bash 让选项解析变得简单

还有一些其他方法也可以解析 Bash 中的选项。你可以替换使用 `case` 语句或 `getopt` 命令。无论使用什么方法，给你的用户提供选项都是应用程序的重要功能，而 Bash 让解析选项成为了一件简单的事。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/option-parsing-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/terminal-commands_1.png?itok=Va3FdaMB (Terminal commands)
[2]: https://opensource.com/article/21/8/linux-terminal#options
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://opensource.com/downloads/bash-scripting-ebook
[5]: https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays
