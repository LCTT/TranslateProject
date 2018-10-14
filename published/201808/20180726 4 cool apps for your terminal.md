4 款酷炫的终端应用
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/terminal4cool-816x345.jpg)

许多 Linux 用户认为在终端中工作太复杂、无聊，并试图逃避它。但这里有个改善方法 —— 四款终端下很棒的开源程序。它们既有趣又易于使用，甚至可以在你需要在命令行中工作时照亮你的生活。

### No More Secrets

这是一个简单的命令行工具，可以重现 1992 年电影 [Sneakers][1] 中所见的著名数据解密效果。该项目让你编译个 `nms` 命令，该命令与管道数据一起使用并以混乱字符的形式打印输出。开始后，你可以按任意键，并能在输出中看到很酷的好莱坞效果的现场“解密”。

![][2]

#### 安装说明

一个全新安装的 Fedora Workstation 系统已经包含了从源代码构建 No More Secrets 所需的一切。只需在终端中输入以下命令：

```
git clone https://github.com/bartobri/no-more-secrets.git
cd ./no-more-secrets
make nms
make sneakers ## Optional
sudo make install
```

对于那些记得原来的电影的人来说，`sneakers` 命令是一个小小的彩蛋，但主要的英雄是 `nms`。使用管道将任何 Linux 命令重定向到 `nms`，如下所示：

```
systemctl list-units --type=target | nms
```

当文本停止闪烁，按任意键“解密”它。上面的 `systemctl` 命令只是一个例子 —— 你几乎可以用任何东西替换它！

### lolcat

这是一个用彩虹为终端输出着色的命令。没什么用，但是它看起来很棒！

![][3]

#### 安装说明

`lolcat` 是一个 Ruby 软件包，可从官方 Ruby Gems 托管中获得。所以，你首先需要 gem 客户端：

```
sudo dnf install -y rubygems
```

然后安装 `lolcat` 本身：

```
gem install lolcat
```

再说一次，使用 `lolcat` 命令管道任何其他命令，并在 Fedora 终端中享受彩虹（和独角兽！）。

### chafa

![][4]

`chafa` 是一个[命令行图像转换器和查看器][5]。它可以帮助你在不离开终端的情况下欣赏图像。语法非常简单：

```
chafa /path/to/your/image
```

你可以将几乎任何类型的图像投射到 `chafa`，包括 JPG、PNG、TIFF、BMP 或几乎任何 ImageMagick 支持的图像 - 这是 `chafa` 用于解析输入文件的引擎。最酷的部分是 `chafa` 还可以在你的终端内显示非常流畅的 GIF 动画！

#### 安装说明

`chafa` 还没有为 Fedora 打包，但从源代码构建它很容易。首先，获取必要的构建依赖项：

```
sudo dnf install -y autoconf automake libtool gtk-doc glib2-devel ImageMagick-devel
```

接下来，克隆代码或从项目的 GitHub 页面下载快照，然后 cd 到 `chafa` 目录，这样就行了：

```
git clone https://github.com/hpjansson/chafa
./autogen.sh
make
sudo make install
```

大的图像在第一次运行时可能需要一段时间处理，但 `chafa` 会缓存你加载的所有内容。下一次运行几乎是瞬间完成的。

### Browsh

Browsh 是完善的终端网页浏览器。它比 Lynx 更强大，当然更引人注目。 Browsh 以无头模式启动 Firefox Web 浏览器（因此你无法看到它）并在特殊 Web 扩展的帮助下将其与你的终端连接。因此，Browsh 能像 Firefox 一样呈现所有富媒体内容，只是有点像素化的风格。

![][6]

#### 安装说明

该项目为各种 Linux 发行版提供了包，包括 Fedora。以这种方式安装：

```
sudo dnf install -y https://github.com/browsh-org/browsh/releases/download/v1.4.6/browsh_1.4.6_linux_amd64.rpm
```

之后，启动 `browsh` 命令并给它几秒钟加载。按 `Ctrl+L` 将焦点切换到地址栏并开始浏览 Web，就像以前一样使用！使用 `Ctrl+Q` 返回终端。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-apps-for-your-terminal/

作者：[atolstoy][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/atolstoy/
[1]:https://www.imdb.com/title/tt0105435/
[2]:https://fedoramagazine.org/wp-content/uploads/2018/07/nms.gif
[3]:https://fedoramagazine.org/wp-content/uploads/2018/07/lolcat.png
[4]:https://fedoramagazine.org/wp-content/uploads/2018/07/sir.gif
[5]:https://hpjansson.org/chafa/
[6]:https://fedoramagazine.org/wp-content/uploads/2018/07/browsh.png
