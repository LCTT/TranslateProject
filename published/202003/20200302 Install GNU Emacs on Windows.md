[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11971-1.html)
[#]: subject: (Install GNU Emacs on Windows)
[#]: via: (https://opensource.com/article/20/3/emacs-windows)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在 Windows 上安装 GNU Emacs
======

> 即使你的操作系统是闭源的，你仍然可以使用这个流行的开源文本编辑器。

![](https://img.linux.net.cn/data/attachment/album/202003/08/094942ihwcnsqojnup46wo.jpg)

GNU Emacs 是一个专为各种程序员设计的流行的文本编辑器。因为它是在 Unix 上开发的，并在 Linux（macOS 中也有）上得到了广泛使用，所以人们有时没有意识到它也可用于微软 Windows 上。你也无需成为有经验的或专职的程序员即可使用 Emacs。只需单击几下就可以下载并安装 Emacs，本文向你展示了如何进行。

你可以手动安装 Windows，也可以使用包管理器安装，例如 [Chocolatey][2]。

### 7-zip

如果还没在 Windows 中安装 7-zip，那么就先安装它。[7-zip][3] 是一个开源的归档程序，能够创建和解压 ZIP、7z、TAR、XZ、BZIP2 和 GZIP（以及更多）文件。对于 Windows 用户来说，这是一个宝贵的工具。

安装 7-zip 后，在 Windows 资源管理器中浏览文件时，右键单击菜单中就有新的 7-zip 归档选项。

### Powershell 和 Chocolatey

要在 Windows 上使用 Chocolatey 安装 GNU Emacs ：

```
PS> choco install emacs-full
```

安装后，在 Powershell 中启动 Emacs：

```
PS> emacs
```

![Emacs running on Windows][4]

### 下载适用于 Windows 的 GNU Emacs

要在 Windows 上手动安装 GNU Emacs，你必须[下载 Emacs][5]。

![GNU Windows downloader][6]

它会打开连接到离你最近的服务器，并展示所有可用的 Emacs 版本。找到发行版本号最高的目录，然后单击进入。Windows 有许多不同的 Emacs 构建，但是最通用的版本只是被命名为 `emacs-VERSION-ARCHITECTURE.zip`。`VERSION` 取决于你要下载的版本，而 `ARCHITECTURE` 取决于你使用的是 32 位还是 64 位计算机。大多数现代计算机都是 64 位的，但是如果你有疑问，可以下载 32 位版本，它可在两者上运行。

如果要下载 64 位计算机的 Emacs v26，你应该点击 `emacs-26.2-x86_64.zip` 的链接。有较小的下载包（例如 “no-deps” 等），但是你必须熟悉如何从源码构建 Emacs，知道它需要哪些库以及你的计算机上已经拥有哪些库。通常，获取较大版本的 Emacs 最容易，因为它包含了在计算机上运行所需的一切。

### 解压 Emacs

接下来，解压下载的 ZIP 文件。要解压缩，请右键单击 Emacs ZIP 文件，然后从 7-zip 子菜单中选择 “Extract to Emacs-VERSION”。这是一个很大的压缩包，因此解压可能需要一段时间，但是完成后，你将拥有一个新目录，其中包含与 Emacs 一起分发的所有文件。例如，在此例中，下载了 `emacs-26.2-x86_64.zip`，因此解压后的目录为 `emacs-26.2-x86_64`。

### 启动 Emacs

在 Emacs 目录中，找到 `bin` 目录。此文件夹存储随 Emacs 一起分发的所有二进制可执行文件（EXE 文件）。双击 `emacs.exe` 文件启动应用。

![Emacs running on Windows][7]

你可以在桌面上创建 `emacs.exe` 的快捷方式，以便于访问。

### 学习 Emacs

Emacs 并不像传闻那样难用。它具有自己的传统和惯例，但是当你其中输入文本时，你可以像在记事本或者网站的文本框中那样使用它。

重要的区别是在你*编辑*输入的文本时。

但是，学习的唯一方法是开始使用它，因此，使 Emacs 成为完成简单任务的首选文本编辑器。当你通常打开记事本、Word 或 Evernote 或其他工具来做快速笔记或临时记录时，请启动 Emacs。

Emacs 以基于终端的应用而闻名，但它显然有 GUI，因此请像使用其他程序一样经常使用它的 GUI。从菜单而不是使用键盘复制、剪切和粘贴（paste）（或用 Emacs 的术语 “yank”），然后从菜单或工具栏打开和保存文件。从头开始，并根据应用本身来学习它，而不是根据你以往对其他编辑器的经验就认为它应该是怎样。

- 下载[速查表][8]！

感谢 Matthias Pfuetzner 和 Stephen Smoogen。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/emacs-windows

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://github.com/chocolatey/choco
[3]: https://www.7-zip.org/
[4]: https://opensource.com/sites/default/files/uploads/windows-ps-choco-emacs.jpg (Emacs running on Windows)
[5]: https://www.gnu.org/software/emacs/download.html
[6]: https://opensource.com/sites/default/files/uploads/windows-emacs-download.jpg (GNU Windows downloader)
[7]: https://opensource.com/sites/default/files/uploads/windows-emacs.jpg (Emacs running on Windows)
[8]: https://opensource.com/downloads/emacs-cheat-sheet
