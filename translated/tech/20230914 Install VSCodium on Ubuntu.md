[#]: subject: "Install VSCodium on Ubuntu"
[#]: via: "https://itsfoss.com/install-vscodium-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Ubuntu 上安装 VSCodium
======

[VSCodium][1] 是 Microsoft VS Code 的“完整开源版本”。

它基本上是 [VS Code][2] 的克隆，去除了所有遥测痕迹。[遥测是用于收集有关应用使用情况的数据][3]。许多开发人员使用它来深入了解改进他们的应用。

从外观和功能来看，这两个编辑器是相同的。

![VSCodium 与 VS Code 相同][4]

在 Ubuntu 上安装 VSCodium 有三种方法：

   1. 从发布页面下载 deb 文件进行安装。缺点是你无法轻松更新它，因为你必须再次下载新的 deb 文件。
   2. 将第三方开发者仓库（[VSCodium][5]推荐）添加到你的系统中。这样，你还可以获得 VSCodium 新版本的定期更新。
   3. 使用 snap 版本。如果你不厌恶 Snap 软件包，这也许是最简单的方法。



我不会讨论第一种方法，因为它只是从[发布页面][7]下载并[安装 deb 文件][6]。

我们来看看另外两种方法。

### 方法 1：通过添加外部仓库来安装 VSCodium

VSCodium 官方文档引用了 [Pavlo Rudy 的 GitLab 仓库][8]，它为你提供了 VSCodium 的持续更新版本。

📋

虽然我在这里使用 Ubuntu，但这些步骤应该适用于 Debian 和其他基于 Debian 和 Ubuntu 的发行版。

以下是步骤。

[在Ubuntu中打开终端][9]并使用以下命令获取开发者的 GPG 签名密钥并将其添加到你的系统中。这样，你的 Ubuntu 系统将信任该开发人员签名的软件包。

````

     sudo wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg -O /usr/share/keyrings/vscodium-archive-keyring.asc

````

![Adding the GPG signature key for VSCodium repository][10]

下一步是将仓库添加到[你系统的 sources.list 文件][11]。这样，你的 Ubuntu 系统就会知道应该从哪里获取包。

````

     echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main'| sudo tee /etc/apt/sources.list.d/vscodium.list

````

![Adding the VSCodium repo to sources.list][12]

正如你所看到的，该条目中的仓库是由你在其上方添加的密钥签名的。

更新本地包缓存，以便你的系统能够识别新添加的仓库中的包。

````

     sudo apt update

````

现在你已准备好在 Ubuntu 上安装 VSCodium：

````

     sudo apt install codium

````

是的，该软件包名为 `codium`，而不是 `vscodium`。

![][13]

很好！ 现在你可以在菜单中查找 VSCodium 并从那里启动应用：

![][14]

现在你可以在 VSCodium 中享受编码的乐趣。

#### 更新 VSCodium

好处是你已将仓库添加到系统中。当新的 VSCodium 发布时，仓库维护者会将新版本推送到仓库，你应该在系统更新程序中看到新版本。

换句话说，[保持你的 Ubuntu 系统更新][15]，你就会拥有更新版本的 VSCodium。

#### 删除 VSCodium

如果你出于某种原因不想再使用它，可以使用以下命令将其删除：

````

     sudo apt remove codium

````

你可以将仓库和签名添加到你的系统中。

🚧

如果你对这些东西很挑剔，你也可以将它们从系统中删除。使用 sudo [在 Linux 终端中删除文件][16]时要小心一些。

````

     sudo rm /usr/share/keyrings/vscodium-archive-keyring.asc

````

接下来，你还可以从 sources.list 中删除仓库：

````

     sudo rm /etc/apt/sources.list.d/vscodium.list

````

你的主目录中应该有一些与应用相关的本地文件，你可能还想删除它们：

````

     rm -r ~/.config/VSCodium

````

### 方法2：使用 snap 安装 VSCodium

💡

snap 方法适用于任何 Linux 发行版，而不仅仅是 Ubuntu，只要[你在系统上启用了 snap 支持][17]。

snap 安装方法比较简单，步骤也较少。

打开终端并使用以下命令安装 VSCodium snap 包：

````

     sudo snap install codium --classic

````

等待几秒钟，它会下载 Snap 软件包，然后进行安装。你将在屏幕上看到进度，另外

![][18]

**你如何[更新 VSCodium 的 snap 版本][19]**？ Snap 应用每天自动更新多次。但是，如果应用正在运行，那么不会更新。

因此，你也可以关闭任何正在运行的 VSCodium 实例并运行此命令来强制更新（如果有任何新版本）：

````

     sudo snap refresh codium

````

如果你不喜欢它，可以使用以下命令轻松删除它：

````

     sudo snap remove codium

````

### VS Code VS VSCodium

主要区别在于，VSCodium 从 VS Code 中移除了遥测部分。除此之外，它还是微软项目的克隆版，在外观和功能上与著名的 VS Code 完全相同。

对于某些人来说，遥测可能是一个障碍，因此这个项目在开源社区中颇受欢迎。

下面是一篇关于 [VS Code 遥测问题][20]的好文章。

![][21]

如果你能接受遥测部分，你可以[在 Ubuntu 上轻松安装 VS Code][22]。这确实是你的选择。

希望本教程对你在 Ubuntu 和其他基于 Debian 的发行版上安装 VSCodium 有所帮助。请在评论区留下你的反馈意见。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vscodium-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/vscodium/
[2]: https://code.visualstudio.com/
[3]: https://code.visualstudio.com/docs/getstarted/telemetry
[4]: https://itsfoss.com/content/images/2023/09/vscodium-interface.png
[5]: https://vscodium.com/
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://github.com/VSCodium/vscodium/releases
[8]: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo
[9]: https://itsfoss.com/open-terminal-ubuntu/
[10]: https://itsfoss.com/content/images/2023/09/add-vscodium-signature-key.png
[11]: https://itsfoss.com/sources-list-ubuntu/
[12]: https://itsfoss.com/content/images/2023/09/add-vscodium-repo-ubuntu.png
[13]: https://itsfoss.com/content/images/2023/09/install-vscodium-ubuntu.png
[14]: https://itsfoss.com/content/images/2023/09/vscodium-ubuntu.png
[15]: https://itsfoss.com/update-ubuntu/
[16]: https://itsfoss.com/delete-files-folders-linux/
[17]: https://itsfoss.com/install-snap-linux/
[18]: https://itsfoss.com/content/images/2023/09/snap-install-codium.png
[19]: https://itsfoss.com/snap-update/
[20]: https://www.roboleary.net/tools/2022/04/20/vscode-telemetry.html
[21]: https://www.roboleary.net/assets/logo/prod/logo.svg
[22]: https://itsfoss.com/install-visual-studio-code-ubuntu/
