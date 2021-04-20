[#]: subject: (7 Git tips for managing your home directory)
[#]: via: (https://opensource.com/article/21/4/git-home)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13313-1.html)

7个管理家目录的 Git 技巧
======

> 这是我怎样设置 Git 来管理我的家目录的方法。

![](https://img.linux.net.cn/data/attachment/album/202104/20/095224mtq14szo7opfofq7.jpg)

我有好几台电脑。一台笔记本电脑用于工作，一台工作站放在家里，一台树莓派（或四台），一台 [Pocket CHIP][2]，一台 [运行各种不同的 Linux 的 Chromebook][3]，等等。我曾经在每台计算机上或多或少地按照相同的步骤设置我的用户环境，也经常告诉自己让每台计算机都略有不同。例如，我在工作中比在家里更经常使用 [Bash 别名][4]，并且我在家里使用的辅助脚本可能对工作没有用。

这些年来，我对各种设备的期望开始相融，我会忘记我在家用计算机上建立的功能没有移植到我的工作计算机上，诸如此类。我需要一种标准化我的自定义工具包的方法。使我感到意外的答案是 Git。

Git 是版本跟踪软件。它以既可以用在非常大的开源项目也可以用在极小的开源项目而闻名，甚至最大的专有软件公司也在用它。但是它是为源代码设计的，而不是用在一个装满音乐和视频文件、游戏、照片等的家目录。我听说过有人使用 Git 管理其家目录，但我认为这是程序员们进行的一项附带实验，而不是像我这样的现实生活中的用户。

用 Git 管理我的家目录是一个不断发展的过程。随着时间的推移我一直在学习和适应。如果你决定使用 Git 管理家目录，则可能需要记住以下几点。

### 1、文本和二进制位置

![家目录][5]

当由 Git 管理时，除了配置文件之外，你的家目录对于所有内容而言都是“无人之地”。这意味着当你打开主目录时，除了可预见的目录的列表之外，你什么都看不到。不应有任何杂乱无章的照片或 LibreOffice 文档，也不应有 “我就在这里放一分钟” 的临时文件。

原因很简单：使用 Git 管理家目录时，家目录中所有 _未_ 提交的内容都会变成噪音。每次执行 `git status` 时，你都必须翻过去之前 Git 未跟踪的任何文件，因此将这些文件保存在子目录（添加到 `.gitignore` 文件中）至关重要。

许多 Linux 发行版提供了一组默认目录：

   * `Documents`
   * `Downloads`
   * `Music`
   * `Photos`
   * `Templates`
   * `Videos`

如果需要，你可以创建更多。例如，我把创作的音乐（`Music`）和购买来聆听的音乐（`Albums`）区分开来。同样，我的电影（`Cinema`）目录包含了其他人的电影，而视频（`Videos`）目录包含我需要编辑的视频文件。换句话说，我的默认目录结构比大多数 Linux 发行版提供的默认设置更详细，但是我认为这样做有好处。如果没有适合你的目录结构，你更会将其存放在家目录中，因为没有更好的存放位置，因此请提前考虑并规划好适合你的工作目录。你以后总是可以添加更多，但是最好先开始擅长的。

### 2、、设置最优的 `.gitignore`

清理家目录后，你可以像往常一样将其作为 Git 存储库实例化：

```
$ cd
$ git init .
```

你的 Git 仓库中还没有任何内容，你的家目录中的所有内容均未被跟踪。你的第一项工作是筛选未跟踪文件的列表，并确定要保持未跟踪状态的文件。要查看未跟踪的文件：

```
$ git status
  .AndroidStudio3.2/
  .FBReader/
  .ICEauthority
  .Xauthority
  .Xdefaults
  .android/
  .arduino15/
  .ash_history
[...]
```

根据你使用家目录的时间长短，此列表可能很长。简单的是你在上一步中确定的目录。通过将它们添加到名为 `.gitignore` 的隐藏文件中，你告诉 Git 停止将它们列为未跟踪文件，并且永远不对其进行跟踪：

```
$ \ls -lg | grep ^d | awk '{print $8}' >> ~/.gitignore
```

完成后，浏览 `git status` 所示的其余未跟踪文件，并确定是否有其他文件需要排除。这个过程帮助我发现了几个陈旧的配置文件和目录，这些文件和目录最终被我全部丢弃了，而且还发现了一些特定于一台计算机的文件和目录。我在这里非常严格，因为许多配置文件在自动生成时会表现得更好。例如，我从不提交我的 KDE 配置文件，因为许多文件包含了诸如最新文档之类的信息以及其他机器上不存在的其他元素。

我会跟踪我的个性化配置文件、脚本和实用程序、配置文件和 Bash 配置，以及速查表和我经常引用的其他文本片段。如果有软件主要负责维护的文件，则将其忽略。当对一个文件不确定时，我将其忽略。你以后总是可以取消忽略它（通过从 `.gitignore` 文件中删除它）。

### 3、了解你的数据

我使用的是 KDE，因此我使用开源扫描程序 [Filelight][7] 来了解我的数据概况。Filelight 为你提供了一个图表，可让你查看每个目录的大小。你可以浏览每个目录以查看占用了空间的内容，然后回溯调查其他地方。这是一个令人着迷的系统视图，它使你可以以全新的方式看待你的文件。

![Filelight][8]

使用 Filelight 或类似的实用程序查找不需要提交的意外数据缓存。例如，KDE 文件索引器（Baloo）生成了大量特定于其主机的数据，我绝对不希望将其传输到另一台计算机。

### 4、不要忽略你的 `.gitignore` 文件

在某些项目中，我告诉 Git 忽略我的 `.gitignore` 文件，因为有时我要忽略的内容特定于我的工作目录，并且我不认为同一项目中的其他开发人员需要我告诉他们 `.gitignore` 文件应该是什么样子。因为我的家目录仅供我使用，所以我 _不_ 会忽略我的家目录的 `.gitignore` 文件。我将其与其他重要文件一起提交，因此它已在我的所有系统中被继承。当然，从家目录的角度来看，我所有的系统都是相同的：它们具有一组相同的默认文件夹和许多相同的隐藏配置文件。

### 5、不要担心二进制文件

我对我的系统进行了数周的严格测试，确信将二进制文件提交到 Git 绝对不是明智之举。我试过 GPG 加密的密码文件、试过 LibreOffice 文档、JPEG、PNG 等等。我甚至有一个脚本，可以在将 LibreOffice 文件添加到 Git 之前先解压缩，提取其中的 XML，以便仅提交 XML，然后重新构建 LibreOffice 文件，以便可以在 LibreOffice 中继续工作。我的理论是，提交 XML 会比使用 ZIP 文件（LibreOffice 文档实际上就是一个 ZIP 文件）会让 Git 存储库更小一些。

令我惊讶的是，我发现偶尔提交一些二进制文件并没有大幅增加我的 Git 存储库的大小。我使用 Git 已经很长时间了，我知道如果我要提交几千兆的二进制数据，我的存储库将会受到影响，但是偶尔提交几个二进制文件也不是不惜一切代价要避免的紧急情况。

有了这种信心，我将字体 OTF 和 TTF 文件添加到我的标准主存储库，以及 GDM 的 `.face` 文件以及其他偶尔小型二进制 Blob 文件。不要想太多，不要浪费时间去避免它。只需提交即可。

### 6、使用私有存储库

即使托管方提供了私人帐户，也不要将你的主目录提交到公共 Git 存储库。如果你像我一样，拥有 SSH 密钥、GPG 密钥链和 GPG 加密的文件，这些文件不应该出现在任何人的服务器上，而应该出现在我自己的服务器上。

我在树莓派上 [运行本地 Git 服务器][9]（这比你想象的要容易），因此我可以在家里时随时更新任何一台计算机。我是一名远程工作者，所以通常情况下就足够了，但是我也可以在旅行时通过 [虚拟私人网络][10] 访问我的计算机。

### 7、要记得推送

Git 的特点是，只有当你告诉它要推送改动时，它才会把改动推送到你的服务器上。如果你是 Git 的老用户，则此过程可能对你很自然。对于可能习惯于 Nextcloud 或 Syncthing 自动同步的新用户，这可能需要一些时间来适应。

### Git 家目录

使用 Git 管理我的常用文件，不仅使我在不同设备上的生活更加便利。我知道我拥有所有配置和实用程序脚本的完整历史记录，这会鼓励我尝试新的想法，因为如果结果变得 _很糟糕_，则很容易回滚我的更改。Git 曾将我从在 `.bashrc` 文件中一个欠考虑的 `umask` 设置中解救出来、从深夜对包管理脚本的拙劣添加中解救出来、从当时看似很酷的 [rxvt][11] 配色方案的修改中解救出来，也许还有其他一些错误。在家目录中尝试 Git 吧，因为这些提交会让家目录融合在一起。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-home

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL (Houses in a row)
[2]: https://opensource.com/article/17/2/pocketchip-or-pi
[3]: https://opensource.com/article/21/2/chromebook-linux
[4]: https://opensource.com/article/17/5/introduction-alias-command-line-tool
[5]: https://opensource.com/sites/default/files/uploads/home-git.jpg (home directory)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://utils.kde.org/projects/filelight
[8]: https://opensource.com/sites/default/files/uploads/filelight.jpg (Filelight)
[9]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[10]: https://www.redhat.com/sysadmin/run-your-own-vpn-libreswan
[11]: https://opensource.com/article/19/10/why-use-rxvt-terminal
