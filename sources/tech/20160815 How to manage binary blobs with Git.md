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

```
git-media
```

git-media uses Ruby, so you must install a gem for it. Instructions are on the[website](https://github.com/alebedev/git-media). Each user who wants to use git-media needs to install it, but it is cross-platform, so that is not a problem.

After installing git-media, you must set some Git configuration options. You only need to do this once per machine you use:

```
$ git config filter.media.clean "git-media filter-clean"$ git config filter.media.smudge "git-media filter-smudge"
```

In each repository that you want to use git-media, set an attribute to marry the filters you've just created to the file types you want to classify as media. Don't get confused by the terminology; a better term is "assets," since "media" usually means audio, video, and photos, but you might just as easily classify 3D models, bakes, and textures as media.

For example:

```
$ echo "*.mp4 filter=media -crlf" >> .gitattributes$ echo "*.mkv filter=media -crlf" >> .gitattributes$ echo "*.wav filter=media -crlf" >> .gitattributes$ echo "*.flac filter=media -crlf" >> .gitattributes$ echo "*.kra filter=media -crlf" >> .gitattributes
```

When you stage a file of those types, the file is copied to .git/media.

Assuming you have a Git repository on the server already, the final step is to tell your Git repository where the "mothership" is; that is, where the media files will go when they have been pushed for all users to share. Set this in the repository's.git/config file, substituting your own user, host, and path:

```
[git-media]
transport = scp
autodownload = false #true to pull assets by default
scpuser = seth
scphost = example.com
scppath = /opt/jupiter.git
```

If you have complex SSH settings on your server, such as a non-standard port or path to a non-default SSH key file use .ssh/config to set defaults for the host.

Life with git-media is mostly normal; you work in your repository, you stage files and blobs alike, and commit them as usual. The only difference in workflow is that at some point along the way, you should sync your secret stockpile of assets (er, media) to the shared repository.

When you are ready to publish your assets for your team or for your own backup, use this command:

```
$ git media sync
```

To replace a file in git-media with a changed version (for example, an audio file has been sweetened, or a matte painting has been completed, or a video file has been colour graded), you must explicitly tell Git to update the media. This overrides git-media's default to not copy a file if it already exists remotely:

```
$ git update-index --really-refresh
```

When other members of your team (or you, on a different computer) clones the repository, no assets will be downloaded by default unless you have set theautodownload option in .git/config to true. A git media sync cures all ills.

```
git-annex
```

git-annex has a slightly different workflow, and defaults to local repositories, but the basic ideas are the same. You should be able to install git-annex from your distribution's repository, or you can get it from the website as needed. As withgit-media, any user using git-annex must install it on their machine.

The initial setup is simpler than git-media. To create a bare repository on your server run this command, substituting your own path:

```
$ git init --bare --shared /opt/jupiter.git
```

Then clone it onto your local computer, and mark it as a git-annex location:

```
$ git clone seth@example.com:/opt/jupiter.cloneCloning into 'jupiter.clone'... warning: You appear to have clonedan empty repository. Checking connectivity... done.$ git annex init "seth workstation" init seth workstation ok
```

Rather than using filters to identify media assets or large files, you configure what gets classified as a large file by using the git annex command:

```
$ git annex add bigblobfile.flacadd bigblobfile.flac (checksum) ok(Recording state in Git...)
```

Committing is done as usual:

```
$ git commit -m 'added flac source for sound fx'
```

But pushing is different, because git annex uses its own branch to track assets. The first push you make may need the -u option, depending on how you manage your repository:

```
$ git push -u origin master git-annexTo seth@example.com:/opt/jupiter.git* [new branch] master -> master* [new branch] git-annex -> git-annex
```

As with git-media, a normal git push does not copy your assets to the server, it only sends information about the media. When you're ready to share your assets with the rest of the team, run the sync command:

```
$ git annex sync --content
```

If someone else has shared assets to the server and you need to pull them, git annex sync will prompt your local checkout to pull assets that are not present on your machine, but that exist on the server.

Both git-media and git-annex are flexible and can use local repositories instead of a server, so they're just as useful for managing private local projects, too.

Git is a powerful and extensible system, and by now there is really no excuse for not using it. Try it out today!

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/8/how-manage-binary-blobs-git-part-7

作者：[Seth Kenlon][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
