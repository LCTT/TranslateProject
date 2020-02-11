[#]: collector: (lujun9972)
[#]: translator: (svtter)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage multimedia files with Git)
[#]: via: (https://opensource.com/article/19/4/manage-multimedia-files-git)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)


通过 Git 来管理多媒体文件
======

学习如何使用 Git 来追踪项目中的大型多媒体文件。
在系列中的最后一篇文章中描述了如何使用 Git。

![video editing dashboard][1]

Git 是专用于源代码版本控制的工具。因此，Git 很少被用于非纯文本的项目以及行业。然而，异步工作流的优点是十分诱人的，尤其是在一些日益增长的行业中，这种类型的行业把重要的计算和重要的艺术冒险结合起来。其中，包括网页设计、视觉效果、视频游戏、出版、货币设计（是的，这是一个真实的行业），教育 ... 等等。还有许多行业属于这个类型。

在这个系列正要谈到 Git 14周年纪念日之际，我们分享了六个少为人知的方式来使用 Git。在文章的末尾，我们将会介绍一下那些利用 Git 优点来管理多媒体文件的软件。

### Git 管理多媒体文件的问题

众所周知，Git 用于处理非文本文件不是很好，但是这并不妨碍我们进行尝试。下面是一个使用 Git 来复制照片文件的例子：

```
$ du -hs
108K .
$ cp ~/photos/dandelion.tif .
$ git add dandelion.tif
$ git commit -m 'added a photo'
[master (root-commit) fa6caa7] two photos
1 file changed, 0 insertions(+), 0 deletions(-)
create mode 100644 dandelion.tif
$ du -hs
1.8M .
```

目前为止没有什么异常。增加一个 1.8MB 的照片到一个目录下，使得目录变成了 1.8 MB 的大小。所以下一步，我们尝试删除文件。

```
$ git rm dandelion.tif
$ git commit -m 'deleted a photo'
$ du -hs
828K .
```

在这里我们可以看到有些问题：删除一个已经被提交的文件，还是会使得仓库的大小扩大到原来的8倍（从 108K 到 828K）。我们可以测试多次来得到一个更好的平均值，但是这个简单的演示与我的假设一直。提交非文本文件，在一开始花费空间比较少，但是一个工厂活跃地时间越长，人们可能对静态内容修改的会更多，更多的零碎文件会被加和到一起。当一个 Git 仓库变的越来越大，主要的成本往往是速度。拉取和推送的时间，从最初抿一口咖啡的时间到你觉得你可能踢掉了

导致 Git 中静态内容的体积不断扩大的原因是什么呢？那些通过文本的构成的文件，允许 Git 只拉取那些修改的部分。光栅图以及音乐文件对 Git 文件而言与文本不同，你可以查看一下 .png 和 .wav 文件中的二进制数据。所以，Git 只不过是获取了全部的数据，并且创建了一个新的副本，哪怕是一张图仅仅修改了一个像素。

### Git-portal

在实践中，许多多媒体项目不需要或者不想追踪媒体的历史记录。相对于文本后者代码的部分，项目的媒体部分一般有一个不同的生命周期。媒体资源一般通过一个方向产生：一张图片从铅笔草稿开始，以数绘的形式抵达它的目的地。然后，尽管文本能够回滚到早起的版本，但是艺术只会一直向前。工程中的媒体很少被绑定到一个特定的版本。例外情况通常是反映数据集的图形，通常是可以用基于文本的格式（如SVG）完成的表、图形或图表。

所以，在许多同时包含文本（无论是叙事散文还是代码）和媒体的工程中，Git 是一个用于文件管理的，可接受的解决方案，只要有一个在版本控制循环之外的游乐场来给艺术家游玩。

![Graphic showing relationship between art assets and Git][2]

一个简单的方法来启用这个特性是 [Git-portal][3]，一个通过武装 Git hooks 的 Bash 脚本，它将静态文件从文件夹中移出 Git 的范围，通过链接来取代。Git 提交链接文件（有时候称作快捷方式），这种链接文件比较小，所以所有的提交都是文本文件和那些代表媒体文件的链接。替身文件是链接，所以工程还会像预期的运行，因为本地机器会处理他们，转换成“真的”。当链接文件发生变动时，Git-portal 维护了一个项目的结构，因此逆转这个过程很简单。用户需要考虑的，仅仅是 Git-portal 是否适用于工程，或者需要构建一个没有链接的工程版本（例如需要分发的时候）。

Git-portal 也允许通过 rsync 来远程同步静态资源，所以用户可以设置一个远程存储位置，来做为一个中心的授权源。

Git-portal 对于多媒体的工程是一个理想的解决方案。类似的多媒体工程包括视频游戏，桌面游戏，需要进行大型3D模型渲染和纹理的虚拟现实工程，[带图的书籍][4]以及 .odt 输出，协作型的[博客站点][5]，音乐项目，等等。艺术家在应用程序中以图层（在图形世界中）和曲目（在音乐世界中）的形式执行版本控制并不少见——因此，Git 不会向多媒体项目文件本身添加任何内容。Git 的功能可用于艺术项目的其他部分（例如散文和叙述、项目管理、字幕文件、信贷、营销副本、文档等），而结构化远程备份的功能则由艺术家使用。

#### 安装 Git-portal

Git-portal 的RPM 安装包位于 <https://klaatu.fedorapeople.org/git-portal>，可用于下载和安装。

此外，用户可以从 Git-portal 的 Gitlab 主页手动安装。这仅仅是一个 Bash 脚本以及一些 Git hooks（也是 Bash 脚本），但是需要一个快速的构建过程来让它知道安装的位置。


```
$ git clone <https://gitlab.com/slackermedia/git-portal.git> git-portal.clone
$ cd git-portal.clone
$ ./configure
$ make
$ sudo make install
```

#### 使用 Git-portal

Git-portal 与 Git 一起使用。这意味着，对于 Git 的所有大型文件扩展名，都需要记住一些额外的步骤。但是，你仅仅需要在处理你的媒体资源的时候使用 Git-portal，所以很容易记住，除非你把大文件都当做文本文件来进行处理（对于 Git 用户很少见）。使用 Git-portal 必须做的一个安装步骤是：


```
$ mkdir bigproject.git
$ cd !$
$ git init
$ git-portal init
```

Git-portal 的 **init** 函数在 Git 仓库中创建了一个 **_portal** 文件夹并且添加到 .gitignore 文件中。

在平日里使用 Git-portal 和 Git 协同十分平滑。一个较好的例子是基于 MIDI 的音乐项目：音乐工作站产生的项目文件是基于文本的，但是 MIDI 文件是二进制数据：


```
$ ls -1
_portal
song.1.qtr
song.qtr
song-Track_1-1.mid
song-Track_1-3.mid
song-Track_2-1.mid
$ git add song*qtr
$ git-portal song-Track*mid
$ git add song-Track*mid
```

如果你查看一下 **_portal** 文件夹，你会发现那里有原始的MIDI文件。这些文件在原本的位置被替换成了指向 **_portal** 的链接文件，使得音乐工作站像预期一样运行。


```
$ ls -lG
[...] _portal/
[...] song.1.qtr
[...] song.qtr
[...] song-Track_1-1.mid -> _portal/song-Track_1-1.mid*
[...] song-Track_1-3.mid -> _portal/song-Track_1-3.mid*
[...] song-Track_2-1.mid -> _portal/song-Track_2-1.mid*
```

与 Git 相同，你也可以添加一个文件下的文件。


```
$ cp -r ~/synth-presets/yoshimi .
$ git-portal add yoshimi
Directories cannot go through the portal. Sending files instead.
$ ls -lG _portal/yoshimi
[...] yoshimi.stat -> ../_portal/yoshimi/yoshimi.stat*
```

删除功能也想预期一样工作，但是从 **_portal**中删除了一些东西。你应该使用 **git-portal rm** 而不是 **git rm**。使用 Git-portal 可以确保文件从 **_portal** 中删除：


```
$ ls
_portal/ song.qtr song-Track_1-3.mid@ yoshimi/
song.1.qtr song-Track_1-1.mid@ song-Track_2-1.mid@
$ git-portal rm song-Track_1-3.mid
rm 'song-Track_1-3.mid'
$ ls _portal/
song-Track_1-1.mid* song-Track_2-1.mid* yoshimi/
```

如果你忘记使用 Git-portal，那么你需要手动删除 portal 文件：


```
$ git-portal rm song-Track_1-1.mid
rm 'song-Track_1-1.mid'
$ ls _portal/
song-Track_1-1.mid* song-Track_2-1.mid* yoshimi/
$ trash _portal/song-Track_1-1.mid
```

Git-portal 仅有的其他工程，是列出当前所有的链接并且找到里面已经损坏的部分。有时这种情况会因为项目文件夹中的文件被移动而发生：


```
$ mkdir foo
$ mv yoshimi foo
$ git-portal status
bigproject.git/song-Track_2-1.mid: symbolic link to _portal/song-Track_2-1.mid
bigproject.git/foo/yoshimi/yoshimi.stat: broken symbolic link to ../_portal/yoshimi/yoshimi.stat
```

如果你使用 Git-portal 用于私人项目并且维护自己的备份，以上就是技术方面所有你需要知道关于 Git-portal 的事情了。如果你想要添加一个协作者或者你希望 Git-portal 来像 Git 的方式来管理备份，你可以创建一个远程。

#### 增加 Git-portal remotes

为 Git-portal 增加一个远程位置是通过 Git 已经存在的功能来实现的。Git-portal 实现了 Git hooks，隐藏在仓库 .git 文件夹中的脚本，来寻找你的远程主机上是否存在以 **_portal** 开头的文件夹。如果它找到一个，它会尝试使用 **rsync** 来与远程位置同步文件。Git-portal 在用户进行 Git push 以及 Git 合并的时候（或者在进行 git pull的时候，实际上是进行一次 fetch 和自动合并）会处理这项任务。

如果你近克隆了 Git 仓库，那么你可能永远不会自己添加一个 remote。这是一个标准的 Git 过程：

```
$ git remote add origin [git@gitdawg.com][6]:seth/bigproject.git
$ git remote -v
origin [git@gitdawg.com][6]:seth/bigproject.git (fetch)
origin [git@gitdawg.com][6]:seth/bigproject.git (push)
```

**origin** 这个名字对你的主要 Git 仓库是一个流行的惯例，为 Git 数据使用它是有意义的。然而，你的 Git-portal 数据是分开存储的，所以你必须创建第二个远程机器来让 Git-portal 了解向哪里 push 和从哪里 pull。取决于你的 Git 主机。你可能需要一个分离的服务器，因为媒体资源可能有GB的大小，使得一个 Git 主机由于空间限制无法承担。或者，可能你的服务器仅允许你访问你的 Git 仓库而不允许一个额外的存储文件夹：

```
$ git remote add _portal [seth@example.com][7]:/home/seth/git/bigproject_portal
$ git remote -v
origin [git@gitdawg.com][6]:seth/bigproject.git (fetch)
origin [git@gitdawg.com][6]:seth/bigproject.git (push)
_portal [seth@example.com][7]:/home/seth/git/bigproject_portal (fetch)
_portal [seth@example.com][7]:/home/seth/git/bigproject_portal (push)
```

你可能不想把你的所有私人账户放在你的服务器上，而且你不需要这样做。为了提供服务器上仓库的大文件资源权限，你可以运行一个 Git 前端，比如 **[Gitolite][8]** 或者你可以使用 **rrsync** （restricted rsync)。

现在你可以推送你的 Git 数据到你的远程 Git 仓库和你的 Git-portal 数据到你的远程 portal:


```
$ git push origin HEAD
master destination detected
Syncing _portal content...
sending incremental file list
sent 9,305 bytes received 18 bytes 1,695.09 bytes/sec
total size is 60,358,015 speedup is 6,474.10
Syncing _portal content to example.com:/home/seth/git/bigproject_portal
```

如果你已经安装了 Git-portal，并且配置了一个远程的 **_portal**，你的 **_portal** 文件夹将会被同步，并且从服务器获取新的内容，以及在每一次 push 的时候发送新的内容。但是，你不需要进行 Git commit 或者 push 来和服务器同步（用户可以使用直接使用 rsync），我发现对于艺术性内容的改变，提交是有用的。这将会把艺术家及其数字资源集成到工作流的其余部分中，并提供有关项目进度和速度的有用元数据。 

### 其他选项

如果 Git-portal 对你而言太过简单，还有一些其他的选择用于 Git 管理大型文件。[Git Large File Storage][9] (LFS) 是一个失效项目的分支，称作 git-media。这个分支由 Github 维护和支持。它需要特殊的命令（例如 **git lfs track** 来保护大型文件不被 Git 追踪）并且需要用户维护一个 .gitattributes 文件来更新哪些仓库中的文件被 LFS 追踪。对于大文件而言，它 _仅_ 支持 HTTP 和 HTTPS 主机。所以你的 LFS 服务器必须进行配置，才能使得用户可以通过 HTTP 而不是 SSH 或 rsync 来进行鉴权。

另一个相对 LFS 更灵活的选项是 [git-annex][10]。你可以在我的文章 [managing binary blobs in Git][11] （忽略 git-media 这个已经废弃的项目，它的继任者 Git LFS 没有将它延续下来）中了解更多。Git-annex 是一个灵活且优雅的解决方案。它拥有一个细腻的系统来用于添加，删除，移动仓库中的大型文件。因为它灵活且强大，有很多新的命令和规则需要进行学习，所以建议看一下它的 [文档][12]。

然而，如果你的需求很简单，你可能更加喜欢整合已有技术来进行简单且明显任务的解决方案，Git-portal 可能是对于工作而言比较合适的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/manage-multimedia-files-git

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[svtter](https://github.com/svtter)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/video_editing_folder_music_wave_play.png?itok=-J9rs-My (video editing dashboard)
[2]: https://opensource.com/sites/default/files/uploads/git-velocity.jpg (Graphic showing relationship between art assets and Git)
[3]: http://gitlab.com/slackermedia/git-portal.git
[4]: https://www.apress.com/gp/book/9781484241691
[5]: http://mixedsignals.ml
[6]: mailto:git@gitdawg.com
[7]: mailto:seth@example.com
[8]: https://opensource.com/article/19/4/file-sharing-git
[9]: https://git-lfs.github.com/
[10]: https://git-annex.branchable.com/
[11]: https://opensource.com/life/16/8/how-manage-binary-blobs-git-part-7
[12]: https://git-annex.branchable.com/walkthrough/
