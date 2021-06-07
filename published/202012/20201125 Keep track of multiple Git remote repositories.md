[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12911-1.html)
[#]: subject: (Keep track of multiple Git remote repositories)
[#]: via: (https://opensource.com/article/20/11/multiple-git-repositories)
[#]: author: (Peter Portante https://opensource.com/users/portante)

跟踪多个 Git 远程仓库
======

> 拥有一致的命名标准是保持本地和上游 Git 仓库保持一致的关键。

![](https://img.linux.net.cn/data/attachment/album/202012/11/220828tjt9qlpmg1opvibq.jpg)

当本地 Git 仓库的命名与远程仓库不一致时，与远程仓库协作就会变得很混乱。

解决此问题的一个方法是标准化两个词的使用和含义：`origin` 指的是你个人的 `example.com/<USER>/*` 仓库，而 `upstream` 指的是你从 `origin` 仓库<ruby>复刻<rt>fork</rt></ruby>出来的 `example.com` 仓库。换句话说，`upstream` 指的是公开提交工作的上游仓库，而 `origin` 指的是你对上游仓库的本地复刻，例如，你从这里生成<ruby>拉取请求<rt>pull request</rt></ruby>（PR）。

以 [pbench][2] 仓库为例，下面是一个逐步建立新的本地克隆的方法，其中 `origin` 和 `upstream` 的定义是一致的。

1、在大多数 Git 托管服务上，当你想在上面工作时，必须对它进行复刻。当你运行自己的 Git 服务器时，这并不是必要的，但对于一个公开的代码库来说，这是一个在贡献者之间传输差异的简单方法。
  
创建一个 Git 仓库的复刻。在这个例子中，假设你的复刻位于 `example.com/<USER>/pbench`。

2、接下来，你必须获得一个统一资源标识符 （[URI][3]），以便通过 SSH 进行<ruby>克隆<rt>cloning</rt></ruby>。在大多数 Git 托管服务上，比如 GitLab 或 GitHub，它在一个标有 “Clone” 或 “Clone over SSH” 的按钮或面板上，可以将克隆 URI 复制到剪贴板中。

3、在你的开发系统中，使用你复制的 URI 克隆仓库：

```
$ git clone git@example.com:<USER>/pbench.git
```
  
这将以默认名称 `origin` 来克隆 Git 仓库，作为你的 `pbench` 仓库复刻副本。

4、切换到刚才克隆的目录：

```
$ cd ~/pbench
```

5、下一步，获取源仓库的 SSH URI（你最初复刻的那个）。这可能和上面的方法一样。找到 “Clone” 按钮或面板，复制克隆地址。在软件开发中，这通常被称为“上游”，因为（理论上）这是大多数提交发生的地方，而你打算让这些提交流向下游的仓库。

6、将 URI 添加到你的本地仓库中。是的，将有*两个不同*的远程仓库分配给你的本地仓库副本：

```
$ git remote add upstream git@example.com:bigproject/pbench.git
```

7、现在你有两个命名远程仓库：`origin` 和 `upstream`。 你可以用 `remote` 子命令查看你的远程仓库：

```
$ git remote -v
```

现在，你的本地 `master` 分支正在跟踪 `origin` 的 `master`，这不一定是你想要的。你可能想跟踪这个分支的 `upstream` 版本，因为大多数开发都在上游进行。这个想法是，你要在从上游获得的内容的基础上添加更改。

8、将你的本地的 `master` 分支改成跟踪 `upstream/master`：

```
$ git fetch upstream
$ git branch --set-upstream-to=upstream/master master
```

你可以对任何你想要的分支这样做，而不仅仅是 `master`。例如，有些项目使用 `dev` 分支来处理所有不稳定的变化，而将 `master` 保留给已批准发布的代码。

9、一旦你设置了你的跟踪分支，一定要变基（`rebase`）你的 `master` 分支，使它与上游仓库的任何新变化保持一致：

```
$ git remote update
$ git checkout master
$ git rebase
```

这是一个保持 Git 仓库在不同复刻之间同步的好方法。如果你想自动完成这项工作，请阅读 Seth Kenlon 关于[使用 Ansible 托管 Git 仓库][4]的文章。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/multiple-git-repositories

作者：[Peter Portante][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/portante
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://github.com/distributed-system-analysis/pbench
[3]: https://en.wikipedia.org/wiki/Uniform_Resource_Identifier
[4]: https://opensource.com/article/19/11/how-host-github-gitlab-ansible
