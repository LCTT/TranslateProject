将 Linux 终端会话录制成 SVG 动画
======

![Banner 图](https://www.ostechnix.com/wp-content/uploads/2018/08/termtosvg-720x340.png)

录制终端会话可以满足我们不同类型的需求。通过录制终端会话，你可以完整记录你在终端中执行的操作，将其保存以供后续参考。通过录制终端会话，你还可以向青少年、学生或其它打算学习 Linux 的人展示各种 Linux 命令及其用例。值得庆幸的是，市面上已经有不少工具，可以帮助我们在类 Unix 操作系统下录制终端会话。我们已经介绍过一些可以帮助你录制终端会话的工具，可以在下面的链接中找到。

+ [如何录制你在终端中的所作所为][3]
+ [Asciinema – 录制终端会话并在网上分享][4]

今天，我们要介绍另一款录制终端操作的工具，名字叫做 **Termtosvg**。从名字可以看出，Termtosvg 将你的终端会话录制成一个单独的 SVG 动画。它是一款简单的命令行工具，使用 **Python** 语言编写，可以生成轻量级、外观整洁的动画，可以嵌入到网页项目中。Termtosvg 支持自定义<ruby>色彩主题<rt>color themes</rt></ruby>、终端 UI，还可以通过 [SVG 模板][1]完成动画控制。它兼容 asciinema 录制格式，支持 GNU/Linux，Mac OS 和 BSD 等操作系统。

### 安装 Termtosvg

PIP 是一个面向 Python 语言编写的软件包的管理器，可以用于安装 Termtosvg。如果你没有安装 PIP，可以参考下面的指导：

[如何使用 PIP 管理 Python 软件包][5]

安装 PIP 后，运行如下命令安装 Termtosvg 工具：

```
$ pip3 install --user termtosvg
```

此外，还要安装渲染终端屏幕所需的依赖包：

```
$ pip3 install pyte python-xlib svgwrite
```

安装完毕，我们接下来生成 SVG 格式的终端会话。

### 将 Linux 终端会话录制成 SVG 动画

使用 `termtosvg` 录制终端会话十分容易。打开终端窗口，运行如下命令即可开始录制：

```
$ termtosvg
```

**注意：** 如果 `termtosvg` 命令不可用，重启操作系统一次即可。

运行 `termtosvg` 命令后，可以看到如下命令输出：

```
Recording started, enter "exit" command or Control-D to end

```

你目前位于一个子 Shell 中，在这里可以像平常那样输入命令。你在终端中的所作所为都会被录制。

不妨随便输入一些命令：

```
$ mkdir mydirectory
$ cd mydirectory/
$ touch file.txt
$ cd ..
$ uname -a

```

操作完成后，使用组合键 `CTRL+D` 或者输入 `exit` 停止录制。录制结果将会保存在 `/tmp` 目录，（由于做了唯一性处理）文件名并不会重复。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Termtosvg-in-action-1-1.png)

现在，你可以在命令行运行命令，使用你的浏览器打开 SVG 文件：

```
$ firefox /tmp/termtosvg_ddkehjpu.svg
```

你也可以在（图形界面的）浏览器中直接打开这个 SVG 文件（ **File -> \<SVG 文件路径>** ）。

我用 Firefox 浏览器打开的效果如下：

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Termtosvg-in-browser.gif)

下面举例说明几种使用 Termtosvg 录制终端会话的方式。

我刚刚提到，Termtosvg 录制终端会话后默认保存成 `/tmp` 目录下的一个 SVG 动画文件。

但你可以指定 SVG 动画文件的文件名，例如 `animation.svg`；也可以指定一个存放路径，例如 `/home/sk/ostechnix/`。

```
$ termtosvg /home/sk/ostechnix/animation.svg
```

录制终端会话并使用特定模板进行渲染：

```
$ termtosvg -t ~/templates/my_template.svg
```

使用指定的<ruby>屏幕参数<rt>screen geometry</rt></ruby>录制终端会话：

```
$ termtosvg -g 80x24 animation.svg
```

使用 asciicast v2 格式录制终端会话：

```
$ termtosvg record recording.cast
```

将 asciicast 格式的录制结果渲染成 SVG 动画：

```
$ termtosvg render recording.cast animation.svg
```

欲了解更多细节，请参考 [**Termtosvg 手册**][2]。

好了，本次分享就到这里，希望对你有帮助。更多精彩内容，敬请期待！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-record-terminal-sessions-as-svg-animations-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://nbedos.github.io/termtosvg/pages/templates.html
[2]:https://github.com/nbedos/termtosvg/blob/develop/man/termtosvg.md
[3]:https://www.ostechnix.com/record-everything-terminal/
[4]:https://www.ostechnix.com/asciinema-record-terminal-sessions-share-web/
[5]:https://www.ostechnix.com/manage-python-packages-using-pip/
