在 Linux 命令行中自定义文本颜色
======

> 在 Linux 命令行当中使用不同颜色以期提供一种根据文件类型来识别文件的简单方式。你可以修改这些颜色，但是在做之前应该对你做的事情有充分的理由。

![](https://images.idgesg.net/images/article/2018/05/numbers-100756457-large.jpg)

如果你在 Linux 命令行上花费了大量的时间（如果没有，那么你可能不会读这篇文章），你无疑注意到了 `ls` 以多种不同的颜色显示文件。你可能也注意到了一些区别 —— 目录是一种颜色，可执行文件是另一种颜色等等。

这一切是如何发生的呢？以及，你可以选择哪些选项来改变颜色分配可能就不是很多人都知道的。

一种方法是运行 `dircolors` 命令得到一大堆展示了如何指定这些颜色的数据。它会显示以下这些东西：

```
$ dircolors
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do
=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg
=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01
;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01
;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=0
1;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31
:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.
xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.t
bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.j
ar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.a
lz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.r
z=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.
mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:
*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:
*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;3
5:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;
35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01
;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01
;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01
;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;3
5:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;3
5:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;3
6:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;
36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;
36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
```

如果你擅长解析文件，那么你可能会注意到这个列表有一种<ruby>模式<rt>patten</rt></ruby>。用冒号分隔开，你会看到这样的东西：

```
$ dircolors | tr ":" "\n" | head -10
LS_COLORS='rs=0
di=01;34
ln=01;36
mh=00
pi=40;33
so=01;35
do=01;35
bd=40;33;01
cd=40;33;01
or=40;31;01
```

OK，这里有一个模式 —— 一系列定义，有一到三个数字组件。我们来看看其中的一个定义。

```
pi=40;33
```

有些人可能会问的第一个问题是“pi 是什么？”在这里，我们研究的是颜色和文件类型，所以这显然不是以 3.14 开头的那个有趣的数字。当然不是，这个 “pi” 代表 “pipe（管道）” —— Linux 系统上的一种特殊类型的文件，它可以将数据从一个程序传递给另一个程序。所以，让我们建立一个管道。

```
$ mknod /tmp/mypipe p
$ ls -l /tmp/mypipe
prw-rw-r-- 1 shs shs 0 May 1 14:00 /tmp/mypipe
```

当我们在终端窗口中查看我们的管道和其他几个文件时，颜色差异非常明显。

![font colors][1]

在 `pi` 的定义中（如上所示），“40” 使文件在终端（或 PuTTY）窗口中使用黑色背景显示，31 使字体颜色变红。管道是特殊的文件，这种特殊的处理使它们在目录列表中突出显示。

`bd` 和 `cd` 定义是相同的 —— `40;33;01`，它有一个额外的设置。这个设置会导致 <ruby>块设备<rt>block device</rt></ruby>（bd）和 <ruby>字符设备<rt>character device</rt></ruby>（cd）以黑色背景，橙色字体和另一种效果显示 —— 字符将以粗体显示。

以下列表显示由<ruby>文件类型<rt>file type</rt></ruby>所指定的颜色和字体分配：

```
setting         file type
=======         =========
rs=0            reset to no color
di=01;34        directory
ln=01;36        link
mh=00           multi-hard link
pi=40;33        pipe
so=01;35        socket
do=01;35        door
bd=40;33;01     block device
cd=40;33;01     character device
or=40;31;01     orphan
mi=00           missing?
su=37;41        setuid
sg=30;43        setgid
ca=30;41        file with capability
tw=30;42        directory with sticky bit and world writable
ow=34;42        directory that is world writable
st=37;44        directory with sticky bit
ex=01;93        executable
```

你可能已经注意到，在 `dircolors` 命令输出中，我们的大多数定义都以星号开头（例如，`*.wav=00;36`）。这些按<ruby>文件扩展名<rt>file extension</rt></ruby>而不是文件类型定义显示属性。这有一个示例：

```
$ dircolors | tr ":" "\n" | tail -10
*.mpc=00;36
*.ogg=00;36
*.ra=00;36
*.wav=00;36
*.oga=00;36
*.opus=00;36
*.spx=00;36
*.xspf=00;36
';
export LS_COLORS
```

这些设置（上面列表中所有的 `00;36`）将使这些文件名以青色显示。可用的颜色如下所示。

![all colors][2]

### 如何改变设置

你要使用 `ls` 的别名来打开颜色显示功能。这通常是 Linux 系统上的默认设置，看起来是这样的：

```
alias ls='ls --color=auto'
```

如果要关闭字体颜色，可以运行 `unalias ls` 命令，然后文件列表将仅以默认字体颜色显示。

你可以通过修改 `$LS_COLORS` 设置和导出修改后的设置来更改文本颜色。

```
$ export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;...
```

注意：上面的命令由于太长被截断了。

如果希望文本颜色的修改是永久性的，则需要将修改后的 `$LS_COLORS` 定义添加到一个启动文件中，例如 `.bashrc`。

### 更多关于命令行文本

你可以在 NetworkWorld 的 [2016 年 11 月][3]的帖子中找到有关文本颜色的其他信息。

---

via: https://www.networkworld.com/article/3269587/linux/customizing-your-text-colors-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]: https://images.idgesg.net/images/article/2018/05/font-colors-100756483-large.jpg
[2]: https://images.techhive.com/images/article/2016/11/all-colors-100691990-large.jpg
[3]: https://www.networkworld.com/article/3138909/linux/coloring-your-world-with-ls-colors.html
