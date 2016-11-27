第七部分 - 使用 Git 管理二进制大对象
=====================


通过这系列的前六篇文章，我们已经学会使用 Git 来对文本文件进行版本控制的管理。不禁要问，还有二进制文件呢，也可进行进行版本控制吗？答案是肯定的，Git 已经有了扩展可以处理像多媒体文件这样的二进制大对象块。因此，今天我们会学习使用 Git 来管理所谓的二进制资产。

似乎大家都认可的事就是 Git 对于大的二进制对象文件支持得不好。要记住，二进制大对象与大文本文件是不同的。虽然 Git 对大型的文本文件版本控制毫无问题，但是对于不透明的二进制文件起不了多大作用，只能把它当作一个大的实体黑盒来提交。

设想这样的场景，有一个另人兴奋的第一人称解密游戏，您正在为它制作复杂的 3D 建模，源文件是以二进制格式保存的，最后生成一个 1G 大小的的文件。您提交过一次，在 Git 源仓库历史中有一个 1G 大小的新增提交。随后，您修改了下模型人物的头发造型，然后提交更新，因为 Git 并不能把头发和头部及模型中其余的部分离开来，所以您仅仅只能又提交 1G 的量。接着，您改变了模型的眼睛颜色，提交这部分更新：又是 G 字节的提交量。对一个模型的一些微小修改，就会导致三个 G 字节的量提交。对于想对一个游戏所有资源进行版本控制这样的级别，这是个严重的问题。

对比如 .obj 这种格式的文本文件，和其它模块文件一样，都是一个提交就存储所有更新修改状态，不同的是 .obj 文件是一系列描述模型生成目标的纯文本行。如果您修改了模型并保存出成为 .obj 文件，Git 可以逐行读取这两个文件，然后创建一个差异版本，得到一个相当小的提交。模块越精致，提交就越小，这就是精典的 Git 用例。虽然文件本身很大，但 Git 使用覆盖或稀疏存储的方法来构建当前数据使用状态的完整图案。

然而，不是所有的都是纯文本的，但都要使用 Git。所以需要解决方案，其实有几个已经浮现了。

[OSTree](https://ostree.readthedocs.io/en/latest/) 是GNOME 项目用的，旨在管理操作系统的二进制文件。它不适用于这里，所以我直接跳过。

[Git 大文件存储](https://git-lfs.github.com/)(LFS) 是在 GitHub 上的一个开源项目，是从 git-media 项目中分支出来的。[git-media](https://github.com/alebedev/git-media) 和 [git-annex](https://git-annex.branchable.com/walkthrough/) 是 Git 对于管理大文件的扩展。它们是对同一问题的两种不同的解决方案，各有优点。虽然它们都不是官方的项目，但在我看来，都是独一无二的，体现在：

*  git-media 是一个集中模式，有一个公共资源的存储库。您可以告诉告诉 git-media 大文件需要存储的位置，是在硬盘驱动器、服务器还是在云存储服务器，项目中的每个用户都将该位置视为大型资产的中心主位置。
*   git-annex 更侧重于分布模式。用户各自创建存储库，每个存储库都有一个存储大文件的本地目录 .git/annex。annexes 会定期同步，只要有需要，每个用户都可以访问到所有的资源。除非是特别配置，否则 git-annex 优先使用本地存储，再使用外部存储。

基于这些选项，我已经在生产中使用了 git-media 和 git-annex，那么下面会向你们概述其工作原理。	


## git-media


git-media 使用的是 Ruby 语言，所以首先要安装 gem(译者注：Gem是基于Ruby的一些开发工具包)。安装说明在[网站](https://github.com/alebedev/git-media)上。想使用 git-meida 的用户都需要安装它，因为 gem 是跨平台的工具，所以在各平台都适用。

安装完 git-media 后，需要对 Git 的配置选择进行设置。在每台机器上只需要配置一次。

```
$ git config filter.media.clean "git-media filter-clean"
$ git config filter.media.smudge "git-media filter-smudge"
```

在要使用 git-media 的每个存储库中，设置一个属性以将刚刚创建的过滤器合并到要您想分类的介质的文件类型里。别被这种术语混淆。一个更好的术语是“资产”，因为“媒体”通常的意思是音频、视频和照片,但您可能很容易的也会将 3D 模型，烘焙和纹理等归类为媒体。

例如：

```
$ echo "*.mp4 filter=media -crlf" >> .gitattributes
$ echo "*.mkv filter=media -crlf" >> .gitattributes
$ echo "*.wav filter=media -crlf" >> .gitattributes
$ echo "*.flac filter=media -crlf" >> .gitattributes
$ echo "*.kra filter=media -crlf" >> .gitattributes
```

当您对这些类型的文件分级时，文件会被复制到 .git/media 目录。

假设在服务器已经有了一个 Git 源仓库，最后一步就告诉源仓库“母版”所在的位置，也就是，当媒体文件被推送给所有用户共享时，媒体文件将会存储的位置。在仓库的 .git/config 文件中设置，替换成您的用户名、主机和路径：

```
[git-media]
transport = scp
autodownload = false #默认为 true，拉取资源
scpuser = seth
scphost = example.com
scppath = /opt/jupiter.git
```

如果您的服务器上有复杂的 SSH 设置，例如非标准端口或非默认 SSH 密钥文件的路径，请使用 .ssh/config 为主机设置默认配置。

git-media 的生命周期和普通的一样，可以把它当成普通文件和 blobs 文件一样对待，一样进行 commit 操作。操作流程中唯一的不同就是，在某些时候，您应该将您的资产库（er、media 等）同步到共享存储库中。

当要为团队发布资源或备份资料时，请使用如下命令：

```
$ git media sync
```

使用 git-media 时, 要使发变更的版本（例如，一个已经美声过的音频文件，或者一个已经完成的遮罩绘画，或者一个已经被颜色分级的视频文件）来替换一个文件，您必须明确的告诉 Git 要更新操作。这将覆盖 git-media 的默认设置，如果远程已经存在此文件，就不会重新复制一份文件：

```
$ git update-index --really-refresh
```

当您团队的其他成员(或是您本人，在其它机器上）克隆本仓库时，如果没有在 .git/config 中把 autodownload 选择设置为 true 的话，默认是不会下载资源的。但 git-media 的一个同步命令可解决所有问题。

## git-annex

git-annex 的处理流程略微的有些不同，默认是使用本地仓库的，但基本的思想都一样。您可以从分布的仓库中安装 git-annex，或者根据需要从网站上下载安装。与git-media 一样，任何使用 git-annex 的用户都必须在其机器上安装上。

其初始化设置比 git-media 都简单。运行如下命令，其中替换成您的路径，就可以在您的服务器上创建好裸存储库：

```
$ git init --bare --shared /opt/jupiter.git
```

然后克隆到本地计算机，把它标记为 git-annex 的初始路径：

```
$ git clone seth@example.com:/opt/jupiter.clone
Cloning into 'jupiter.clone'... 
warning: You appear to have clonedan empty repository. 
Checking connectivity... done.
$ git annex init "seth workstation" 
init seth workstation ok
```

不要使用过滤器来区分媒体资源或大文件，您可以使用 git annex 命令来配置归类大文件：

```
$ git annex add bigblobfile.flacadd bigblobfile.flac
 (checksum) ok(Recording state in Git...)
```

跟普通文件一样进行提交操作：

```
$ git commit -m 'added flac source for sound fx'
```

但是推送操作是不同的，因为 git annex 使用自己的分支来跟踪资源。您首次推送可能需要 -u 选项，具体取决于您如何管理您的存储库：

```
$ git push -u origin master git-annexTo seth@example.com:/opt/jupiter.git* 
[new branch] master -> master* 
[new branch] git-annex -> git-annex
```

和 git-media 一样，普通的 git push 命令是不会拷贝资料到服务器的，仅仅只是发送了相关的消息，要真正分享文件，需要运行同步命令：

```
$ git annex sync --content
```

如果别人已经提交了共享资源，您需要拉取它们，git annex sync 命令将提示您本地不存在，但在服务器上存在的资源，并检出到本地。

git-media 和 git-annex 都非常灵活，都可以使用本地存储库来代替服务器，所以它们也常用于管理私有的本地项目。

Git 是一个非常强大和扩展性非常强的系统应用软件，我们应该毫不犹豫的使用它。现在就开始试试吧！

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/8/how-manage-binary-blobs-git-part-7

作者：[Seth Kenlon][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
