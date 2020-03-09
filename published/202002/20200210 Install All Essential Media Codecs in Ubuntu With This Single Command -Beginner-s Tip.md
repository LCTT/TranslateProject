[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11906-1.html)
[#]: subject: (Install All Essential Media Codecs in Ubuntu With This Single Command [Beginner’s Tip])
[#]: via: (https://itsfoss.com/install-media-codecs-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

一条命令在 Ubuntu 中安装所有基本的媒体编解码器
======

如果你刚刚安装了 Ubuntu 或其他 [Ubuntu 特色版本][1] 如 Kubuntu、Lubuntu 等，你会注意到系统无法播放某些音频或视频文件。

对于视频文件，你可以[在 Ubuntu 上安装 VLC][2]。[VLC][3] 是 [Linux 上的最佳视频播放器][4]之一，它几乎可以播放任何视频文件格式。但你仍然会遇到无法播放音频和 flash 的麻烦。

好消息是 [Ubuntu][5] 提供了一个软件包来安装所有基本的媒体编解码器：ubuntu-restricted-extras。

![][6]

### 什么是 Ubuntu Restricted Extras？

ubuntu-restricted-extras 是一个包含各种基本软件，如 Flash 插件、[unrar][7]、[gstreamer][8]、mp4、[Ubuntu 中的 Chromium 浏览器][9]的编解码器等的软件包。

由于这些软件不是开源软件，并且其中一些涉及软件专利，因此 Ubuntu 默认情况下不会安装它们。你必须使用 multiverse 仓库，它是 Ubuntu 专门为用户提供非开源软件而创建的仓库。

请阅读本文以[了解有关各种 Ubuntu 仓库的更多信息][10]。

### 如何安装 Ubuntu Restricted Extras？

令我惊讶的是，我发现软件中心未列出 Ubuntu Restricted Extras。不管怎样，你都可以使用命令行安装该软件包，这非常简单。

在菜单中搜索或使用[终端键盘快捷键 Ctrl+Alt+T][11] 打开终端。

由于 ubuntu-restrcited-extras 软件包在 multiverse 仓库中，因此你应验证系统上已启用 multiverse 仓库：

```
sudo add-apt-repository multiverse
```

然后你可以使用以下命令安装：

```
sudo apt install ubuntu-restricted-extras
```

输入回车后，你会被要求输入密码，**当你输入密码时，屏幕不会有显示**。这是正常的。输入你的密码并回车。

它将显示大量要安装的包。按回车确认选择。

你会看到 [EULA][12]（最终用户许可协议），如下所示：

![Press Tab key to select OK and press Enter key][13]

浏览此页面可能会很麻烦，但是请放心。只需按 Tab 键，它将高亮选项。当高亮在正确的选项上，按下回车确认你的选择。

![Press Tab key to highlight Yes and press Enter key][14]

安装完成后，由于新安装的媒体编解码器，你应该可以播放 MP3 和其他媒体格式了。

##### 在 Kubuntu、Lubuntu、Xubuntu 上安装受限制的额外软件包

请记住，Kubuntu、Lubuntu 和 Xubuntu 都有此软件包，并有各自不同的名称。它们本应使用相同的名字，但不幸的是并不是。

在 Kubuntu 上，使用以下命令：

```
sudo apt install kubuntu-restricted-extras
```

在 Lubuntu 上，使用：

```
sudo apt install lubuntu-restricted-extras
```

在 Xubuntu 上，你应该使用：

```
sudo apt install xubuntu-restricted-extras
```

我一直建议将 ubuntu-restricted-extras 作为[安装 Ubuntu 后要做的基本事情][15]之一。只需一个命令即可在 Ubuntu 中安装多个编解码器。

希望你喜欢 Ubuntu 初学者系列中这一技巧。以后，我将分享更多此类技巧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-media-codecs-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/which-ubuntu-install/
[2]: https://itsfoss.com/install-latest-vlc/
[3]: https://www.videolan.org/index.html
[4]: https://itsfoss.com/video-players-linux/
[5]: https://ubuntu.com/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/Media_Codecs_in_Ubuntu.png?ssl=1
[7]: https://itsfoss.com/use-rar-ubuntu-linux/
[8]: https://gstreamer.freedesktop.org/
[9]: https://itsfoss.com/install-chromium-ubuntu/
[10]: https://itsfoss.com/ubuntu-repositories/
[11]: https://itsfoss.com/ubuntu-shortcuts/
[12]: https://en.wikipedia.org/wiki/End-user_license_agreement
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras_1.jpg?ssl=1
[15]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
