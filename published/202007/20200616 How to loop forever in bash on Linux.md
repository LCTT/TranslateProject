[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12368-1.html)
[#]: subject: (How to loop forever in bash on Linux)
[#]: via: (https://www.networkworld.com/article/3562576/how-to-loop-forever-in-bash-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 的 bash 中永远循环
======

![tine ivanic][1]

在 Linux 中有很多永远循环（或直到你决定停止）的方法，你可以在命令行或脚本中执行此操作。

`for` 和 `while` 命令使这件事非常容易。关于相应的语法和策略，只有几件事要牢记。

### 使用 while

最简单的永远循环之一是使用 `while` 命令，后面跟上条件 `true`。 你不必使用诸如 `while [ 1 -eq 1 ]` 之类的逻辑或类似的测试。 `while true` 测试表示循环将一直运行，直到你使用 `CTRL-C` 停止循环、关闭终端窗口或注销为止。这是一个例子：

```
$ while true
> do
>   echo Keep running
>   sleep 3
> done
Keep running
Keep running
Keep running
^C
```

你也可以使用 `while :` 做同样的事情。这里的关键是 `:` 总是返回成功，因此就像 `while true` 一样，此测试永远不会失败，并且循环会继续运行：

```
$ while :
> do
>   echo Keep running
>   sleep 3
> done
Keep running
Keep running
^C
```

如果你在脚本中插入了无限循环，并想提醒使用它的人如何退出脚本，那么可以使用 `echo` 命令添加提示：

```
while :
do
        echo Keep running
        echo "Press CTRL+C to exit"
        sleep 1
done
```

### 使用 for

`for` 命令还提供了一种永远循环的简便方法。虽然不如 `while true` 明显，但语法相当简单。你只需要在有界循环中替换参数即可，它通常类似于 “c 从等于 1 开始递增，直到 5”：

```
$ for (( c=1; c<=5; c++ ))
```

不指定任何参数的情况下：

```
$ for (( ; ; ))
```

没有起始值、增量或退出测试，此循环将永远运行或被强制停止：

```
$ for (( ; ; ))
> do
>    echo Keep running
>   echo “Press CTRL+C to exit”
>    sleep 2
> done
Keep your spirits up
Keep your spirits up
Keep your spirits up
```

### 为什么要永远循环？

在现实中，你不会想永远循环下去，但一直运行直到想要回家、工作完成或者遇到问题才退出并不罕见。任何构造为无限循环的循环都可以设置为根据各种情况退出。

该脚本将一直处理数据直到下午 5 点，或者说检查发现第一次超过 5 点的时间：

```
#!/bin/bash

while true
do
  if [ `date +%H` -ge 17 ]; then
    exit        # exit script
  fi
  echo keep running
  ~/bin/process_data     # do some work
done
```

如果要退出循环而不是退出脚本，请使用 `break` 命令而不是 `exit`。

```
#!/bin/bash

while true
do
  if [ `date +%H` -ge 17 ]; then
    break       # exit loop
  fi
  echo keep running
  ~/bin/process_data
done
… run other commands here …
```

### 总结

永远循环很容易。指定要停止循环的条件却需要花费一些额外的精力。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3562576/how-to-loop-forever-in-bash-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2020/06/nw_circular-staircase_loop_infinity_nautilus_by-tine-ivanic-via-unsplash-100848725-large.jpg
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
