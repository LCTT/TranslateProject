[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11796-1.html)
[#]: subject: (Use Stow for configuration management of multiple machines)
[#]: via: (https://opensource.com/article/20/1/configuration-management-stow)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 Stow 管理多台机器配置
======
> 2020 年，在我们的 20 个使用开源提升生产力的系列文章中，让我们了解如何使用 Stow 跨机器管理配置。

![](https://img.linux.net.cn/data/attachment/album/202001/18/141330jdcjalqzjal84a03.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 Stow 管理符号链接

昨天，我解释了如何使用 [Syncthing][2] 在多台计算机上保持文件同步。但是，这只是我用来保持配置一致性的工具之一。还有另一个表面上看起来更简单的工具：[Stow][3]。

![Stow help screen][4]

Stow 管理符号链接。默认情况下，它会链接目录到上一级目录。还有设置源和目标目录的选项，但我通常不使用它们。

正如我在 Syncthing 的[文章][5] 中提到的，我使用 Syncthing 来保持 `myconfigs` 目录在我所有的计算机上一致。`myconfigs` 目录下面有多个子目录。每个子目录包含我经常使用的应用之一的配置文件。

![myconfigs directory][6]

在每台计算机上，我进入 `myconfigs` 目录，并运行 `stow -S <目录名称>` 以将目录中的文件符号链接到我的家目录。例如，在 `vim` 目录下，我有 `.vimrc` 和 `.vim` 目录。在每台机器上，我运行 `stow -S vim` 来创建符号链接 `~/.vimrc` 和 `~/.vim`。当我在一台计算机上更改 Vim 配置时，它会应用到我的所有机器上。

然而，有时候，我需要一些特定于机器的配置，这就是为什么我有如 `msmtp-personal` 和 `msmtp-elastic`（我的雇主）这样的目录。由于我的 `msmtp` SMTP 客户端需要知道要中继电子邮件服务器，并且每个服务器都有不同的设置和凭据，我会使用 `-D` 标志来取消链接，接着链接另外一个。

![Unstow one, stow the other][7]

有时我要给配置添加文件。为此，有一个 `-R` 选项来“重新链接”。例如，我喜欢在图形化 Vim 中使用一种与控制台不同的特定字体。除了标准 `.vimrc` 文件，`.gvimrc` 文件能让我设置特定于图形化版本的选项。当我第一次设置它时，我移动 `~/.gvimrc` 到 `~/myconfigs/vim` 中，然后运行 `stow -R vim`，它取消链接并重新链接该目录中的所有内容。

Stow 让我使用一个简单的命令行在多种配置之间切换，并且，结合 Syncthing，我可以确保无论我身在何处或在哪里进行更改，我都有我喜欢的工具的设置。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/configuration-management-stow

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://syncthing.net/
[3]: https://www.gnu.org/software/stow/
[4]: https://opensource.com/sites/default/files/uploads/productivity_2-1.png (Stow help screen)
[5]: https://linux.cn/article-11793-1.html
[6]: https://opensource.com/sites/default/files/uploads/productivity_2-2.png (myconfigs directory)
[7]: https://opensource.com/sites/default/files/uploads/productivity_2-3.png (Unstow one, stow the other)
