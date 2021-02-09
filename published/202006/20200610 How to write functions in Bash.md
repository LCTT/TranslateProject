[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12323-1.html)
[#]: subject: (How to write functions in Bash)
[#]: via: (https://opensource.com/article/20/6/bash-functions)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在 Bash 中编写函数
======

> 通过编写函数来减少代码的冗余和维护。

![](https://img.linux.net.cn/data/attachment/album/202006/17/125913hf1efce5c48cebrc.jpg)

在编程时，实际上是在定义要由计算机执行的<ruby>过程<rt>procedure</rt></ruby>或<ruby>例程<rt>routine</rt></ruby>。一个简单的类比是将计算机编程与烤面包进行比较：你一次列出了要组建工作环境的配料，然后列出了烤面包所必须采取的步骤。在编程和烘烤中，必须以不同的间隔重复执行某些步骤。例如，在烤面包中，这可能是酵母培养的过程：

```
STIR=100
SNOOZE=86400

function feed_culture {
  remove_from(pantry)
  add(flour, water)
  stir($STIR)
  sleep($SNOOZE)
}
```

然后，揉面和醒发面团：

```
KNEAD=600
SNOOZE=7200

function process_dough {
  remove_from(proofing_drawer)
  knead($KNEAD)
  return_to_drawer($SNOOZE)
}
```

在编程中，这些<ruby>子例程<rt>subroutines</rt></ruby>可以表示为<ruby>函数<rt>function</rt></ruby>。函数对程序员很重要，因为它们有助于减少代码中的冗余，从而减少了所需的维护量。例如，在以编程方式烤制面包的假想场景中，如果你需要更改面团醒发的用时，只要你之前使用函数，那么你只需更改一次用时，或使用变量（在示例代码中为 `SNOOZE`）或直接在处理面团的子程序中更改用时。这样可以节省你很多时间，因为你不必通过你的代码库遍历每个可能正在醒发的面团，更不用说担心错过一个。许多 bug 是由未更改的缺失的值或执行不正确的 `sed` 命令引起的，它们希望捕获所有可能而不必手动寻找。

在 [Bash][2] 中，无论是在编写的脚本或在独立的文件中，定义函数和使用它们一样简单。如果将函数保存到独立的文件中。那么可以将它 `source` 到脚本中，就像 `include` C 语言或 C++ 中的库或将模块 `import` 到 Python 中一样。要创建一个 Bash 函数，请使用关键字 `function`：

```
function foo {
# code here
}
```

这是一个如何在函数中使用参数的例子（有些人为设计，因此可能会更简单）：

```
#!/usr/bin/env bash
ARG=$1

function mimic {
  if [[ -z $ARG ]]; then
    ARG='world'
  fi
  echo "hello $ARG"
}

mimic $ARG
```

结果如下：

```
$ ./mimic
hello world
$ ./mimic everybody
hello everybody
```

请注意脚本的最后一行，它会执行该函数。对于编写脚本的新手来说，这是一个普遍的困惑点：函数不会自动执行。它们作为*潜在的*例程存在，直到被调用。

如果没有调用该函数，那么函数只是被定义，并且永远不会运行。

如果你刚接触 Bash，请尝试在包含最后一行的情况下执行示例脚本一次，然后在注释掉最后一行的情况下再次执行示例脚本。

### 使用函数

即使对于简单的脚本，函数也是很重要的编程概念。你越适应函数，在面对一个不仅需要声明性的命令行，还需要更多动态的复杂问题时，你就会越容易。将通用函数保存在单独的文件中还可以节省一些工作，因为它将帮助你建立常用的程序，以便你可以在项目间重用它们。看看你的脚本习惯，看是否适合使用函数。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-functions

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/resources/what-bash
