dupeGuru - 直接从硬盘中查找并移除重复文件
================================================================================

### 简介 ###

对我们来说，磁盘被装满是棘手问题之一。无论我们如何小心谨慎，我们总可能将相同的文件复制到多个不同的地方，或者在不知情的情况下，重复下载了同一个文件。因此，迟早你会看到“磁盘已满”的错误提示，若此时我们确实需要一些磁盘空间来存储重要数据，以上情形无疑是最糟糕的。假如你确信自己的系统中有重复文件，那么 **dupeGuru** 可能会帮助到你。

dupeGuru 团队也开发了名为 **dupeGuru 音乐版** 的应用来移除重复的音乐文件，和名为 **dupeGuru 图片版** 的应用来移除重复的图片文件。

### 1. dupeGuru (标准版) ###

需要告诉那些不熟悉 [dupeGuru][1] 的人，它是一个免费、开源、跨平台的应用，其用途是在系统中查找和移除重复文件。它可以在 Linux, Windows, 和 Mac OS X 等平台下使用。通过使用一个快速的模糊匹配算法，它可以在几分钟内找到重复文件。同时，你还可以调整 dupeGuru 使它去精确查找特定文件类型的重复文件，以及从你想删除的文件中，清除某种文件。它支持英语、 法语、 德语、 中文 （简体）、 捷克语、 意大利语、亚美尼亚语、俄语、乌克兰语、巴西语和越南语。

#### 在 Ubuntu 14.10/14.04/13.10/13.04/12.04 中安装 dupeGuru ####

dupeGuru 开发者已经构建了一个 Ubuntu PPA (Personal Package Archives)来简化安装过程。想要安装 dupeGuru，依次在终端中键入以下命令：

```
sudo apt-add-repository ppa:hsoft/ppa
sudo apt-get update
sudo apt-get install dupeguru-se
```

### 使用 ###

使用非常简单，可从 Unity 面板或菜单中启动 dupeGuru。

![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/11/dupeGuru_007.png)

点击位于底部的 `+` 按钮来添加你想扫描的文件目录。点击 `扫描` 按钮开始查找重复文件。

![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/11/dupeGuru_008.png)

一旦所选目录中含有重复文件，那么它将在窗口中展示重复文件。正如你所看到的，在下面的截图中，我的下载目录中有一个重复文件。

![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/11/dupeGuru-Results_009.png)

现在，你可以决定下一步如何操作。你可以删除这个重复的文件，或者对它进行重命名，抑或是 复制/移动 到另一个位置。为此，选定该重复文件，或在菜单栏中选定写有“**仅显示重复**”选项 ，如果你选择了“**仅显示重复**”选项，则只有重复文件在窗口中可见，这样你便可以轻松选择并删除这些文件。点击“操作”下拉菜单，最后选择你将执行的操作。在这里，我只想删除重复文件，所以我选择了“移动标记文件到垃圾箱”这个选项。

![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/11/Menu_010.png)

接着，点击“继续”选项来移除重复文件。

![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/11/Deletion-Options_011.png)

### 2. dupeGuru 音乐版 ###

[dupeGuru 音乐版][2] 或简称 dupeGuru ME，它的功能与 dupeGuru 类似。它拥有 dupeGuru 的所有功能，但它包含更多的信息列 （如比特率，持续时间，标签等）和更多的扫描类型（如带有字段的文件名，标签以及音频内容）。和 dupeGuru 一样，dupeGuru ME 也运行在 Linux、Windows 和 Mac OS X 中。

它支持众多的格式，诸如 MP3、WMA、AAC (iTunes 格式)、OGG、FLAC，以及失真率较少的 AAC 和 WMA 格式等。

#### 在 Ubuntu 14.10/14.04/13.10/13.04/12.04 中安装 dupeGuru ME ####

现在，我们不必再添加任何 PPA，因为在前面的步骤中，我们已经进行了添加。所以在终端中键入以下命令来安装它：

```
sudo apt-get install dupeguru-me
```

### 使用 ###

你可以从 Unity 面板或菜单中启动它。dupeGuru ME 的使用方法、操作界面以及外观和正常的 dupeGuru 类似。添加你想扫描的目录并选择你想执行的操作。重复的音乐文件就会被删除。

![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/11/dupeGuru-Music-Edition-Results_012.png)

### 3. dupeGuru 图片版 ###

[dupeGuru 图片版][3],或简称为 duepGuru PE，是一个在你的电脑中查找重复图片的工具。它和 dupeGuru 类似，但独具匹配重复图片的功能。dupeGuru PE 可运行在 Linux、Windows 和 Mac OS X 中。

dupeGuru PE 支持 JPG、PNG、TIFF、GIF 和 BMP 等图片格式。所有的这些格式可以被同时比较。Mac OS X 版的 dupeGuru PE 还支持 PSD 和 RAW (CR2 和 NEF) 格式。  

#### 在 Ubuntu 14.10/14.04/13.10/13.04/12.04 中安装 dupeGuru PE ####

由于我们已经添加了 PPA，我们也不必为 dupeGuru PE 再次添加。只需运行如下命令来安装它。

```
sudo apt-get install dupeguru-pe
```

#### 使用 ####

就使用方法，操作界面和外观而言，它与 dupeGuru，dupeGuru ME 类似。我就纳闷为什么开发者为不同的类别开发了不同的版本。我想如果开发一个结合以上三个版本功能的应用，或许会更好。

启动它，添加你想扫描的目录，并选择你想执行的操作。就这样，你的重复文件将被清除。

![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/11/dupeGuru-Picture-Edition-Results_014.png)

如果因为任何的安全问题而不能移除某些重复文件，请记下这些文件的位置，通过终端或文件管理器来手动删除它们。

欢呼吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/dupeguru-find-remove-duplicate-files-instantly-hard-drive/

作者：[SK][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.hardcoded.net/dupeguru/
[2]:http://www.hardcoded.net/dupeguru_me/
[3]:http://www.hardcoded.net/dupeguru_pe/
