[#]: subject: "7 Linux commands to use just for fun"
[#]: via: "https://opensource.com/article/21/11/fun-linux-commands"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13990-1.html"

7 个好玩的 Linux 命令
======

> 这些好玩的 Linux 命令也有它的用处。

![](https://img.linux.net.cn/data/attachment/album/202111/16/164838m35s5q81t353sxq3.jpg)

Linux 的命令行可以说是资深用户和系统管理员的小窝。然而，Linux 不仅仅是大量的枯燥工作。Linux 是由爱玩的人开发的，他们还创造了一系列搞笑的命令。当你想轻松一下的时候，就可以自己试着这些。

### 蒸汽机车

随便什么时候，你可以使用 `sl` 命令使一辆<ruby>蒸汽机车<rt>Steam Locomotive</rt></ruby>在你的终端上跑过。可以用你的软件包管理器安装这辆蒸汽机车。例如，在 Fedora 上可以这样：

```
$ sudo dnf install sl
```

![由符号和字符组成的蒸汽机车引擎图][2]

#### 实际用途

据我所知，`sl` 命令确实只是为了好玩。你对 `sl` 有什么有趣的用途吗？请在评论中告诉我。

（LCTT 译注：`sl` 的实际用途就是提醒你 `ls` 打错了。🤣）

### 壁炉

点燃一座壁炉来温暖你的心和你的终端吧，`aafire` 命令会播放一段壁炉的动画。你可以用你的软件包管理器安装 `aafire`。在 Debian、Mint、 Elementary 之类的发行版上：

```
$ sudo apt install libaa-bin
```

在 Fedora、CentOS 之类的发行版：

```
$ sudo dnf install aalib
```

![由文字符号和字符组成的火的黑白图像][4]

#### 实际用途

这个动画是向你的团队或老板传达一切即将化为乌有的微妙方式。

### 是的

你可以使用 `yes` 命令打印出一串文字，直到用 `Ctrl+C` 强行停止。例如，我是一个 Buffalo Bills 的球迷，所以我选择用 `yes` 命令打印出一串无尽的 “Buffalo Bills”：

```
$ yes Buffalo Bills
```

![画面上重复显示的是一行行 Buffalo Bills（左侧边缘略微被切断）][5]

#### 实际用途

你可以用这个命令来向脚本输送确认信息，这样，当脚本停顿下来要求确认时，它就会自动收到 `yes`。例如，想象一下，你运行的一个脚本经常停下来问你确认：

```
$ foo
Are you sure you want to do this? Y/n  Y
Are you really sure? y/N  Y
But are you really? y/N
```

你可以通过向命令传递 `yes` 来自动接受这些信息：

```
$ yes | foo
```

另外，你也可以用 `yes` 来自动拒绝信息：

```
$ yes no | foo
```

### 命运

通过安装 `fortune` 命令，你可以就可以得到命运的指点。`fortune` 会打印出一段随机的、可能有意义的话语（LCTT 译注：来自命运的指点）。

用你的软件包管理器安装 `fortune`：

```
$ sudo apt install fortune
```

在 Fedora 上：

```
$ sudo dnf install fortune-mod
```

命运命令有许多数据集，它可以从中提取各种话语。例如，你可以从文学作品或科幻电视节目 《Firefly》中获得名人名言，或者从笑话、关于 Linux 的技巧等中选择。在你的资源库中搜索 `fortune`，看看你的发行版提供了哪些数据集。

```
$ fortune
Johnson's law:
  Systems resemble the organizations that create them.
```

#### 实际用途

你可以用命运来生成一个伪随机数。没有足够的熵来使它在密码学上安全，但当你需要一个意外的数字时，你可以用来计算字符或单词：

```
$ fortune | wc --chars
38
$ fortune | wc --words
8
$ fortune | wc --chars
169
```

### 彩虹猫

彩虹猫（`lolcat`）是一个将文件或标准输入连接到标准输出的程序（就像一般的 `cat` 命令），并在其中加入彩虹色。你可以用管道将其他命令的输出连接到 `lolcat`，这样就可以为结果加上彩虹色。

下面是 `lolcat -h` 的帮助输出的结果。

![屏幕上的文字被染成了彩虹的渐变色][6]

（LCTT 译注：我知道 `cat` 是 `catch`。）

### “FIG 来信”和横幅

“FIG 来信”（FIGlet）来源于 Frank、Ian 和 Glenn 信件中的签名艺术。这个命令（`figlet`）和横幅命令（`banner`）可以帮你创建简单的 ASCII 文本横幅。下面是一个 CentOS 系统的文本横幅：

```
$ figlet centos.com
```

![由符号和字符组成的阅读 “centos.com” 的文本横幅][7]

将 `figlet` 连接到 `lolcat`，可以得到一个彩色的横幅：

```
$ figlet centos.com | lolcat
```

![用 lolcat 将 “centos.com” 的文字横幅渲染成彩虹色][8]

```
$ banner Hello World
```

![用英镑符号拼出的 “Hello World” 横幅][9] 

#### 实际用途

`figlet` 和 `banner` 都是提醒用户他们正在登录的系统的简单方法。就像许多系统管理员、网页设计师和云开发人员一样，当你和几十台服务器一起工作时，这很有帮助。

### 电子语音

你可以通过安装电子语音（`espeak`）来为你的命令行添加语音功能。

一旦 `espeak` 安装完毕，调高你的电脑的音量，听你的机器和你说话，会有一些乐趣。电子语音是一个软件语音合成器，有几个不同的语音库可用：

```
$ espeak "Linux is the best operating system.”
```

### 有趣的命令

请查阅所有这些命令的手册，以探索所有的可能性和变化。你最喜欢哪些好玩的命令，它们在现实世界中是否也有用途？请在评论中分享你的最爱。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/fun-linux-commands

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://opensource.com/sites/default/files/uploads/locomotive_0.png (Steam locomotive)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/fireside.png (fireside)
[5]: https://opensource.com/sites/default/files/uploads/bills.png (Yes command)
[6]: https://opensource.com/sites/default/files/uploads/lolcat_rainbow.png (lolcat)
[7]: https://opensource.com/sites/default/files/uploads/figlet_centos.png (figlet text banner)
[8]: https://opensource.com/sites/default/files/uploads/lolcat_figlet_centos.png (Figlet with lolcat effects)
[9]: https://opensource.com/sites/default/files/uploads/hello_world_0.png (Hello World banner)
