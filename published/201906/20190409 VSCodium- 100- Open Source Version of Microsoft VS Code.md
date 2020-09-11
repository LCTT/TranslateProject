[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11023-1.html)
[#]: subject: (VSCodium: 100% Open Source Version of Microsoft VS Code)
[#]: via: (https://itsfoss.com/vscodium/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

VSCodium：100% 开源的 VS Code
======

> VSCodium 是微软流行的 Visual Studio Code 编辑器的一个分支。它与 VS Code 完全相同，唯一不同的是，VSCodium 不跟踪你的使用数据。

微软的 [Visual Studio Code][1] 是一个出色的编辑器，不仅对于 Web 开发人员，也适合其他程序员。由于它的功能，它被认为是最好的开源代码编辑器之一。

是的，它是微软众多开源产品之一。因为有 DEB、RPM 和 Snap 包形式的二进制文件，你可以[在 Linux 中轻松安装 Visual Studio Code][2]。

但它存在一个问题，对于普通用户而言可能不是问题，但对于纯粹开源主义者而言是重要的。

Microsoft 说提供的二进制文件是不开源的。

感到困惑么？让我解释下。

VS Code 的源码是在 MIT 许可下开源的。你可以在 [GitHub][3] 上访问它。但是，[Microsoft 创建的安装包含专有的跟踪程序][4]。

此跟踪基本上用来收集使用数据并将其发送给 Microsoft 以“帮助改进其产品和服务”。如今，远程报告在软件产品中很常见。即使 [Ubuntu 也这样做，但它透明度更高][5]。

你可以[在 VS Code 中禁用远程报告][6]，但是你能完全信任微软吗？如果答案是否定的，那你有什么选择？

你可以从源代码构建它，从而保持全都是开源的。但是如今[从源代码安装][7]并不总是最好的选择，因为我们习惯于使用二进制文件。

另一种选择是使用 VSCodium ！

### VSCodium：100％ 开源形式的 Visual Studio Code

![][8]

[VSCodium][9] 是微软 Visual Studio Code 的一个分支。该项目的唯一目的是为你提供现成的二进制文件，而没有 Microsoft 的远程收集代码。

这解决了你想在去掉 Microsoft 的专有代码的情况下使用 VS Code ，而你又不习惯从源代码构建它的问题。

由于 [VSCodium 是 VS Code 的一个分支][11]，它的外观和功能与 VS Code 完全相同。

这是 Ubuntu 中第一次运行 VS Code 和 VSCodium 的截图。你能分辨出来吗？

![Can you guess which is VSCode and VSCodium?][12]

如果你无法区分这两者，请看下面。

![That’s Microsoft][13]

除此之外，还有两个应用的 logo，没有其他明显的区别。

![VSCodium and VS Code in GNOME Menu][14]

#### 在 Linux 上安装 VSCodium

虽然 VSCodium 存在于某些发行版（如 Parrot OS）中，但你必须在其他 Linux 发行版中添加额外的仓库。

在基于 Ubuntu 和 Debian 的发行版上，你可以使用以下命令安装 VSCodium。

首先，添加仓库的 GPG 密钥：

```
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
```

然后添加仓库：

```
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
```

现在更新你的系统并安装 VSCodium：

```
sudo apt update && sudo apt install codium
```

你可以在它的页面上找到[其他发行版的安装说明][15]。你还应该阅读[有关从 VS Code 迁移到 VSCodium 的说明][16]。

### 你如何看待 VSCodium？

就个人而言，我喜欢 VSCodium 的概念。说的老套一点，它的初心是好的。我认为，致力于开源的 Linux 发行版甚至可能开始将其包含在官方仓库中。

你怎么看？是否值得切换到 VSCodium 或者你选择关闭远程报告并继续使用 VS Code？

请不要出现“我使用 Vim” 的评论 :D

--------------------------------------------------------------------------------

via: https://itsfoss.com/vscodium/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://code.visualstudio.com/
[2]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[3]: https://github.com/Microsoft/vscode
[4]: https://github.com/Microsoft/vscode/issues/60#issuecomment-161792005
[5]: https://itsfoss.com/ubuntu-data-collection-stats/
[6]: https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting
[7]: https://itsfoss.com/install-software-from-source-code/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/vscodium.png?resize=800%2C450&ssl=1
[9]: https://vscodium.com/
[11]: https://github.com/VSCodium/vscodium
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/vscodium-vs-vscode.png?resize=800%2C450&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/microsoft-vscode-tracking.png?resize=800%2C259&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/vscodium-and-vscode.jpg?resize=800%2C220&ssl=1
[15]: https://vscodium.com/#install
[16]: https://vscodium.com/#migrate
