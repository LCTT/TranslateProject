4 月 COPR 中 4 个新的酷项目
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)
COPR 是一个人仓库[收集][1]，它不在 Fedora 中运行。某些软件不符合易于打包的标准。或者它可能不符合其他 Fedora 标准，尽管它是免费且开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施支持或项目签名。但是，它可能是尝试新软件或实验软件的一种很好的方式。

这是 COPR 中一系列新的和有趣的项目。

### Anki

[Anki][2] 是一个程序，它使用间隔重复帮助你学习和记忆事物。你可以创建卡片并将其组织成卡组，或下载[现有卡组][3]。卡片的一面有问题，另一面有答案。它可能还包括图像、视频或音频。你对每张卡的回答好坏决定了你将来看到特定卡的频率。

虽然 Anki 已经在 Fedora 中，但这个仓库提供了一个更新的版本。

![][4]

#### 安装说明

仓库目前为 Fedora 27、28 和 Rawhide 提供 Anki。要安装 Anki，请使用以下命令：
```
sudo dnf copr enable thomasfedb/anki
sudo dnf install anki

```

### Fd

[Fd][5] 是一个命令行工具，它是简单而稍快的替代 [find][6] 的方法。它可以并行地查找项目。fd 也使用彩色输出，并默认忽略隐藏文件和 .gitignore 中指定模式的文件。

#### 安装说明

仓库目前为 Fedora 26、27、28 和 Rawhide 提供 fd。要安装 fd，请使用以下命令：
```
sudo dnf copr enable keefle/fd
sudo dnf install fd

```

### KeePass

[KeePass][7]是一个密码管理器。它将所有密码保存在一个由主密钥或密钥文件锁定的端对端加密数据库中。密码可以组织成组并由程序的内置生成器生成。其他功能包括自动输入，它可以为选定的表单输入用户名和密码。

虽然 KeePass 已经在 Fedora 中，但这个仓库提供了最新版本。

![][8]

#### 安装说明

仓库目前为 Fedora 26 和 27 提供 KeePass。要安装 KeePass，请使用以下命令：
```
sudo dnf copr enable mavit/keepass
sudo dnf install keepass

```

### jo

[Jo][9] 是一个将输入转换为 JSON 字符串或数组的命令行工具。它有一个简单的[语法][10]并识别布尔值、字符串和数字。另外，jo 支持嵌套并且可以嵌套自己的输出。

#### 安装说明

目前，仓库为 Fedora 26、27 和 Rawhide 以及 EPEL 6 和 7 提供 jo。要安装 jo，请使用以下命令：
```
sudo dnf copr enable ganto/jo
sudo dnf install jo

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-try-copr-april-2018/

作者：[Dominik Turecek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://copr.fedorainfracloud.org/
[2]:https://apps.ankiweb.net/
[3]:https://ankiweb.net/shared/decks/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/03/anki.png
[5]:https://github.com/sharkdp/fd
[6]:https://www.gnu.org/software/findutils/
[7]:https://keepass.info/
[8]:https://fedoramagazine.org/wp-content/uploads/2018/03/keepass.png
[9]:https://github.com/jpmens/jo
[10]:https://github.com/jpmens/jo/blob/master/jo.md
