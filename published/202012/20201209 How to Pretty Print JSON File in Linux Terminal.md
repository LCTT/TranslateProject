[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12915-1.html)
[#]: subject: (How to Pretty Print JSON File in Linux Terminal)
[#]: via: (https://itsfoss.com/pretty-print-json-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Linux 终端上漂亮地打印 JSON 文件
======

![](https://img.linux.net.cn/data/attachment/album/202012/13/122331h00a3hc63ttoc630.jpg)

[JSON][1] 文件非常棒，因为它们以人类可读的格式存储数据集合。然而，如果 JSON 文件被最小化过，那么阅读 JSON 文件可能会很痛苦。

以这个为例：

![Minified JSON is difficult to read][2]

计算机可以很容易地读取它。即使是人也能读，但如果 JSON 文件以合适的格式显示，那么阅读就会简单很多。我的意思是 JSON 文件应该是这样读的：

![Pretty Printed JSON is easier to read][3]

你可以使用大多数的文本编辑器和一些插件以合适的格式显示它。然而，如果你在终端中，或者你想在你的 shell 脚本中这么做，事情会有所不同。

如果你有一个已最小化过的 JSON 文件，让我来告诉你如何在 Linux 终端中漂亮地输出它。

### 在 Linux 中用 jq 命令漂亮地打印 JSON 文件

[jq][4] 是一个命令行 JSON 处理器。你可以用它来切分、过滤、映射和转换结构化数据。我在这里不打算详细介绍 `jq` 命令行工具的使用。

要使用 `jq`，你需要先安装它。你可以使用你的[发行版的包管理器][5]来安装它。如果启用了 [universe 仓库][6]，你可以使用 `apt` 命令在 Ubuntu 上安装它：

```
sudo apt install jq
```

安装好后，用下面的方法在显示屏上漂亮地打印 JSON 文件：

```
jq . sample.json
```

![Pretty printed JSON file][7]

你可能也想用 `cat`，但我认为 `cat` 在这里没用。

```
cat sample.json | jq
```

请记住，上述命令不会影响原始 JSON 文件。不会向它写入任何更改。

你可能已经知道[如何在 Linux 中把命令输出重定向到一个文件][8]。你可能也知道不能重定向到同一个文件，而且 `tee` 命令也不能保证一直有效。

如果你想用漂亮的格式修改原来的 JSON 文件，可以把解析后的输出结果用管道传送到一个新的文件中，然后覆盖原来的 JSON 文件。

```
jq . sample.json > pretty.json
```

![Pretty printing JSON file in Linux Terminal][9]

#### 额外技巧：用 jq 命令对 JSON 文件最小化。

让我们反过来，对一个格式良好的 JSON 文件进行最小化。要最小化 JSON 文件，你可以使用选项 `-c`。

```
jq -c < pretty.json
```

![Minified JSON file display][10]

如果你愿意，你也可以使用 `cat` 和重定向：

```
cat pretty.json | jq -c
```

### 在 Linux 中使用 Python 来漂亮地打印 JSON 文件

你更有可能是在系统中安装了 Python。如果是这样的话，你可以用它在终端漂亮地打印 JSON 文件：

```
python3 -m json.tool sample.json
```

![Pretty printing JSON with Python][11]

我知道还有其他方法可以解析 JSON 文件并以适当的格式打印出来。你可以自己去探索，但这两种方法足以完成漂亮地打印 JSON 文件的工作。

--------------------------------------------------------------------------------

via: https://itsfoss.com/pretty-print-json-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.json.org
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/print-json.png?resize=759%2C253&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-printed-json.png?resize=696%2C538&ssl=1
[4]: https://stedolan.github.io/jq/
[5]: https://itsfoss.com/package-manager/
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-print-json-linux-terminal.png?resize=750%2C557&ssl=1
[8]: https://itsfoss.com/save-command-output-to-file-linux/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-printing-json-linux-terminal.png?resize=750%2C576&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/minify-json-file-linux.png?resize=777%2C253&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-print-json-with-python.png?resize=777%2C557&ssl=1