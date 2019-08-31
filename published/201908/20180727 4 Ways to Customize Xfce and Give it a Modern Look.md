4 种方式来自定义 Xfce 来给它一个现代化外观
======

> Xfce 是一个非常轻量的桌面环境，但它有一个缺点，它看起来有点老旧。但是你没有必要坚持默认外观。让我们看看你可以自定义 Xfce 的各种方法，来给它一个现代化的、漂亮的外观。

![Customize Xfce desktop envirnment][1]

首先，Xfce 是最[受欢迎的桌面环境][2]之一。作为一个轻量级桌面环境，你可以在非常低的资源上运行 Xfce，并且它仍然能很好地工作。这是为什么很多[轻量级 Linux 发行版][3]默认使用 Xfce 的原因之一。

一些人甚至喜欢在高端设备上使用它，说明它的简单性、易用性和非资源依赖性是主要原因。

[Xfce][4] 自身很小，而且只提供你需要的东西。令人烦恼的一点是会令人觉得它的外观和感觉很老了。然而，你可以简单地自定义 Xfce 以使其看起来现代化和漂亮，但又不会像 Unity/GNOME 会话那样占用系统资源。

### 4 种方式来自定义 Xfce 桌面

让我们看看一些方法，我们可以通过这些方法改善你的 Xfce 桌面环境的外观和感觉。

默认 Xfce 桌面环境看起来有些像这样：

![Xfce default screen][5]

如你所见，默认 Xfce 桌面有点乏味。我们将使用主题、图标包以及更改默认 dock 来使它看起来新鲜和有点惊艳。

#### 1. 在 Xfce 中更改主题

我们将做的第一件事是从 [xfce-look.org][6] 中找到一款主题。我最喜欢的 Xfce 主题是 [XFCE-D-PRO][7]。

你可以从[这里][8]下载主题，并提取到某处。

你可以复制提取出的这些主题文件到你的家目录中的 `.theme` 文件夹。如果该文件夹尚不存在，你可以创建一个，同样的道理，图标需要放在一个在家目录中的 `.icons` 文件夹。

打开 **设置 > 外观 > 样式** 来选择该主题，注销并重新登录以查看更改。默认的 Adwaita-dark 也是一个不错的主题。

![Appearance Xfce][9]

你可以在 Xfce 上使用各种[好的 GTK 主题][10]。

#### 2. 在 Xfce 中更改图标

Xfce-look.org 也提供你可以下载的图标主题，提取并放置图标到你的家目录中 `.icons` 目录。在你添加图标主题到 `.icons` 目录中后，转到 **设置 > 外观 > 图标** 来选择这个图标主题。

![Moka icon theme][11]

我已经安装 [Moka 图标集][12] ，它看起来令人惊艳。

![Moka theme][13]

你也可以参考我们[令人惊艳的图标主题][14]列表。

##### 可选: 通过 Synaptic 安装主题

如果你想避免手工搜索和复制文件，在你的系统中安装 Synaptic 软件包管理器。你可以通过网络来查找最佳的主题和图标集，使用 synaptic 软件包管理器，你可以搜索和安装主题。

```
sudo apt-get install synaptic
```

**通过 Synaptic 搜索和安装主题/图标**

打开 synaptic，并在**搜索**上单击。输入你期望的主题名，接下来，它将显示匹配主题的列表。勾选所有更改所需的附加依赖，并在**应用**上单击。这些操作将下载主题和安装主题。

![Arc Theme][15]

在安装后，你可以打开**外观**选项来选择期望的主题。

在我看来，这不是在 Xfce 中安装主题的最佳方法。

#### 3. 在 Xfce 中更改桌面背景

再强调一次，默认 Xfce 桌面背景也不错。但是你可以把桌面背景更改成与你的图标和主题相匹配的东西。

为在 Xfce 中更改桌面背景，在桌面上右击，并单击**桌面设置**。从文件夹选择中选择**背景**，并选择任意一个默认背景或自定义背景。

![Changing desktop wallpapers][16]

#### 4. 在 Xfce 中更改 dock

默认 dock 也不错，恰如其分。但是，再强调一次，它看来有点平平淡淡。

![Docky][17]

不过，如果你想你的 dock 变得更好，并带有更多一点的自定义选项，你可以安装另一个 dock 。

Plank 是一个简单而轻量级的、高度可配置的 dock。

为安装 Plank ，使用下面的命令：

```
sudo apt-get install plank
```

如果 Plank 在默认存储库中没有，你可以从这个 PPA 中安装它。

```
sudo add-apt-repository ppa:ricotz/docky
sudo apt-get update
sudo apt-get install plank
```

在你使用 Plank 前，你应该通过右键单击移除默认的 dock，并在**面板设置**下，单击**删除**。

在完成后，转到 **附件 > Plank** 来启动 Plank dock 。

![Plank][18]

Plank 从你正在使用的图标主题中选取图标。因此，如果你更改图标主题，你也将在 dock 中看到相关的更改。

### 总结

XFCE 是一个轻量级、快速和高度可自定义的桌面环境。如果你的系统资源有限，它服务很好，并且你可以简单地自定义它来看起来更好。这是在应用这些步骤后，我的屏幕的外观。

![XFCE desktop][19]

这只是半个小时的努力成果，你可以使用不同的主题/图标自定义使它看起来更好。请随意在评论区分享你自定义的 XFCE 桌面屏幕，以及你正在使用的主题和图标组合。

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-xfce/

作者：[Ambarish Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/xfce-customization.jpeg
[2]:https://itsfoss.com/best-linux-desktop-environments/
[3]:https://itsfoss.com/lightweight-linux-beginners/
[4]:https://xfce.org/
[5]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/06/1-1-800x410.jpg
[6]:http://xfce-look.org
[7]:https://www.xfce-look.org/p/1207818/XFCE-D-PRO
[8]:https://www.xfce-look.org/p/1207818/startdownload?file_id=1523730502&file_name=XFCE-D-PRO-1.6.tar.xz&file_type=application/x-xz&file_size=105328&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1523730502%2Fs%2F6019b2b57a1452471eac6403ae1522da%2Ft%2F1529360682%2Fu%2F%2FXFCE-D-PRO-1.6.tar.xz
[9]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/4.jpg
[10]:https://itsfoss.com/best-gtk-themes/
[11]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/6.jpg
[12]:https://snwh.org/moka
[13]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/11-800x547.jpg
[14]:https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[15]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/5-800x531.jpg
[16]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/7-800x546.jpg
[17]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/8.jpg
[18]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/9.jpg
[19]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/10-800x447.jpg
