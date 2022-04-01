[#]: subject: "Archive files on your Linux desktop with Ark for KDE"
[#]: via: "https://opensource.com/article/22/2/archives-files-linux-ark-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 KDE 的 Ark 在 Linux 桌面上归档文件
======
在 KDE 上创建、检查和扩展压缩的档案。
![手工将 Linux 的文件夹放进抽屉里][1]

当我完成一个项目时，我经常喜欢把为这个项目创建的所有文件放到一个档案中。这不仅可以 [节省空间][2]，而且可以让这些文件远离我的视线，防止它们在我使用 [find][3] 和 [grep][4] 搜索我当前想要的文件时作为结果出现。一旦文件被归档，它们就会被你的文件系统视为一个单独的对象，这意味着你不能像浏览普通文件夹那样来浏览它们。你可以把它们解压缩来列出档案的内容，或者打开一个终端，运行适当的归档命令，比如 [tar][5] 命令。又或者你可以使用一个像 Ark 这样的应用程序来列出、预览、修改和管理你的档案。

### 在 Linux 上安装 Ark

KDE Plasma 桌面预装了 Ark，你也可以从软件包管理器中获取。在 Fedora、Mageia 和类似的系统中，你可以运行：


```shell
$ sudo dnf install ark
```

在 Debian、Elementary 和类似的系统中，你可以运行：


```shell
$ sudo apt install ark
```

你也可以从 [Flathub][7] 上 [获取并安装它的 Flatpak 包][6]。

### 创建一个档案

熟悉归档的最好方法就是自己创建一个档案，然后探索它。所有的这些都可以通过 Ark 来完成。

首先，从你的应用程序菜单中启动 Ark，然后进入<ruby>“归档”<rt>Archive</rt></ruby>菜单，选择<ruby>“新建”<rt>New</rt></ruby>。

![用 Ark 创建一个新的档案][8]

（图源 Seth Kenlon / [CC BY-SA 4.0][9]）

给你的档案设置一个文件名，使用默认的压缩设置，并将档案保存到你的主目录。

Ark 不会自动创建空的档案，但在你设置好名称和位置后，只要你向其中添加文件，Ark 就会立即创建一个档案。

要向即将建立的档案中添加文件，只需将该文件拖入 Ark 窗口即可。

![档案中的内容][10]

（图源 Seth Kenlon / [CC BY-SA 4.0][9]）

归档有两个好处：合并和压缩。通过把文件添加到档案里，你将许多文件整合到了同一个地方。因为它们已经存在于档案中，所以，如果你想要摆脱这些文件的干扰，你完全以把原始的副本删除掉。

要查看你通过压缩文件节省了多少磁盘空间，你可以进入<ruby>“档案”<rt>Archive</rt></ruby>菜单，选择<ruby>“属性”<rt>Properties</rt></ruby>。它会显示出文件在归档前/后的大小，同时还有很多其他有用的元数据。

![档案的属性和元数据][11]

（图源 Seth Kenlon / [CC BY-SA 4.0][9]）

Ark 可以做的事情还有很多，但是现在先关闭 Ark，假装你已经使用完毕。你的档案会在你声明保存它的位置（在这个例子中，它的名字是`example.tar.gz`，位于我的用户主目录中。）

### 查看档案中的文件

Ark 可以打开任何档案，就像打开一个普通的文件夹一样。要在 Ark 中打开一个档案，只需在文件管理器中左键点击它（单击/双击，取决于你的系统设置）。你也可以右键点击它，并选择<ruby>“用 Ark 打开”<rt>Open with Ark</rt></ruby>。

一旦档案在 Ark 中打开，你就可以在文件管理器中进行大部分操作，包括删除文件、添加新文件、预览文件内容等等。

### 从档案中删除文件

有时候，你会把一个文件放到一个你不需要的档案中。此时，当你想从档案中删除一个文件时，你可以右键单击该文件并选择<ruby>“删除”<rt>Delete</rt></ruby>。

![右键菜单][12]

（图源 Seth Kenlon / [CC BY-SA 4.0][9]）

### 向档案中添加文件

向档案中添加文件是更加容易的。你只需从文件管理器中把该文件拖拽到 Ark 里。另外，你也可以选择 Ark 右键菜单中<ruby>“添加文件”<rt>Add Files</rt></ruby>。

### 从档案中提取单个文件

当处理一个档案时，许多人会选择解开整个档案，然后寻找他们真正需要的一两个文件。对于小档案，这勉强说得过去，但对于大档案来说，这会占用你大量的时间和磁盘空间，哪怕只是暂时的。

有了 Ark，你可以只提取你需要的文件，只要把它们从 Ark 窗口拖到你要保存的地方就行。另外，你也可以选择右键菜单中的<ruby>“提取”<rt>Extract</rt></ruby>。

### 预览档案中的文件

事实上，你并不总是需要提取文件。如果你只是需要快速查看一个文件，Ark 或许可以向你展示一个文件的预览，而不需要将其解压到你的硬盘上。

要预览一个文件，在 Ark 中双击它即可。

![在 Ark 中预览一个文件][13]

（图源 Seth Kenlon / [CC BY-SA 4.0][9]）

### 开始归档吧

在 Linux 桌面上管理档案是非常简单和直观的。Ark 是一个很好的归档工具，许多其他的 Linux 桌面也有类似的工具。因此，即使你不使用 Ark，其他类似的工具也能帮助到你。对我来说，归档很大程度上让我保持了文件的有条不紊、节约了磁盘空间。Ark 的存在使得我们可以很方便地和档案打交道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/archives-files-linux-ark-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/21/11/linux-commands-convert-files
[3]: https://opensource.com/article/21/9/linux-find-command
[4]: https://opensource.com/article/21/3/grep-cheat-sheet
[5]: https://opensource.com/article/17/7/how-unzip-targz-file
[6]: https://opensource.com/article/21/11/install-flatpak-linux
[7]: https://flathub.org/apps/details/org.kde.ark
[8]: https://opensource.com/sites/default/files/ark-new.jpg (Creating a new archive in Ark)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/ark-items.jpg (Items in an archive)
[11]: https://opensource.com/sites/default/files/ark-properties.jpg (Archive properties and metadata)
[12]: https://opensource.com/sites/default/files/ark-menu-click-right.jpg (Right-click menu)
[13]: https://opensource.com/sites/default/files/ark-preview.jpg (Previewing a file in Ark)
