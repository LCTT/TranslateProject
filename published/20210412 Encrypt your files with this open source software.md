[#]: subject: (Encrypt your files with this open source software)
[#]: via: (https://opensource.com/article/21/4/open-source-encryption)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13304-1.html)

用开源的 VeraCrypt 加密你的文件
======

> VeraCrypt 提供跨平台的开源文件加密功能。

![](https://img.linux.net.cn/data/attachment/album/202104/17/110244p1g4tbpnw00tqwq3.jpg)

许多年前，有一个名为 [TrueCrypt][2] 的加密软件。它的源码是可以得到的，尽管没有任何人声称曾对它进行过审计或贡献过。它的作者是（至今仍是）匿名的。不过，它是跨平台的，易于使用，而且真的非常有用。

TrueCrypt 允许你创建一个加密的文件“保险库”，在那里你可以存储任何类型的敏感信息（文本、音频、视频、图像、PDF 等）。只要你有正确的口令，TrueCrypt 就可以解密保险库，并在任何运行 TrueCrypt 的电脑上提供读写权限。这是一项有用的技术，它基本上提供了一个虚拟的、可移动的、完全加密的驱动器（除了文件以外），你可以在其中安全地存储你的数据。

TrueCrypt 最终关闭了，但一个名为 VeraCrypt 的替代项目迅速兴起，填补了这一空白。[VeraCrypt][3] 基于 TrueCrypt 7.1a，比原来的版本有许多改进（包括标准加密卷和引导卷的算法的重大变化）。在 VeraCrypt 1.12 及以后的版本中，你可以使用自定义迭代来提高加密安全性。更好的是，VeraCrypt 可以加载旧的 TrueCrypt 卷，所以如果你是 TrueCrypt 用户，可以很容易地将它们转移到 VeraCrypt 上。

### 安装 VeraCrypt

你可以从 [VeraCrypt 下载页面][4] 下载相应的安装文件，之后在所有主流平台上安装 VeraCrypt。

另外，你也可以自己从源码构建它。在 Linux 上，它需要 wxGTK3、makeself 和通常的开发栈（Binutils、GCC 等）。

当你安装后，从你的应用菜单中启动 VeraCrypt。

### 创建一个 VeraCrypt 卷

如果你刚接触 VeraCrypt，你必须先创建一个 VeraCrypt 加密卷（否则，你没有任何东西可以解密）。在 VeraCrypt 窗口中，点击左侧的 “Create Volume” 按钮。

![Creating a volume with VeraCrypt][5]

在出现的 VeraCrypt 的卷创建向导窗口中，选择要创建一个加密文件容器还是要加密整个驱动器或分区。向导将为你的数据创建一个保险库，所以请按照提示进行操作。

在本文中，我创建了一个文件容器。VeraCrypt 容器和其他文件很像：它保存在硬盘、外置硬盘、云存储或其他任何你能想到的存储数据的地方。与其他文件一样，它可以被移动、复制和删除。与大多数其他文件不同的是，它可以_容纳_更多的文件，这就是为什么我认为它是一个“保险库”，而 VeraCrypt 开发者将其称为“容器”。它的开发者将 VeraCrypt 文件称为“容器”，是因为它可以包含其他数据对象；它与 LXC、Kubernetes 和其他现代 IT 机制所流行的容器技术无关。

#### 选择一个文件系统

在创建卷的过程中，你会被要求选择一个文件系统来决定你放在保险库中的文件的存储方式。微软 FAT 格式是过时的、非日志型，并且限制了卷和文件的大小，但它是所有平台都能读写的一种格式。如果你打算让你的 VeraCrypt 保险库跨平台，FAT 是你最好的选择。

除此之外，NTFS 适用于 Windows 和 Linux。开源的 EXT 系列适用于 Linux。

### 挂载 VeraCrypt 加密卷

当你创建了 VeraCrypt 卷，你就可以在 VeraCrypt 窗口中加载它。要挂载一个加密库，点击右侧的 “Select File” 按钮。选择你的加密文件，选择 VeraCrypt 窗口上半部分的一个编号栏，然后点击位于 VeraCrypt 窗口左下角的 “Mount” 按钮。

你挂载的卷在 VeraCrypt 窗口的可用卷列表中，你可以通过文件管理器访问该卷，就像访问一个外部驱动器一样。例如，在 KDE 上，我打开 [Dolphin][7]，进入 `/media/veracrypt1`，然后我就可以把文件复制到我的保险库里。

只要你的设备上有 VeraCrypt，你就可以随时访问你的保险库。在你手动在 VeraCrypt 中挂载之前，文件都是加密的，在那里，文件会保持解密，直到你再次关闭卷。

### 关闭 VeraCrypt 卷

为了保证你的数据安全，当你不需要打开 VeraCrypt 卷时，关闭它是很重要的。这样可以保证数据的安全，不被人窥视，且不被人趁机犯罪。

![Mounting a VeraCrypt volume][8]

关闭 VeraCrypt 容器和打开容器一样简单。在 VeraCrypt 窗口中选择列出的卷，然后点击 “Dismount”。你就不能访问保险库中的文件了，其他人也不会再有访问权。

### VeraCrypt 轻松实现跨平台加密

有很多方法可以保证你的数据安全，VeraCrypt 试图为你提供方便，而无论你需要在什么平台上使用这些数据。如果你想体验简单、开源的文件加密，请尝试 VeraCrypt。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/open-source-encryption

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://en.wikipedia.org/wiki/TrueCrypt
[3]: https://www.veracrypt.fr/en/Home.html
[4]: https://www.veracrypt.fr/en/Downloads.html
[5]: https://opensource.com/sites/default/files/uploads/veracrypt-create.jpg (Creating a volume with VeraCrypt)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://en.wikipedia.org/wiki/Dolphin_%28file_manager%29
[8]: https://opensource.com/sites/default/files/uploads/veracrypt-volume.jpg (Mounting a VeraCrypt volume)
