2018 年 10 月在 COPR 中值得尝试的 4 个很酷的新项目
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR是软件的个人存储库的[集合] [1]，它不在标准的 Fedora 仓库中携带。某些软件不符合允许轻松打包的标准。或者它可能不符合其他 Fedora 标准，尽管它是免费和开源的。COPR 可以在标准的 Fedora 包之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己签名的。但是，它是尝试新的或实验性软件的一种很好的方法。

这是 COPR 中一组新的有趣项目。

### GitKraken

[GitKraken][2] 是一个有用的 git 客户端，它适合喜欢图形界面而非命令行的用户，并提供你期望的所有功能。此外，GitKraken 可以创建仓库和文件，并具有内置编辑器。GitKraken 的一个有用功能是暂存行或者文件，并快速切换分支。但是，在某些情况下，在遇到较大项目时会有性能问题。

![][3]

#### 安装说明

该仓库目前为 Fedora 27、28、29 、Rawhide 以及 OpenSUSE Tumbleweed 提供 GitKraken。要安装 GitKraken，请使用以下命令：

```
sudo dnf copr enable elken/gitkraken
sudo dnf install gitkraken
```

### Music On Console

[Music On Console][4] 播放器或称为 mocp，是一个简单的控制台音频播放器。它有一个类似于 “Midnight Commander” 的界面，并且很容易使用。你只需进入包含音乐的目录，然后选择要播放的文件或目录。此外，mocp 提供了一组命令，允许直接从命令行进行控制。

![][5]

#### 安装说明

该仓库目前为 Fedora 28 和 29 提供 Music On Console 播放器。要安装 mocp，请使用以下命令：

```
sudo dnf copr enable Krzystof/Moc
sudo dnf install moc
```

### cnping

[Cnping][6]是小型的图形化 ping IPv4 工具，可用于可视化显示 RTT 的变化。它提供了一个选项来控制每个数据包之间的间隔以及发送的数据大小。除了显示的图表外，cnping 还提供 RTT 和丢包的基本统计数据。

![][7]

#### 安装说明

该仓库目前为 Fedora 27、28、29 和 Rawhide 提供 cnping。要安装 cnping，请使用以下命令：

```
sudo dnf copr enable dreua/cnping
sudo dnf install cnping
```

### Pdfsandwich

[Pdfsandwich][8] 是将文本添加到图像形式的文本 PDF 文件 (如扫描书籍) 的工具。它使用光学字符识别  (OCR)  创建一个额外的图层, 包含了原始页面已识别的文本。这对于复制和处理文本很有用。

#### 安装说明

该仓库目前为 Fedora 27、28、29、Rawhide 以及 EPEL 7 提供 pdfsandwich。要安装 pdfsandwich，请使用以下命令：

```
sudo dnf copr enable merlinm/pdfsandwich
sudo dnf install pdfsandwich
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-try-copr-october-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org
[b]: https://github.com/lujun9972
[1]: https://copr.fedorainfracloud.org/
[2]: https://www.gitkraken.com/git-client
[3]: https://fedoramagazine.org/wp-content/uploads/2018/10/copr-gitkraken.png
[4]: http://moc.daper.net/
[5]: https://fedoramagazine.org/wp-content/uploads/2018/10/copr-mocp.png
[6]: https://github.com/cnlohr/cnping
[7]: https://fedoramagazine.org/wp-content/uploads/2018/10/copr-cnping.png
[8]: http://www.tobias-elze.de/pdfsandwich/
