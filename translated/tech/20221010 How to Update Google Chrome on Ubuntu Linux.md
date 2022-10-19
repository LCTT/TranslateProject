[#]: subject: "How to Update Google Chrome on Ubuntu Linux"
[#]: via: "https://itsfoss.com/update-google-chrome-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Ubuntu Linux 上更新 Google Chrome
======
你设法在你的 Ubuntu 系统上安装了 Google Chrome 浏览器。现在你想知道如何让浏览器保持更新。

在 Windows 和 macOS 上，当 Chrome 上有可用更新时，你会在浏览器中收到通知，你可以从浏览器中点击更新选项。

Linux 中的情况有所不同。你不会从浏览器更新 Chrome。你要使用系统更新对其进行更新。

是的。当 Chrome 上有可用的新更新时，Ubuntu 会通过系统更新工具通知你。

![当有新版本的 Chrome 可用时，Ubuntu 会发送通知][1]

你只需单击立即安装按钮，在被要求时输入你的帐户密码并将 Chrome 更新到新版本。

让我告诉你为什么会在系统级别看到更新，以及如何在命令行中更新 Google Chrome。

### 方法 1：使用系统更新更新谷歌浏览器

你最初是如何安装 Chrome 的？你从 [Chrome 网站][2]获得了 deb 安装程序文件，并使用它来[在 Ubuntu 上安装 Chrome][3]。

当你这样做时，谷歌会在你系统的源列表中添加一个仓库条目。这样，你的系统就会信任来自 Google 仓库的包。

![Google Chrome 存储库添加到 Ubuntu 系统][4]

对于添加到系统中的所有此类条目，包更新通过 Ubuntu 更新程序集中进行。

这就是为什么当 Google Chrome（和其他已安装的应用）有可用更新时，你的 Ubuntu 系统会向你发送通知。

![Chrome 更新可通过系统更新与其他应用一起使用][5]

**单击“立即安装”按钮并在要求时输入你的密码**。很快，系统将安装所有可升级的软件包。

根据更新偏好，通知可能不是立即的。如果需要，你可以手动运行更新程序工具并查看适用于你的 Ubuntu 系统的更新。

![运行软件更新程序以查看你的系统有哪些可用更新][6]

### 方法 2：在 Ubuntu 命令行中更新 Chrome

如果你更喜欢终端而不是图形界面，你也可以使用命令更新 Chrome。

打开终端，并依次运行以下命令：

```
sudo apt update

sudo apt --only-upgrade install google-chrome-stable
```

第一条命令更新包缓存，以便你的系统知道可以升级哪些包。

第二条命令[仅更新单个包][7]，即 Google Chrome（安装为 google-chrome-stable）。

### 总结

如你所见，Ubuntu 比 Windows 更精简。你会随其他系统更新一起更新 Chrome。

顺便一提，如果你对它不满意，你可以了解[从 Ubuntu 中删除 Google Chrome][8]。

Chrome 是一款不错的浏览器。你可以通过[使用 Chrome 中的快捷方式][9]来试验它，因为它使浏览体验更加流畅。

在 Ubuntu 上享受 Chrome！

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-google-chrome-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2021/06/chrome-edge-update-ubuntu.png
[2]: https://www.google.com/chrome/
[3]: https://itsfoss.com/install-chrome-ubuntu/
[4]: https://itsfoss.com/wp-content/uploads/2021/06/google-chrome-repo-ubuntu.png
[5]: https://itsfoss.com/wp-content/uploads/2021/06/chrome-edge-update-ubuntu.png
[6]: https://itsfoss.com/wp-content/uploads/2022/04/software-updater-ubuntu-22-04.jpg
[7]: https://itsfoss.com/apt-upgrade-single-package/
[8]: https://itsfoss.com/uninstall-chrome-from-ubuntu/
[9]: https://itsfoss.com/google-chrome-shortcuts/