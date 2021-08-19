[#]: subject: (Mount Microsoft OneDrive in Linux With OneDriver GUI Tool)
[#]: via: (https://itsfoss.com/onedriver/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13681-1.html)

用 OneDriver GUI 工具在 Linux 中挂载微软 OneDrive
======

在 Windows 上，微软提供了一个 [免费云存储服务][1] OneDrive。它与 Windows 集成，你可以通过你的微软账户获得 5GB 的免费存储空间。

这在 Windows 上很好用，但和谷歌一样，微软也没有在 Linux 桌面上提供 OneDrive 的本地客户端。

当然，你可以通过浏览器访问你的 OneDrive 数据。除此以外，还有一些其他的方法可以在 Linux 上访问 OneDrive。

你可以使用像 [Insync][2] 这样的高级服务，或者选择用 [rclone 在 Linux 上使用 OneDrive][3] 这种稍微复杂的命令行方式。

最近，我发现了另一个工具，它稍有不同，使用起来也更简单。不出所料，它叫 OneDriver。

### OneDriver：在你的 Linux 系统上挂载 OneDrive

![OneDrive Linux illustration][4]

[OneDriver][5] 是一个自由而开源的工具，允许你在 Linux 系统上挂载 OneDrive 文件。

请记住，它不会像 OneDrive 在 Windows 系统上那样同步文件。它将 OneDrive 文件挂载在本地的挂载点上。你通过网络访问这些文件。

然而，它确实提供了一种混合方法。你在挂载的 OneDrive 中打开的文件也被下载到系统中。这意味着，你也可以离线访问打开的文件。如果你没有连接到互联网，这些文件将成为只读。

如果你在本地对文件做任何修改，并且连接到互联网，它就会反映到 OneDrive 上。

我注意到，在 GNOME 上的 Nautilus 文件管理器中，它会自动下载当前文件夹中的图像。在我的印象中，它们只有在我打开它们时才会被下载。

另一件事是，Nautilus 一开始会建立缩略图缓存。OneDriver 在开始的时候可能会觉得有点慢，有点耗费资源，但最终会好起来。

哦！你也可以挂载多个 OneDrive 账户。

### 安装和使用 OneDriver

要在 Ubuntu 20.04（和 Linux Mint 20 系列）上安装 OneDriver，你可以使用 OneDriver 开发者的这个 PPA：

```
sudo add-apt-repository ppa:jstaf/onedriver
sudo apt update
sudo apt install onedriver
```

对于 Ubuntu 21.04，你可以下载 [其 PPA 中的 DEB 文件][6] 来使用它。

在 Fedora 上，你可以添加这个 COPR：

```
sudo dnf copr enable jstaf/onedriver
sudo dnf install onedriver
```

Arch 用户可以在 AUR 中找到它。

安装后，在菜单中搜索 OneDriver，然后从这里启动它。

![Search for OneDriver][7]

首次运行时，它会给出一个奇怪的空界面。点击 “+” 号，选择一个文件夹或创建一个新的文件夹，OneDrive 会挂载在那里。在我的例子中，我在我的家目录下创建了一个名为 `One_drive` 的新文件夹。

![Click on + sign to add a mount point for OneDrive][8]

当你选择了挂载点后，你会被要求输入你的微软凭证。

![one drive login][9]

![one drive permission][10]

登录后，你可以在挂载的目录中看到 OneDrive 的文件。

![OneDrive mounted in Linux][11]

完成这些后，你可以在应用界面上看到你的 OneDrive 账户。点击旁边的勾按钮，以在重启后自动挂载 OneDrive。

![Autostart OneDriver mounting][12]

总的来说，OneDriver 是一个可以在 Linux 上访问 OneDrive 的不错的免费工具。它可能无法像 [高级 Insync 服务][13] 那样提供完整的同步设施，但对于有限的需求来说，它做得不错。

如果你使用这个漂亮的工具，请分享你的使用经验。如果你喜欢这个项目，也许可以给它一个 [GitHub 上的星标][5]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/onedriver/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/cloud-services-linux/
[2]: https://itsfoss.com/use-onedrive-on-linux/
[3]: https://itsfoss.com/use-onedrive-linux-rclone/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-linux.png?resize=800%2C450&ssl=1
[5]: https://github.com/jstaf/onedriver
[6]: https://launchpad.net/~jstaf/+archive/ubuntu/onedriver/+packages
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/search-for-onedriver.png?resize=798%2C214&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/onedriver-interface.png?resize=745%2C456&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-login.png?resize=470%2C660&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-permission.png?resize=470%2C660&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/one-drive-mounted-in-linux.png?resize=800%2C491&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/auto-start-onedriver.png?resize=602%2C499&ssl=1
[13]: https://itsfoss.com/recommends/insync/
