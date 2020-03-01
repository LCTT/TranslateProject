[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11892-1.html)
[#]: subject: (Run multiple consoles at once with this open source window environment)
[#]: via: (https://opensource.com/article/20/1/multiple-consoles-twin)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用开源窗口环境 twin 一次运行多个控制台
======

> 在我们的 20 个使用开源提升生产力的系列的第十四篇文章中用 twin 模拟了老式的 DESQview 体验。

![](https://img.linux.net.cn/data/attachment/album/202002/14/193658tlbyft0lbu44f0s3.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 通过 twin 克服“一个屏幕，一个应用程序”的限制

还有人记得 [DESQview][2] 吗？我们在 Windows、Linux 和 MacOS 中理所当然地可以在屏幕上同时运行多个程序，而 DESQview 赋予了 DOS 同样的功能。在我运营拨号 BBS 服务的初期，DESQview 是必需的，它使我能够让 BBS 在后台运行，同时在前台进行其他操作。例如，当有人拨打电话时，我可能正在开发新功能或设置新的外部程序而不会影响他们的体验。后来，在我早期做支持工作的时候，我可以同时运行我的工作电子邮件（[MHS 上的 DaVinci 电子邮件][3]）、支持单据系统和其他 DOS 程序。这是令人吃惊的！

![twin][4]

从那时起，运行多个控制台应用程序的功能已经发展了很多。但是 [tmux][5] 和 [Screen][6] 等应用仍然遵循“一个屏幕，一个应用”的显示方式。好吧，是的，tmux 具有屏幕拆分和窗格，但是不像 DESQview 那样具有将窗口“浮动”在其他窗口上的功能，就我个人而言，我怀念那个功能。

让我们来看看 [twin][7]（文本模式窗口环境）。我认为，这个相对年轻的项目是 DESQview 的精神继任者。它支持控制台和图形环境，并具有与会话脱离和重新接驳的功能。设置起来并不是那么容易，但是它可以在大多数现代操作系统上运行。

Twin 是从源代码安装的（现在是这样）。但是首先，你需要安装所需的开发库。库名称将因操作系统而异。 以下示例显示了在我的 Ubuntu 19.10 系统中的情况。一旦安装了依赖库，请从 Git 中检出 twin 源代码，并运行 `./configure` 和 `make`，它们应自动检测所有内容并构建 twin：

```
sudo apt install libx11-dev libxpm-dev libncurses-dev zlib1g-dev libgpm-dev
git clone git@github.com:cosmos72/twin.git
cd twin
./configure
make
sudo make install
```

注意：如果要在 MacOS 或 BSD 上进行编译，则需要在运行 `make` 之前在文件 `include/Tw/autoconf.h` 和 `include/twautoconf.h` 中注释掉 `#define socklen_t int`。这个问题应该在 [twin #57][9] 解决了。

![twin text mode][10]

第一次调用 twin 是一个挑战。你需要通过 `--hw` 参数告诉它正在使用哪种显示。例如，要启动文本模式的 twin，请输入 `twin --hw=tty,TERM=linux`。这里指定的 `TERM` 变量替代了你当前 Shell 中终端变量。要启动图形版本，运行 `twin --hw=X@$DISPLAY`。在 Linux 上，twin 一般都“可以正常工作”，而在 MacOS 上，Twin 基本是只能在终端上使用。

*真正*的乐趣是可以通过 `twattach` 和 `twdisplay` 命令接驳到正在运行的会话的功能。它们使你可以接驳到其他正在运行的 twin 会话。例如，在 Mac 上，我可以运行以下命令以接驳到演示机器上运行的 twin 会话：

```
twdisplay --twin@20days2020.local:0 --hw=tty,TERM=linux
```

![remote twin session][11]

通过多做一些工作，你还可以将其用作登录外壳，以代替控制台上的 [getty][12]。这需要 gdm 鼠标守护程序、twdm 应用程序（包括）和一些额外的配置。在使用 systemd 的系统上，首先安装并启用 gdm（如果尚未安装），然后使用 `systemctl` 为控制台（我使用 tty6）创建一个覆盖。这些命令必须以 root 用户身份运行；在 Ubuntu 上，它们看起来像这样：

```
apt install gdm
systemctl enable gdm
systemctl start gdm
systemctl edit getty@tty6
```

`systemctl edit getty@tty6` 命令将打开一个名为 `override.conf` 的空文件。它可以定义 systemd 服务设置以覆盖 tty6 的默认设置。将内容更新为：

```
[service]
ExecStart=
ExecStart=-/usr/local/sbin/twdm --hw=tty@/dev/tty6,TERM=linux
StandardInput=tty
StandardOutput=tty
```

现在，重新加载 systemd 并重新启动 tty6 以获得 twin 登录提示界面：

```
systemctl daemon-reload
systemctl restart getty@tty6
```

![twin][13]

这将为登录的用户启动一个 twin 会话。我不建议在多用户系统中使用此会话，但是对于个人桌面来说，这是很酷的。并且，通过使用 `twattach` 和 `twdisplay`，你可以从本地 GUI 或远程桌面访问该会话。

我认为 twin 真是太酷了。它还有一些细节不够完善，但是基本功能都已经有了，并且有一些非常好的文档。另外，它也使我可以在现代操作系统上稍解对 DESQview 式的体验的渴望。我希望随着时间的推移它会有所改进，希望你和我一样喜欢它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/multiple-consoles-twin

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://en.wikipedia.org/wiki/DESQview
[3]: https://en.wikipedia.org/wiki/Message_Handling_System
[4]: https://opensource.com/sites/default/files/uploads/productivity_14-1.png (twin)
[5]: https://github.com/tmux/tmux/wiki
[6]: https://www.gnu.org/software/screen/
[7]: https://github.com/cosmos72/twin
[8]: mailto:git@github.com
[9]: https://github.com/cosmos72/twin/issues/57
[10]: https://opensource.com/sites/default/files/uploads/productivity_14-2.png (twin text mode)
[11]: https://opensource.com/sites/default/files/uploads/productivity_14-3.png (remote twin session)
[12]: https://en.wikipedia.org/wiki/Getty_(Unix)
[13]: https://opensource.com/sites/default/files/uploads/productivity_14-4.png (twin)
