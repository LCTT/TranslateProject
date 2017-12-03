怎么在 Fedora 中创建我的第一个 RPM 包？
==============

![](https://i0.wp.com/blog.justinwflory.com/wp-content/uploads/2017/11/newpackage.png?resize=1024%2C433&ssl=1)

过了这个夏天，我把我的桌面环境迁移到了 i3，这是一个瓦片式窗口管理器。当初，切换到 i3 是一个挑战，因为我必须去处理许多以前 GNOME 帮我处理的事情。其中一件事情就是改变屏幕亮度。 xbacklight 这个在笔记本电脑上改变背光亮度的标准方法，它在我的硬件上不工作了。

最近，我发现一个改变背光亮度的工具 [brightlight][1]。我决定去试一下它，它工作在 root 权限下。但是，我发现 brightligh 在 Fedora 下没有 RPM 包。我决定，是在 Fedora 下尝试创建一个包的时候了，并且可以学习怎么去创建一个 RPM 包。

在这篇文章中，我将分享以下的内容：

* 创建 RPM SPEC 文件
* 在 Koji 和 Copr　中构建包
* 使用调试包处理一个问题
* 提交这个包到 Fedora 包集合中

### 前提条件

在 Fedora 上，我安装了包构建过程中所有步骤涉及到的包。

```
sudo dnf install fedora-packager fedpkg fedrepo_req copr-cli
```

### 创建 RPM SPEC 文件

创建 RPM 包的第一步是去创建 SPEC 文件。这些规范，或者是指令，它告诉 RPM 怎么去构建包。这是告诉 RPM 从包的源代码中创建一个二进制文件。创建 SPEC 文件看上去是整个包处理过程中最难的一部分，并且它的难度取决于项目。

对我而言，幸运的是，brightlight 是一个用 C 写的简单应用程序。维护人员用一个  Makefile  使创建二进制应用程序变得很容易。构建它只是在仓库中简单运行 `make` 的问题。因此，我现在可以用一个简单的项目去学习 RPM 打包。

#### 查找文档

谷歌搜索 “how to create an RPM package” 有很多结果。我开始使用的是 [IBM 的文档][2]。然而，我发现它理解起来非常困难，不知所云（虽然十分详细，它可能适用于复杂的 app）。我也在 Fedora 维基上找到了 [创建包][3] 的介绍。这个文档在构建和处理上解释的非常好，但是，我一直困惑于 “怎么去开始呢？”

最终，我找到了 [RPM 打包指南][4]，它是大神 [Adam Miller][5] 写的。这些介绍非常有帮助，并且包含了三个优秀的示例，它们分别是用 Bash、C 和 Python 编写的程序。这个指南帮我很容易地理解了怎么去构建一个 RPM SPEC，并且，更重要的是，解释了怎么把这些片断拼到一起。

有了这些之后，我可以去写 brightlight 程序的我的 [第一个 SPEC 文件][6] 了。因为它是很简单的，SPEC 很短也很容易理解。我有了 SPEC 文件之后，我发现其中有一些错误。处理掉一些错误之后，我创建了源 RPM (SRPM) 和二进制 RPM，然后，我解决了出现的每个问题。

```
rpmlint SPECS/brightlight.spec
rpmbuild -bs SPECS/brightlight.spec
rpmlint SRPMS/brightlight-5-1.fc26.src.rpm
rpmbuild -bb SPECS/brightlight-5-1.fc26.x86_64.rpm
rpmlint RPMS/x86_64/brightlight-5-1.fc26.x86_64.rpm
```

现在，我有了一个可用的 RPM，可以发送到 Fedora 仓库了。

### 在 Copr 和 Koji 中构建

接下来，我读了该 [指南][7] 中关于怎么成为一个 Fedora 打包者。在提交之前，他们鼓励打包者通过在在 [Koji][9] 中托管、并在 [Copr][8] 中构建项目来测试要提交的包。

#### 使用 Copr

首先，我为 brightlight 创建了一个 [Copr 仓库][10]，[Copr][11] 是在 Fedora 的基础设施中的一个服务，它构建你的包，并且为你任意选择的 Fedora 或 EPEL 版本创建一个定制仓库。它对于快速托管你的 RPM 包，并与其它人去分享是非常方便的。你不需要特别操心如何去托管一个 Copr 仓库。

我从 Web 界面创建了我的 Copr 项目，但是，你也可以使用 `copr-cli` 工具。在 Fedora 开发者网站上有一个 [非常优秀的指南][12]。在该网站上创建了我的仓库之后，我使用这个命令构建了我的包。

```
copr-cli build brightlight SRPMS/brightlight.5-1.fc26.src.rpm
```

我的包在 Corp 上成功构建，并且，我可以很容易地在我的 Fedora 系统上成功安装它。

#### 使用 Koji

任何人都可以使用 [Koji][13] 在多种架构和 Fedora 或 CentOS/RHEL 版本上测试他们的包。在 Koji 中测试，你必须有一个源 RPM。我希望 brightlight 包在 Fedora 所有的版本中都支持，因此，我运行如下的命令：

```
koji build --scratch f25 SRPMS/brightlight-5-1.fc26.src.rpm
koji build --scratch f26 SRPMS/brightlight-5-1.fc26.src.rpm
koji build --scratch f27 SRPMS/brightlight-5-1.fc26.src.rpm
```

它花费了一些时间，但是，Koji 构建了所有的包。我的包可以很完美地运行在 Fedora 25 和 26 中，但是 Fedora 27 失败了。 Koji 模拟构建可以使我走在正确的路线上，并且确保我的包构建成功。

### 问题：Fedora 27 构建失败！

现在，我已经知道我的 Fedora 27 上的包在 Koji 上构建失败了。但是，为什么呢？我发现在 Fedora 27 上有两个相关的变化。

* [Subpackage and Source Debuginfo][14]
* [RPM 4.14][15] (特别是，debuginfo 包重写了)

这些变化意味着 RPM 包必须使用一个 debuginfo 包去构建。这有助于排错或调试一个应用程序。在我的案例中，这并不是关键的或者很必要的，但是，我需要去构建一个。

感谢 Igor Gnatenko，他帮我理解了为什么我在 Fedora 27 上构建包时需要去将这些增加到我的包的 SPEC 中。在 `%make_build` 宏指令之前，我增加了这些行。

```
export CFLAGS="%{optflags}"
export LDFLAGS="%{__global_ldflags}"
```

我构建了一个新的 SRPM 并且提交它到 Koji 去在 Fedora 27 上构建。成功了，它构建成功了！

### 提交这个包

现在，我在 Fedora 25 到 27 上成功校验了我的包，是时候为 Fedora 打包了。第一步是提交这个包，为了请求一个包评估，要在 Red Hat Bugzilla 创建一个新 bug。我为 brightlight [创建了一个工单][16]。因为这是我的第一个包，我明确标注它 “这是我的第一个包”，并且我寻找一个发起人。在工单中，我链接 SPEC 和 SRPM 文件到我的 Git 仓库中。

#### 进入 dist-git

[Igor Gnatenko][17] 发起我进入 Fedora 打包者群组，并且在我的包上留下反馈。我学习了一些其它的关于 C 应用程序打包的特定的知识。在他响应我之后，我可以在 [dist-git][18] 上申请一个仓库，Fedora 的 RPM 包集合仓库为所有的 Fedora 版本保存了 SPEC 文件。

一个很方便的 Python 工具使得这一部分很容易。`fedrepo-req` 是一个用于创建一个新的 dist-git 仓库的请求的工具。我用这个命令提交我的请求。

```
fedrepo-req brightlight \
    --ticket 1505026 \
    --description "CLI tool to change screen back light brightness" \
    --upstreamurl https://github.com/multiplexd/brightlight
```

它为我在 fedora-scm-requests 仓库创建了一个新的工单。这是一个我是管理员的 [创建的仓库][19]。现在，我可以开始干了！

![](https://i0.wp.com/blog.justinwflory.com/wp-content/uploads/2017/11/Screenshot-from-2017-11-05-19-58-47.png?w=1366&ssl=1)

*My first RPM in Fedora dist-git – woohoo!*

#### 与 dist-git 一起工作

接下来，`fedpkg` 是用于和 dist-git 仓库进行交互的工具。我改变当前目录到我的 git 工作目录，然后运行这个命令。

```
fedpkg clone brightlight
```

`fedpkg` 从 dist-git 克隆了我的包的仓库。对于这个仅有的第一个分支，你需要去导入 SRPM。

```
fedpkg import SRPMS/brightlight-5-1.fc26.src.rpm
```

`fedpkg` 导入你的包的 SRPM 到这个仓库中，然后设置源为你的 Git 仓库。这一步对于使用 `fedpkg` 是很重要的，因为它用一个 Fedora 友好的方去帮助规范这个仓库（与手动添加文件相比）。一旦你导入了 SRPM，推送这个改变到 dist-git 仓库。

```
git commit -m "Initial import (#1505026)."
git push
```

#### 构建包

自从你推送第一个包导入到你的 dist-git 仓库中，你已经准备好了为你的项目做一次真实的 Koji 构建。要构建你的项目，运行这个命令。

```
fedpkg build
```

它会在 Koji 中为 Rawhide 构建你的包，这是 Fedora 中的非版本控制的分支。在你为其它分支构建之前，你必须在 Rawhide 分支上构建成功。如果一切构建成功，你现在可以为你的项目的其它分支发送请求了。

```
fedrepo-req brightlight f27 -t 1505026
fedrepo-req brightlight f26 -t 1505026
fedrepo-req brightlight f25 -t 1505026
```

#### 关于构建其它分支的注意事项

一旦你最初导入了 SRPM，如果你选择去创建其它分支，记得合并你的主分支到它们。例如，如果你后面为 Fedora 27 请求一个分支，你将需要去使用这些命令。

```
fedpkg switch-branch f27
git merge master
git push
fedpkg build
```

#### 提交更新到 Bodhi

这个过程的最后一步是，把你的新包作为一个更新包提交到 Bodhi 中。当你初次提交你的更新包时，它将去测试这个仓库。任何人都可以测试你的包并且增加 karma 到该更新中。如果你的更新接收了 3 个以上的投票（或者像 Bodhi 称它为 karma），你的包将自动被推送到稳定仓库。否则，一周之后，推送到测试仓库中。

要提交你的更新到 Bodhi，你仅需要一个命令。

```
fedpkg update
```

它为你的包用一个不同的配置选项打开一个 Vim 窗口。一般情况下，你仅需要去指定一个 类型（比如，`newpackage`）和一个你的包评估的票据 ID。对于更深入的讲解，在  Fedora 维基上有一篇[更新的指南][23]。

在保存和退出这个文件后，`fedpkg` 会把你的包以一个更新包提交到 Bodhi，最后，同步到 Fedora 测试仓库。我也可以用这个命令去安装我的包。

```
sudo dnf install brightlight -y --enablerepo=updates-testing --refresh
```

### 稳定仓库

最近提交了我的包到 [Fedora 26 稳定仓库][20]，并且不久将进入 [Fedora 25][21] 和 [Fedora 27][22] 稳定仓库。感谢帮助我完成我的第一个包的每个人。我期待有更多的机会为发行版添加包。

--------------------------------------------------------------------------------

via: https://blog.justinwflory.com/2017/11/first-rpm-package-fedora/

作者：[JUSTIN W. FLORY][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.justinwflory.com/author/jflory7/
[1]:https://github.com/multiplexd/brightlight
[2]:https://www.ibm.com/developerworks/library/l-rpm1/index.html
[3]:https://fedoraproject.org/wiki/How_to_create_an_RPM_package
[4]:https://fedoraproject.org/wiki/How_to_create_an_RPM_package
[5]:https://github.com/maxamillion
[6]:https://src.fedoraproject.org/rpms/brightlight/blob/master/f/brightlight.spec
[7]:https://fedoraproject.org/wiki/Join_the_package_collection_maintainers
[8]:https://copr.fedoraproject.org/
[9]:https://koji.fedoraproject.org/koji/
[10]:https://copr.fedorainfracloud.org/coprs/jflory7/brightlight/
[11]:https://developer.fedoraproject.org/deployment/copr/about.html
[12]:https://developer.fedoraproject.org/deployment/copr/copr-cli.html
[13]:https://koji.fedoraproject.org/koji/
[14]:https://fedoraproject.org/wiki/Changes/SubpackageAndSourceDebuginfo
[15]:https://fedoraproject.org/wiki/Changes/RPM-4.14
[16]:https://bugzilla.redhat.com/show_bug.cgi?id=1505026
[17]:https://fedoraproject.org/wiki/User:Ignatenkobrain
[18]:https://src.fedoraproject.org/
[19]:https://src.fedoraproject.org/rpms/brightlight
[20]:https://bodhi.fedoraproject.org/updates/brightlight-5-1.fc26
[21]:https://bodhi.fedoraproject.org/updates/FEDORA-2017-8071ee299f
[22]:https://bodhi.fedoraproject.org/updates/FEDORA-2017-f3f085b86e
[23]: https://fedoraproject.org/wiki/Package_update_HOWTO
