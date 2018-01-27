修复 Linux / Unix / OS X / BSD 系统控制台上的显示乱码
======

有时我的探索会在屏幕上输出一些奇怪的东西。比如，有一次我不小心用 `cat` 命令查看了一下二进制文件的内容 —— `cat /sbin/*`。这种情况下你将无法再访问终端里的 bash/ksh/zsh 了。大量的奇怪字符充斥了你的终端。这些字符会隐藏你输入的内容和要显示的字符，取而代之的是一些奇怪的符号。要清理掉这些屏幕上的垃圾可以使用以下方法。本文就将向你描述在 Linux/ 类 Unix 系统中如何真正清理终端屏幕或者重置终端。

### clear 命令

`clear` 命令会清理掉屏幕内容，连带它的回滚缓存区一起也会被清理掉。（LCTT 译注：这种情况下你输入的字符回显也是乱码，不必担心，正确输入后回车即可生效。）

```
$ clear
```

你也可以按下 `CTRL+L` 来清理屏幕。然而，`clear` 命令并不会清理掉终端屏幕（LCTT 译注：这句话比较难理解，应该是指的运行 `clear` 命令并不是真正的把以前显示的内容删掉，你还是可以通过向上翻页看到之前显示的内容）。使用下面的方法才可以真正地清空终端，使你的终端恢复正常。

### 使用 reset 命令修复显示

下面图片中，控制台的屏幕上充满了垃圾信息：

[![Fig.01：Bash fix the display][1]][2]

要修复正常显示，只需要输入 `reset` 命令。它会为你再初始化一次终端：

```
$ reset
```

或者：

```
$ tput reset
```

如果 `reset` 命令还不行，那么输入下面命令来让绘画回复到正常状态：

```
$ stty sane
```

按下 `CTRL + L` 来清理屏幕（或者输入 `clear` 命令）：

```
$ clear
```

### 使用 ANSI 转义序列来真正地清空 bash 终端

另一种选择是输入下面的 ANSI 转义序列：

```
clear
echo -e "\033c"
```

下面是这两个命令的输出示例：

[![Animated gif 01：Fix Unix Console Gibberish Command Demo][3]][4]

更多信息请阅读 `stty` 和 `reset` 的 man 页： stty(1)，reset(1)，bash(1)。


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/bash-fix-the-display.html

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/tips/2006/08/bash-fix-terminal.png
[2]:https://www.cyberciti.biz/media/uploads/tips/2006/08/bash-fix-terminal.png
[3]:https://www.cyberciti.biz/media/new/tips/2006/08/unix-linux-console-gibberish.gif
[4]:https://www.cyberciti.biz/tips/bash-fix-the-display.html/unix-linux-console-gibberish
