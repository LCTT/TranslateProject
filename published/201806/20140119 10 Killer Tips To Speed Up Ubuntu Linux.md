10 条加速 Ubuntu Linux 的杀手级技巧
======

> 一些实用的**加速 Ubuntu Linux 的技巧**。 这里的技巧对于大多数版本的 Ubuntu 是有效的，也可以应用于 Linux Mint 以及其他的基于 Ubuntu 的发行版。

也许你经历过使用 Ubuntu 一段时间后系统开始运行缓慢的情况。 在这篇文章里，我们将看到几项调整以及使 Ubuntu 运行更快的窍门。

在我们了解如何提升 Ubuntu 的总体系统表现之前，首先让我们思考为什么系统逐渐变慢。这个问题可能有很多原因。也许你有一台只有基础配置的简陋的电脑；也许你安装了一些在启动时即耗尽资源的应用。事实上原因无穷无尽。

这里我列出一些能够帮助你稍微加速 Ubuntu 的小调整。也有一些你能够采用以获取一个更流畅、有所提升的系统表现的经验。你可以选择遵循全部或部分的建议。将各项调整一点一点的结合就能给你一个更流畅、更迅捷快速的 Ubuntu。

### 使 Ubuntu 更快的技巧

![Tips to speed up Ubuntu][1]

我在一个较老版本的 Ubuntu 上使用了这些调整，但是我相信其他的 Ubuntu 版本以及其他的例如 Linux Mint、 Elementary OS Luna 等基 Ubuntu 的 Linux 版本也是同样适用的。

#### 1、 减少默认的 grub 载入时间

Grub 给你 10 秒的时间以让你在多系统启动项或恢复模式之间改变。对我而言，它是多余的。它也意味着你将不得不坐在电脑旁，敲下回车键以尽可能快的启动进入 Ubuntu。这花了一点时间，不是吗？ 第一个技巧便是改变这个启动时间。如果你使用图形工具更舒适，阅读这篇文章来[使用 Grub 定制器改变 grub 时间以及启动顺序][2]。

如果更倾向于命令行，你可以简单地使用以下的命令来打开 grub 配置：

```
sudo gedit /etc/default/grub &
```

并且将 `GRUB_TIMEOUT=10` 改为 `GRUB_TIMEOUT=2`。这将改变启动时间为 2 秒。最好不要将这里改为 0，因为这样你将会失去在操作系统及恢复选项之间切换的机会。一旦你更改了 grub 配置，使用以下命令来使更改生效：

```
sudo update-grub
```

#### 2、 管理开机启动的应用

渐渐地你开始安装各种应用。 如果你是我们的老读者, 你也许从 [App of the week][3] 系列安装了许多应用。

这些应用中的一些在每次开机时都会启动，当然资源运行这些应用也会陷入繁忙。结果：一台电脑因为每次启动时的持续时间而变得缓慢。进入 Unity Dash 寻找 “Startup Applications”：

![](https://itsfoss.com/wp-content/uploads/2014/01/Startup_Applications_Ubuntu.jpeg)

在这里，看看哪些应用在开机时被载入。现在考虑在你每次启动 Ubuntu 时是否有不需要启动的应用。尽管移除它们：

![](https://itsfoss.com/wp-content/uploads/2014/01/Startup_applications_ubuntu_1310.jpeg)

但是要是你不想从启动里移除它们怎么办？举个例子，如果你安装了 [Ubuntu 最好的指示器程序][4]之一， 你将想要它们在每次开机时自动地启动。

这里你所能做的就是延迟一些程序的启动时间。这样你将能够释放开机启动时的资源，并且一段时间后你的应用将被自动启动。在上一张图片里点击 Edit 并使用 sleep 选项来更改运行命令。

例如，如果你想要延迟 Dropbox 指示器的运行，我们指定时间 20 秒，你只需要在已有的命令里像这样**加入一个命令**：

```
sleep 20;
```

所以，命令 `dropbox start -i` 变为 `sleep 20; drobox start -i` 。这意味着现在 Dropbox 将延迟 20 秒启动。你可以通过相似的方法来改变另一个开机启动应用的启动时间。

![](https://itsfoss.com/wp-content/uploads/2014/01/Edit_startup_applications_Ubuntu.jpeg)

#### 3、 安装 preload 来加速应用载入时间：

Preload 是一个后台运行的守护进程，它分析用户行为和频繁运行的应用。打开终端，使用如下的命令来安装 preload：

```
sudo apt-get install preload
```

安装后，重启你的电脑就不用管它了。它将在后台工作。[阅读更多关于preload][5]

#### 4、 选择最好的软件更新镜像

验证你更新软件是否正在使用最好的镜像是很好的做法。Ubuntu 的软件仓库镜像跨过全球，使用离你最近的一个是相当明智的。随着从服务器获取包的时间减少，这将形成更快的系统更新。

在 “Software & Updates->Ubuntu Software tab->Download From” 里选择 “Other” 紧接着点击 “Select Best Server”：

![](https://itsfoss.com/wp-content/uploads/2014/01/Ubuntu_software_Center_Mirror.jpeg)

它将运行测试来告知你那个是最好的镜像。正常地，最好的镜像已经被设置，但是我说过，验证它没什么坏处。并且，如果仓库缓存的最近的镜像没有频繁更新的话，这将引起获取更新时的一些延迟。这对于网速相对慢的人们是有用的。你可以使用这些技巧来[加速 Ubuntu 的 wifi][6]。

#### 5、 为了更快的更新，使用 apt-fast 而不是 apt-get 

`apt-fast` 是 `apt-get` 的一个 shell 脚本包装器，通过从多连接同时下载包来提升更新及包下载速度。 如果你经常使用终端以及 `apt-get` 来安装和更新包，你也许会想要试一试 `apt-fast`。使用下面的命令来通过官方 PPA 安装 `apt-fast`：

```
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get install apt-fast
```

#### 6、 从 apt-get 更新移除语言相关的 ign

你曾经注意过 `sudo apt-get` 更新的输出吗？其中有三种行，`hit`、`ign` 和 `get`。 你可以在[这里][7]阅读它们的意义。如果你看到 IGN 行，你会发现它们中的大多数都与语言翻译有关。如果你使用所有的英文应用及包，你将完全不需要英文向英文的包数据库的翻译。

如果你从 `apt-get` 制止语言相关的更新，它将略微地增加 `apt-get` 的更新速度。为了那样，打开如下的文件：

```
sudo gedit /etc/apt/apt.conf.d/00aptitude
```

然后在文件末尾添加如下行：

```
Acquire::Languages "none";
```

[![speed up apt get update in Ubuntu][8]][9]

#### 7、 减少过热

现在过热是电脑普遍的问题。一台过热的电脑运行相当缓慢。当你的 CPU 风扇转得像 [尤塞恩·博尔特][10] 一样快，打开一个程序将花费很长的时间。有两个工具你可以用来减少过热，使 Ubuntu 获得更好的系统表现，即 TLP 和 CPUFREQ。

在终端里使用以下命令来安装 TLP：

```
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
sudo tlp start
```

安装完 TLP 后你不需要做任何事。它在后台工作。

使用如下命令来安装 CPUFREQ 指示器：

```
sudo apt-get install indicator-cpufreq
```

重启你的电脑并使用 Powersave 模式：

![](https://itsfoss.com/wp-content/uploads/2013/11/CPUFREQ-indicator.jpeg)

#### 8、 调整 LibreOffice 来使它更快

如果你是频繁使用 office 产品的用户，那么你会想要稍微调整默认的 LibreOffice 使它更快。这里你将调整内存选项。打开 Open LibreOffice，进入 “Tools->Options”。在那里，从左边的侧栏选择“Memory”并启用 “Systray Quickstarter” 以及增加内存分配。

![](https://itsfoss.com/wp-content/uploads/2013/08/LibreOffice_Memory_option_1.jpeg)

你可以阅读更多关于[如何提速 LibreOffice][11] 的细节。

#### 9、 使用轻量级的桌面环境 (如果你可以)

如果你选择安装默认的 Unity of GNOME 桌面环境, 你也许会选择一个轻量级的桌面环境像 [Xfce][12] 或 [LXDE][13]。

这些桌面环境使用更少的内存，消耗更少的 CPU。它们也自带轻量应用集来更深入地帮助更快地使用 Ubuntu。你可以参考这篇详细指南来学习[如何在 Ubuntu 上安装 Xfce][14]。

当然，桌面也许没有 Unity 或 GNOME 看起来现代化。那是你必须做出的妥协。

#### 10、 使用不同应用的更轻量可选

这不仅仅是建议和喜好。一些默认的或者流行的应用是耗资源的且可能不适合低端的电脑。你能做的就是使用这些应用的一些替代品。例如，使用 [AppGrid][15] 而不是 Ubuntu 软件中心。使用 [Gdebi][16] 来安装包。使用 AbiWord 而不是 LibreOffice Writer 等。

可以断定这些技巧的汇总使 Ubuntu 14.04，16.04 以及其他版本更快。我确定这些技巧会提供一个总体上更好的系统表现。

对于加速 Ubuntu 你也有妙计吗？这些技巧也帮到你了吗？分享你的观点。 问题，建议总是受欢迎的。请在评论区里提出来。

--------------------------------------------------------------------------------

via: https://itsfoss.com/speed-up-ubuntu-1310/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[darsh8](https://github.com/darsh8)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/wp-content/uploads/2017/07/speed-up-ubuntu-featured-800x450.jpeg
[2]:https://itsfoss.com/windows-default-os-dual-boot-ubuntu-1304-easy/ (Make Windows Default OS In Dual Boot With Ubuntu 13.04: The Easy Way)
[3]:https://itsfoss.com/tag/app-of-the-week/
[4]:https://itsfoss.com/best-indicator-applets-ubuntu/ (7 Best Indicator Applets For Ubuntu 13.10)
[5]:https://itsfoss.com/improve-application-startup-speed-with-preload-in-ubuntu/ (Improve Application Startup Speed With Preload in Ubuntu)
[6]:https://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/ (Speed Up Slow WiFi Connection In Ubuntu 13.04)
[7]:http://ubuntuforums.org/showthread.php?t=231300
[8]:https://itsfoss.com/wp-content/uploads/2014/01/ign_language-apt_get_update-e1510129903529.jpeg
[9]:https://itsfoss.com/wp-content/uploads/2014/01/ign_language-apt_get_update.jpeg
[10]:http://en.wikipedia.org/wiki/Usain_Bolt
[11]:https://itsfoss.com/speed-libre-office-simple-trick/ (Speed Up LibreOffice With This Simple Trick)
[12]:https://xfce.org/
[13]:https://lxde.org/
[14]:https://itsfoss.com/install-xfce-desktop-xubuntu/
[15]:https://itsfoss.com/app-grid-lighter-alternative-ubuntu-software-center/ (App Grid: Lighter Alternative Of Ubuntu Software Center)
[16]:https://itsfoss.com/install-deb-files-easily-and-quickly-in-ubuntu-12-10-quick-tip/ (Install .deb Files Easily And Quickly In Ubuntu 12.10 [Quick Tip])
