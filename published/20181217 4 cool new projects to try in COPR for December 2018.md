[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10420-1.html)
[#]: subject: (4 cool new projects to try in COPR for December 2018)
[#]: via: (https://fedoramagazine.org/4-try-copr-december-2018/)
[#]: author: (Dominik Turecek https://fedoramagazine.org)

COPR 仓库中 4 个很酷的新软件（2018.12）
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR 是软件的个人存储库的[集合][1]，它包含那些不在标准的 Fedora 仓库中的软件。某些软件不符合允许轻松打包的标准。或者它可能不符合其他 Fedora 标准，尽管它是自由开源的。COPR 可以在标准的 Fedora 包之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，它是尝试新的或实验性软件的一种很好的方法。

这是 COPR 中一组新的有趣项目。

### MindForger

[MindForger][2] 是一个 Markdown 编辑器和笔记本。除了你预期的 Markdown 编辑器的功能之外，MindForger 还允许你将单个文件拆分为多个笔记。组织笔记并在文件之间移动、搜索它们都很容易。我已经使用 MindForger 一段时间来记录学习笔记了，现在可以在 COPR 中找到它啦。

![][3]

#### 安装说明

该仓库目前在 Fedora 29 和 Rawhide 中提供 MindForger。要安装 MindForger，请使用以下命令：

```
sudo dnf copr enable deadmozay/mindforger
sudo dnf install mindforger
```

### Clingo

[Clingo][4] 是使用[回答集编程][5]（ASP）建模语言解决逻辑问题的程序。使用 ASP，你可以将问题声明为一个逻辑程序，然后 Clingo 来解决。最后，Clingo 以逻辑模型的形式产生问题的解决方案，称为回答集。

#### 安装说明

该仓库目前为 Fedora 28 和 29 提供 Clingo。要安装 Clingo，请使用以下命令：

```
sudo dnf copr enable timn/clingo
sudo dnf install clingo
```

### SGVrecord

[SGVrecord][6] 是一个用于录制屏幕的简单工具。它允许你捕获整个屏幕或仅选择其中的一部分。此外，有没有声音都可以进行录制。SGVrecord 以 WebM 格式生成文件。

![][7]

#### 安装说明

该仓库目前为 Fedora 28、29 和 Rawhide 提供 SGVrecord。要安装 SGVrecord，请使用以下命令：

```
sudo dnf copr enable youssefmsourani/sgvrecord
sudo dnf install sgvrecord
```

### Watchman

[Watchman][8] 是一个对文件更改进行监视和记录的服务。你可以为指定 Watchman 监视的目录树，以及定义指定文件发生更改时触发的操作。

#### 安装说明

该仓库目前为 Fedora 29 和 Rawhide 提供 Watchman。要安装 Watchman，请使用以下命令：

```
sudo dnf copr enable eklitzke/watchman
sudo dnf install watchman
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-try-copr-december-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org
[b]: https://github.com/lujun9972
[1]: https://copr.fedorainfracloud.org/
[2]: https://www.mindforger.com/
[3]: https://fedoramagazine.org/wp-content/uploads/2018/12/mindforger.png
[4]: https://potassco.org/clingo/
[5]: https://en.wikipedia.org/wiki/Answer_set_programming
[6]: https://github.com/yucefsourani/sgvrecord
[7]: https://fedoramagazine.org/wp-content/uploads/2018/12/SGVrecord.png
[8]: https://facebook.github.io/watchman/
