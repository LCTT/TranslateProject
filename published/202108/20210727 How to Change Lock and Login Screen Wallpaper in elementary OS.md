[#]: subject: (How to Change Lock and Login Screen Wallpaper in elementary OS)
[#]: via: (https://www.debugpoint.com/2021/07/change-lock-login-screen-background-elementary-os/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13655-1.html)

如何在 elementary OS 中改变锁定和登录屏幕的壁纸
======

> 本教程解释了在 elementary OS 中改变锁定和登录屏幕背景的步骤。这将取代默认的灰色背景。

在 elementary OS 中改变锁屏或登录屏背景的灰色默认壁纸是有点困难的。典型的用图像文件的路径改变 `greeter` 的配置是行不通的。

不幸的是，这不是一个更简单的解决方案，因为灰色背景是一个图像文件，它的数据是硬编码在 `greeter` 中的，需要用新的图像重新编译才能使其发挥作用。

下面是方法：

![Lock / Login screen background elementary OS \(Odin\)][1]

### 改变 elementary OS 锁定和登录屏幕背景

在 elementary OS 中打开一个终端。

为 [greeter 包][2]安装 git 和以下依赖项：

```
sudo apt install git
```

```
sudo apt install -y gnome-settings-daemon libaccountsservice-dev libgdk-pixbuf2.0-dev libgranite-dev libgtk-3-dev libhandy-1-dev liblightdm-gobject-1-dev libmutter-6-dev libwingpanel-dev libx11-dev meson valac
```

进入临时的 `/tmp` 目录，从 GitHub 克隆最新的 greeter 主分支：

```
cd /tmp
git clone https://github.com/elementary/greeter.git
```

克隆完成后，在文件管理器中打开路径 `/tmp/greeter/data`。

elementary OS 使用一个 100×100px 的 PNG 文件作为登录屏幕/锁屏的默认背景。该图像是平铺的，给人一种灰色背景的感觉。

用 `texture.png` 重命名你想要的墙纸图像，并在路径中覆盖以下文件：

![gray background is created using this file][3]

```
/tmp/greeter/data/texture.png
```

在文本编辑器中打开文件 `/tmp/greeter/compositor/SystemBackground.vala`，并替换下面一行：

![change the path of image][4]

```
resource:///io/elementary/desktop/gala/texture.png
```

为：

```
resource:///io/elementary/greeter/texture.png
```

保存该文件。


再次打开终端，使用以下命令构建 `greeter`。

```
cd /tmp/greeter
meson _build --prefix=/usr
sudo ninja install -C _build
```

![building greeter][5]

如果你遇到任何构建错误，请在下面的评论中告诉我。你应该不会看到任何错误，因为我已经测试过了。

上面的命令完成后，你可以在测试模式下运行 `lightdm` 来测试登录屏：

```
lightdm --test-mode --debug
```

如果看起来不错，重新启动系统。而你应该在 elementary OS 的登录屏上看到你的墙纸。

这个指南应该可在 [elementary OS 6 Odin][7]、elementary OS 5 Juno 及以下版本中可用。

### 结束语

我希望本指南能帮助你在 elementary OS 中改变锁屏或登录屏的背景。老实说，在 2021 年改变登录屏的背景图像需要编译代码，这让我很吃惊。

如果你遇到错误，请在下面的评论栏里告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/change-lock-login-screen-background-elementary-os/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/elementary-OS-Login-Screen-in-Odin-1024x768.jpg
[2]: https://github.com/elementary/greeter
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/gray-background-is-created-using-this-file.jpg
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/change-the-path-of-image-1024x450.jpg
[5]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/building-greeter.png
[7]: https://www.debugpoint.com/tag/elementary-os-6
