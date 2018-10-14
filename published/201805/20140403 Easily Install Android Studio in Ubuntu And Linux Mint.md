在 Ubuntu 和 Linux Mint 中轻松安装 Android Studio
======

[Android Studio][1] 是谷歌自己的 Android 开发 IDE，是带 ADT 插件的 Eclipse 的不错替代品。Android Studio 可以通过源代码安装，但在这篇文章中，我们将看到**如何在 Ubuntu 18.04、16.04 和相应的 Linux Mint 变体**中安装 Android Studio。

在继续安装 Android Studio 之前，请确保你已经[在 Ubuntu 中安装了 Java][2]。

![How to install Android Studio in Ubuntu][3]

### 使用 Snap 在 Ubuntu 和其他发行版中安装 Android Studio

自从 Ubuntu 开始专注于 Snap 软件包以来，越来越多的软件开始提供易于安装的 Snap 软件包。Android Studio 就是其中之一。Ubuntu 用户可以直接在软件中心找到 Android Studio 程序并从那里安装。

![Install Android Studio in Ubuntu from Software Center][4]

如果你在软件中心安装 Android Studio 时看到错误，则可以使用[ Snap 命令][5] 安装 Android Studio。

```
sudo snap install android-studio --classic
```

非常简单！

### 另一种方式 1：在 Ubuntu 中使用 umake 安装 Android Studio

你也可以使用 Ubuntu Developer Tools Center，现在称为 [Ubuntu Make][6]，轻松安装 Android Studio。Ubuntu Make 提供了一个命令行工具来安装各种开发工具和 IDE 等。Ubuntu Make 在 Ubuntu 仓库中就有。

要安装 Ubuntu Make，请在终端中使用以下命令：

```
sudo apt-get install ubuntu-make
```

安装 Ubuntu Make 后，请使用以下命令在 Ubuntu 中安装 Android Studio：

```
umake android
```

在安装过程中它会给你的几个选项。我认为你可以处理。如果你决定卸载 Android Studio，则可以按照以下方式使用相同的 umake 工具：

```
umake android --remove

```

### 另一种方式 2：通过非官方的 PPA 在 Ubuntu 和 Linux Mint 中安装 Android Studio

感谢 [Paolo Ratolo][7]，我们有一个 PPA，可用于 Ubuntu 16.04、14.04、Linux Mint 和其他基于 Ubuntu 的发行版中轻松安装 Android Studio。请注意，它将下载大约 650MB 的数据。请注意你的互联网连接以及数据费用（如果有的话）。

打开一个终端并使用以下命令：

```
sudo apt-add-repository ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install android-studio
```

这不容易吗？虽然从源代码安装程序很有趣，但拥有这样的 PPA 总是不错的。我们看到了如何安装 Android Studio，现在来看看如何卸载它。

### 卸载 Android Studio：

如果你还没有安装 PPA Purge：

```
sudo apt-get install ppa-purge
```

现在使用 PPA Purge 来清除已安装的 PPA：

```
sudo apt-get remove android-studio
sudo ppa-purge ppa:paolorotolo/android-studio
```

就是这些了。我希望这能够帮助你**在 Ubuntu 和 Linux Mint 上安装 Android Studio**。在运行 Android Studio 之前，请确保[在 Ubuntu 中安装了Java][8]。在类似的文章中，我建议你阅读[如何安装和配置 Ubuntu SDK ][9]和[如何在 Ubuntu 中轻松安装 Microsoft Visual Studio][10]。

欢迎提出任何问题或建议。再见 ：）

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-android-studio-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:http://developer.android.com/sdk/installing/studio.html
[2]:https://itsfoss.com/install-java-ubuntu-1404/
[3]:https://itsfoss.com/wp-content/uploads/2014/04/Android_Studio_Ubuntu.jpeg
[4]:https://itsfoss.com/wp-content/uploads/2014/04/install-android-studio-snap-800x469.jpg
[5]:https://itsfoss.com/install-snap-linux/
[6]:https://wiki.ubuntu.com/ubuntu-make
[7]:https://plus.google.com/+PaoloRotolo
[8]:https://itsfoss.com/install-java-ubuntu-1404/ (How To Install Java On Ubuntu 14.04)
[9]:https://itsfoss.com/install-configure-ubuntu-sdk/
[10]:https://itsfoss.com/install-visual-studio-code-ubuntu/
