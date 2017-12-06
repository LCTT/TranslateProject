如何在 Linux 系统里用 Scrot 截屏
============================================================

最近，我们介绍过 [gnome-screenshot][17] 工具，这是一个很优秀的屏幕抓取工具。但如果你想找一个在命令行运行的更好用的截屏工具，你一定要试试 Scrot。这个工具有一些 gnome-screenshot 没有的独特功能。在这篇文章里，我们会通过简单易懂的例子来详细介绍 Scrot。

请注意一下，这篇文章里的所有例子都在 Ubuntu 16.04 LTS 上测试过，我们用的 scrot 版本是 0.8。

### 关于 Scrot

[Scrot][18] （**SCR**eensh**OT**） 是一个屏幕抓取工具，使用 imlib2 库来获取和保存图片。由 Tom Gilbert 用 C 语言开发完成，通过 BSD 协议授权。

### 安装 Scrot

scort 工具可能在你的 Ubuntu 系统里预装了，不过如果没有的话，你可以用下面的命令安装：

```
sudo apt-get install scrot
```

安装完成后，你可以通过下面的命令来使用：

```
scrot [options] [filename]
```

**注意**：方括号里的参数是可选的。

### Scrot 的使用和特点

在这个小节里，我们会介绍如何使用 Scrot 工具，以及它的所有功能。

如果不带任何选项执行命令，它会抓取整个屏幕。

[
 ![使用 Scrot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/scrot.png) 
][19]

默认情况下，抓取的截图会用带时间戳的文件名保存到当前目录下，不过你也可以在运行命令时指定截图文件名。比如：

```
scrot [image-name].png
```

### 获取程序版本

你想的话，可以用 `-v` 选项来查看 scrot 的版本。

```
scrot -v
```

这是例子：

[
 ![获取 scrot 版本](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/version.png) 
][20]

### 抓取当前窗口

这个工具可以限制抓取当前的焦点窗口。这个功能可以通过 `-u` 选项打开。

```
scrot -u
```
例如，这是我在命令行执行上边命令时的桌面：

[
 ![用 scrot 截取窗口](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/desktop.png) 
][21]

这是另一张用 scrot 抓取的截图：

[
 ![用 scrot 抓取的图片](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/active.png) 
][22]

### 抓取选定窗口

这个工具还可以让你抓取任意用鼠标点击的窗口。这个功能可以用 `-s` 选项打开。

```
scrot -s
```

例如，在下面的截图里你可以看到，我有两个互相重叠的终端窗口。我在上层的窗口里执行上面的命令。

[
 ![选择窗口](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/select1.png) 
][23]

现在假如我想抓取下层的终端窗口。这样我只要在执行命令后点击窗口就可以了 —— 在你用鼠标点击之前，命令的执行不会结束。

这是我点击了下层终端窗口后的截图：

[
 ![窗口截图](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/select2.png) 
][24]

**注意**：你可以在上面的截图里看到，下层终端窗口的整个显示区域都被抓去下来了，甚至包括了上层窗口的部分叠加内容。

### 在截屏时包含窗口边框

我们之前介绍的 `-u` 选项在截屏时不会包含窗口边框。不过，需要的话你也可以在截屏时包含窗口边框。这个功能可以通过 `-b` 选项打开（当然要和 `-u` 选项一起）。

```
scrot -ub
```

下面是示例截图：

[
 ![截屏时包含窗口边框](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/border-new.png) 
][25]

**注意**：截屏时包含窗口边框同时也会增加一点额外的背景。

### 延时截屏

你可以在开始截屏时增加一点延时。需要在 `--delay` 或 `-d` 选项后设定一个时间值参数。

```
scrot --delay [NUM]

scrot --delay 5
```

例如：

[
 ![延时截屏](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/delay.png) 
][26]

在这例子里，scrot 会等待 5 秒再截屏。

### 截屏前倒数

这个工具也可以在你使用延时功能后显示一个倒计时。这个功能可以通过 `-c` 选项打开。

```
scrot –delay [NUM] -c

scrot -d 5 -c
```

下面是示例截图：

[
 ![延时截屏示例](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/countdown.png) 
][27]

### 图片质量

你可以使用这个工具来调整截图的图片质量，范围是 1-100 之间。较大的值意味着更大的文件大小以及更低的压缩率。默认值是 75，不过最终效果根据选择的文件类型也会有一些差异。

这个功能可以通过 `--quality` 或 `-q` 选项打开，但是你必须提供一个 1 - 100 之间的数值作为参数。

```
scrot –quality [NUM]

scrot –quality 10
```

下面是示例截图：

[
 ![截屏质量](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/img-quality.jpg) 
][28]

你可以看到，`-q` 选项的参数更靠近 1 让图片质量下降了很多。

### 生成缩略图

scort 工具还可以生成截屏的缩略图。这个功能可以通过 `--thumb` 选项打开。这个选项也需要一个 NUM 数值作为参数，基本上是指定原图大小的百分比。

```
scrot --thumb NUM

scrot --thumb 50
```

**注意**：加上 `--thumb` 选项也会同时保存原始截图文件。

例如，下面是我测试的原始截图：

[
 ![原始截图](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/orig.png) 
][29]

下面是保存的缩略图：

[
 ![截图缩略图](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/thmb.png) 
][30]

### 拼接多显示器截屏

如果你的电脑接了多个显示设备，你可以用 scort 抓取并拼接这些显示设备的截图。这个功能可以通过 `-m` 选项打开。

```
scrot -m
```

下面是示例截图：

[
 ![拼接截屏](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/multiple.png) 
][31]

### 在保存截图后执行操作

使用这个工具，你可以在保存截图后执行各种操作 —— 例如，用像 gThumb 这样的图片编辑器打开截图。这个功能可以通过 `-e` 选项打开。下面是例子：

```
scrot abc.png -e 'gthumb abc.png'
```

这个命令里的 gthumb 是一个图片编辑器，上面的命令在执行后会自动打开。

下面是命令的截图：

[
 ![截屏后执行命令](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/exec1.png) 
][32]

这个是上面命令执行后的效果：

[
 ![示例截图](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/exec2.png) 
][33]

你可以看到 scrot 抓取了屏幕截图，然后再启动了 gThumb 图片编辑器打开刚才保存的截图图片。

如果你截图时没有指定文件名，截图将会用带有时间戳的文件名保存到当前目录 —— 这是 scrot 的默认设定，我们前面已经说过。

下面是一个使用默认名字并且加上 `-e` 选项来截图的例子：

```
scrot -e 'gthumb $n'
```

[
 ![scrot 截屏后运行 gthumb](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/exec3.png) 
][34]

有个地方要注意的是 `$n` 是一个特殊字符串，用来获取当前截图的文件名。关于特殊字符串的更多细节，请继续看下个小节。

### 特殊字符串

scrot 的 `-e`（或 `--exec`）选项和文件名参数可以使用格式说明符。有两种类型格式。第一种是以 `%` 加字母组成，用来表示日期和时间，第二种以 `$` 开头，scrot 内部使用。

下面介绍几个 `--exec` 和文件名参数接受的说明符。

`$f` – 让你可以使用截图的全路径（包括文件名）。

例如：

```
scrot ashu.jpg -e ‘mv $f ~/Pictures/Scrot/ashish/’
```

下面是示例截图：

[
 ![示例](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/f.png) 
][35]

如果你没有指定文件名，scrot 默认会用日期格式的文件名保存截图。这个是 scrot 的默认文件名格式：`%yy-%mm-%dd-%hhmmss_$wx$h_scrot.png`。

`$n` – 提供截图文件名。下面是示例截图：

[
 ![scrot $n variable](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/n.png) 
][36]

`$s` – 获取截图的文件大小。这个功能可以像下面这样使用。

```
scrot abc.jpg -e ‘echo $s’
```

下面是示例截图：

[
 ![scrot $s 变量](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/s.png) 
][37]

类似的，你也可以使用其他格式字符串 `$p`、`$w`、 `$h`、`$t`、`$$` 以及 `\n` 来分别获取图片像素大小、图像宽度、图像高度、图像格式、输入 `$` 字符、以及换行。你可以像上面介绍的 `$s` 格式那样使用这些字符串。

### 结论

这个应用能轻松地安装在 Ubuntu 系统上，对初学者比较友好。scrot 也提供了一些高级功能，比如支持格式化字符串，方便专业用户用脚本处理。当然，如果你想用起来的话有一点轻微的学习曲线。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/

作者：[Himanshu Arora][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/
[1]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#get-the-applicationnbspversion
[2]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#capturing-current-window
[3]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#selecting-a-window
[4]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#includenbspwindow-border-in-screenshots
[5]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#delay-in-taking-screenshots
[6]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#countdown-before-screenshot
[7]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#image-quality
[8]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#generating-thumbnails
[9]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#join-multiple-displays-shots
[10]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#executing-operations-on-saved-images
[11]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#special-strings
[12]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#about-scrot
[13]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#scrot-installation
[14]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#scrot-usagefeatures
[15]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#conclusion
[16]:https://www.howtoforge.com/subscription/
[17]:https://www.howtoforge.com/tutorial/taking-screenshots-in-linux-using-gnome-screenshot/
[18]:https://en.wikipedia.org/wiki/Scrot
[19]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/scrot.png
[20]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/version.png
[21]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/desktop.png
[22]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/active.png
[23]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/select1.png
[24]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/select2.png
[25]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/border-new.png
[26]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/delay.png
[27]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/countdown.png
[28]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/img-quality.jpg
[29]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/orig.png
[30]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/thmb.png
[31]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/multiple.png
[32]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/exec1.png
[33]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/exec2.png
[34]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/exec3.png
[35]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/f.png
[36]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/n.png
[37]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/s.png
