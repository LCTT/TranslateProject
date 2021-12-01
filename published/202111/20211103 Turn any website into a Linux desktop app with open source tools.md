[#]: subject: "Turn any website into a Linux desktop app with open source tools"
[#]: via: "https://opensource.com/article/21/11/linux-apps-nativefier"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13975-1.html"

用开源工具将任何网站变成 Linux 桌面应用
======

> 使用 Nativefier 和 Electron 从任何网站创建桌面应用。

![](https://img.linux.net.cn/data/attachment/album/202111/11/115302e25o5laz8sex5ea6.jpg)

Mastodon 是一个很好的开源、去中心化的社交网络。我每天都在使用 Mastodon，通过它的网页界面使用 Mastodon 可能是最常见的方式（尽管因为开源，它有许多不同的交互方式，包括基于终端的应用和移动应用），但我更喜欢专门的应用窗口。

最近，我发现了 [Nativefier][2]，现在我可以在我的 Linux 桌面上把 Mastodon 或其他任何网页应用作为桌面应用来使用。Nativefier 将一个 URL 用 Electron 框架包装起来，它将开源的 Chromium 浏览器作为后端，但使用自己的可执行程序运行。Nativefier 采用 MIT 许可证，可用于 Linux、Windows 和 MacOS。

### 安装 Nativefier

Nativefier 需要 Node.js。

安装 Nativefier 只需运行：

```
$ sudo npm install -g nativefier
```

在我的 Ubuntu 桌面上，我必须先升级 NodeJS，所以当你安装 Nativefier 时，一定要检查需要哪个 Node 版本。

安装完毕后，你可以检查你的 Nativefier 的版本，以验证它是否已经安装：

```
$ nativefier --version
45.0.4
```

运行 `nativefier --help` 列出了应用支持的所有选项。

### 设置

我建议你在开始用 Nativefier 创建应用之前，创建一个名为 `~/NativeApps` 的新文件夹。这有助于保持你的应用有序。

```
$ mkdir ~/NativeApps
cd ~/NativeApps
```

### 为 Mastodon 创建一个应用程序

我将首先为 [mastodon.technology][3] 创建一个应用。

使用以下命令：

```
$ nativefier --name Mastodon \
  --platform linux --arch x64 \
  --width 1024 --height 768 \
  --tray --disable-dev-tools \
  --single-instance https://mastodon.technology
```

这个例子中的选项做了以下工作：

  * `--name`：设置应用的名称为 Mastodon
  * `--platform`：设置应用程序的平台为 Linux
  * `--arch x64`：设置架构为 x64
  * `--width 1024 --height 768`：设置应用启动时的大小
  * `--tray`：为应用创建一个托盘图标
  * `--disable-dev-tools`：禁用 Chrome 开发工具
  * `--single-instance`：只允许应用有一个实例

运行这条命令会显示以下输出：

```
Preparing Electron app...

Converting icons...
Packaging... This will take a few seconds, maybe minutes if the requested Electron isn't cached yet...
Packaging app for platform linux x64 using electron v13.4.0 Finalizing build...

App built to /home/tux/NativeApps/Mastodon-linux-x64, move to wherever it makes sense for you and run the contained executable file (prefixing with ./ if necessary)

Menu/desktop shortcuts are up to you, because Nativefier cannot know where you're going to move the app. Search for "linux .desktop file" for help, or see https://wiki.archlinux.org/index.php/Desktop_entries
```

输出显示，文件被放置在 `/home/tux/NativeApps/Mastodon-linux-x64`。当你 `cd` 进入这个文件夹，你会看到一个名为 `Mastodon` 的文件。这是启动该应用的主要可执行文件。在你启动它之前，你必须给它适当的权限。

```
$ cd Mastodon-linux-x64
chmod +x Mastodon
```

现在，执行 `./Mastodon` 就可以看到你的 Linux 应用启动了！

![Mastodon app launched][4]

### 为我的博客创建一个应用

为了好玩，我也要为我的博客创建一个应用。如果没有 Linux 应用，拥有一个技术博客有什么用？

![Ayush Sharma blog][6]

命令是：

```
$ nativefier -n ayushsharma \
  -p linux -a x64 \
  --width 1024 --height 768 \
  --tray --disable-dev-tools \
  --single-instance https://ayushsharma.in

$ cd ayushsharma-linux-x64
chmod +x ayushsharma
```

### 为 findmymastodon.com 创建一个应用

最后，这是为我的宠物项目 [findmymastodon.com][7] 制作的应用。

![Find my mastodon website][8]

命令是：

```
$ nativefier -n findmymastodon \
  -p linux -a x64 \
  --width 1024 --height 768 \
  --tray --disable-dev-tools \
  --single-instance https://findmymastodon.com

$ cd findmymastodon-linux-x64
chmod +x findmymastodon
```

### 创建 Linux 桌面图标

应用已经创建并可以执行了，现在是创建桌面图标的时候了。

作为示范，以下是如何为 Mastodon 启动器创建一个桌面图标。首先，下载一个 [Mastodon][9] 的图标。将该图标放在其 Nativefier 应用目录下，名为 `icon.png`。

然后创建一个名为 `Mastodon.desktop` 的文件并输入以下文本：

```
[Desktop Entry]
Type=Application
Name=Mastodon
Path=/home/tux/NativeApps/Mastodon-linux-x64
Exec=/home/tux/NativeApps/Mastodon-linux-x64/Mastodon
Icon=/home/tux/NativeApps/Mastodon-linux-x64/icon.png
```

你可以把 `.desktop` 文件移到你的 Linux 桌面上，把它作为一个桌面启动器。你也可以把它复制到 `~/.local/share/applications` 中，这样它就会出现在你的应用菜单或活动启动器中。

### 总结

我喜欢为我经常使用的工具配备专门的应用。我最喜欢的一个 Mastodon 应用特点是，当我登录到 Mastodon 之后，我就不必再次登录了! Nativefier 在底层运行 Chromium。所以它能够像其他浏览器一样记住你的会话。我想特别感谢 Nativefier 团队，他们让 Linux 桌面离完美更近了一步。

本文最初发表在 [作者的网站][10] 上，并经授权转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-apps-nativefier

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://github.com/nativefier/nativefier
[3]: https://mastodon.technology/
[4]: https://opensource.com/sites/default/files/uploads/2_launch-mastodon-app.png (Mastodon app launched)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/3_ayush-shama-blog.png (Ayush Sharma blog)
[7]: https://findmymastodon.com/
[8]: https://opensource.com/sites/default/files/uploads/4_find-my-mastodon-app.png (Find my mastodon website)
[9]: https://icons8.com/icons/set/mastodon
[10]: https://ayushsharma.in/2021/10/make-linux-apps-for-notion-mastodon-webapps-using-nativefier
