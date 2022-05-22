[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13200-1.html)
[#]: subject: (6 best practices for managing Git repos)
[#]: via: (https://opensource.com/article/20/7/git-repos-best-practices)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

6 个最佳的 Git 仓库管理实践
======

> 抵制在 Git 中添加一些会增加管理难度的东西的冲动；这里有替代方法。

![](https://img.linux.net.cn/data/attachment/album/202103/13/225927c3mvm5x275vano5m.jpg)

有权访问源代码使对安全性的分析以及应用程序的安全成为可能。但是，如果没有人真正看过代码，问题就不会被发现，即使人们主动地看代码，通常也要看很多东西。幸运的是，GitHub 拥有一个活跃的安全团队，最近，他们 [发现了已提交到多个 Git 仓库中的特洛伊木马病毒][2]，甚至仓库的所有者也偷偷溜走了。尽管我们无法控制其他人如何管理自己的仓库，但我们可以从他们的错误中吸取教训。为此，本文回顾了将文件添加到自己的仓库中的一些最佳实践。

### 了解你的仓库

![Git 仓库终端][3]

这对于安全的 Git 仓库来可以说是头号规则。作为项目维护者，无论是你自己创建的还是采用别人的，你的工作是了解自己仓库中的内容。你可能无法记住代码库中每一个文件，但是你需要了解你所管理的内容的基本组成部分。如果在几十个合并后出现一个游离的文件，你会很容易地发现它，因为你不知道它的用途，你需要检查它来刷新你的记忆。发生这种情况时，请查看该文件，并确保准确了解为什么它是必要的。

### 禁止二进制大文件

![终端中 Git 的二进制检查命令][4]

Git 是为文本而生的，无论是用纯文本编写的 C 或 Python 还是 Java 文本，亦或是 JSON、YAML、XML、Markdown、HTML 或类似的文本。Git 对于二进制文件不是很理想。

两者之间的区别是：

```
$ cat hello.txt
This is plain text.
It's readable by humans and machines alike.
Git knows how to version this.

$ git diff hello.txt
diff --git a/hello.txt b/hello.txt
index f227cc3..0d85b44 100644
--- a/hello.txt
+++ b/hello.txt
@@ -1,2 +1,3 @@
 This is plain text.
+It's readable by humans and machines alike.
 Git knows how to version this.
```

和

```
$ git diff pixel.png
diff --git a/pixel.png b/pixel.png
index 563235a..7aab7bc 100644
Binary files a/pixel.png and b/pixel.png differ

$ cat pixel.png
�PNG
▒
IHDR7n�$gAMA��
              �abKGD݊�tIME�

                          -2R��
IDA�c`�!�3%tEXtdate:create2020-06-11T11:45:04+12:00��r.%tEXtdate:modify2020-06-11T11:45:04+12:00��ʒIEND�B`�
```

二进制文件中的数据不能像纯文本一样被解析，因此，如果二进制文件发生任何更改，则必须重写整个内容。一个版本与另一个版本之间唯一的区别就是全部不同，这会快速增加仓库大小。

更糟糕的是，Git 仓库维护者无法合理地审计二进制数据。这违反了头号规则：应该对仓库的内容了如指掌。

除了常用的 [POSIX][5] 工具之外，你还可以使用 `git diff` 检测二进制文件。当你尝试使用 `--numstat` 选项来比较二进制文件时，Git 返回空结果：

```
$ git diff --numstat /dev/null pixel.png | tee
-     -   /dev/null => pixel.png
$ git diff --numstat /dev/null file.txt | tee
5788  0   /dev/null => list.txt
```

如果你正在考虑将二进制大文件（BLOB）提交到仓库，请停下来先思考一下。如果它是二进制文件，那它是由什么生成的。是否有充分的理由不在构建时生成它们，而是将它们提交到仓库？如果你认为提交二进制数据是有意义的，请确保在 `README` 文件或类似文件中指明二进制文件的位置、为什么是二进制文件的原因以及更新它们的协议是什么。必须谨慎对其更新，因为你每提交一个二进制大文件的变化，它的存储空间实际上都会加倍。

### 让第三方库留在第三方

第三方库也不例外。尽管它是开源的众多优点之一，你可以不受限制地重用和重新分发不是你编写的代码，但是有很多充分的理由不把第三方库存储在你自己的仓库中。首先，除非你自己检查了所有代码（以及将来的合并），否则你不能为第三方完全担保。其次，当你将第三方库复制到你的 Git 仓库中时，会将焦点从真正的上游源代码中分离出来。从技术上讲，对库有信心的人只对该库的主副本有把握，而不是对随机仓库的副本有把握。如果你需要锁定特定版本的库，请给开发者提供一个合理的项目所需的发布 URL，或者使用 [Git 子模块][6]。

### 抵制盲目的 git add

![Git 手动添加命令终端中][7]

如果你的项目已编译，请抵制住使用 `git add .` 的冲动（其中 `.` 是当前目录或特定文件夹的路径），因为这是一种添加任何新东西的简单方法。如果你不是手动编译项目，而是使用 IDE 为你管理项目，这一点尤其重要。用 IDE 管理项目时，跟踪添加到仓库中的内容会非常困难，因此仅添加你实际编写的内容非常重要，而不是添加项目文件夹中出现的任何新对象。

如果你使用了 `git add .`，请在推送之前检查暂存区里的内容。如果在运行 `make clean` 或等效命令后，执行 `git status` 时在项目文件夹中看到一个陌生的对象，请找出它的来源，以及为什么仍然在项目的目录中。这是一种罕见的构建工件，不会在编译期间重新生成，因此在提交前请三思。

### 使用 Git ignore

![终端中的 `Git ignore` 命令][8]

许多为程序员打造的便利也非常杂乱。任何项目的典型项目目录，无论是编程的，还是艺术的或其他的，到处都是隐藏的文件、元数据和遗留的工件。你可以尝试忽略这些对象，但是 `git status` 中的提示越多，你错过某件事的可能性就越大。

你可以通过维护一个良好的 `gitignore` 文件来为你过滤掉这种噪音。因为这是使用 Git 的用户的共同要求，所以有一些入门级的 `gitignore` 文件。[Github.com/github/gitignore][9] 提供了几个专门创建的 `gitignore` 文件，你可以下载这些文件并将其放置到自己的项目中，[Gitlab.com][10] 在几年前就将`gitignore` 模板集成到了仓库创建工作流程中。使用这些模板来帮助你为项目创建适合的 `gitignore` 策略并遵守它。

### 查看合并请求

![Git 合并请求][11]

当你通过电子邮件收到一个合并/拉取请求或补丁文件时，不要只是为了确保它能正常工作而进行测试。你的工作是阅读进入代码库的新代码，并了解其是如何产生结果的。如果你不同意这个实现，或者更糟的是，你不理解这个实现，请向提交该实现的人发送消息，并要求其进行说明。质疑那些希望成为版本库永久成员的代码并不是一种社交失误，但如果你不知道你把什么合并到用户使用的代码中，那就是违反了你和用户之间的社交契约。

### Git 责任

社区致力于开源软件良好的安全性。不要鼓励你的仓库中不良的 Git 实践，也不要忽视你克隆的仓库中的安全威胁。Git 功能强大，但它仍然只是一个计算机程序，因此要以人为本，确保每个人的安全。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/git-repos-best-practices

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://securitylab.github.com/research/octopus-scanner-malware-open-source-supply-chain/
[3]: https://opensource.com/sites/default/files/uploads/git_repo.png (Git repository )
[4]: https://opensource.com/sites/default/files/uploads/git-binary-check.jpg (Git binary check)
[5]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[6]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[7]: https://opensource.com/sites/default/files/uploads/git-cola-manual-add.jpg (Git manual add)
[8]: https://opensource.com/sites/default/files/uploads/git-ignore.jpg (Git ignore)
[9]: https://github.com/github/gitignore
[10]: https://about.gitlab.com/releases/2016/05/22/gitlab-8-8-released
[11]: https://opensource.com/sites/default/files/uploads/git_merge_request.png (Git merge request)
