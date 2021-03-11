[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 best practices for managing Git repos)
[#]: via: (https://opensource.com/article/20/7/git-repos-best-practices)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

6 个最佳的 Git 仓库管理实践
======
阻止向 Git 中添加内容的主张会使其变得更难管理；
这里有替代方法。
![在家中使用笔记本电脑工作][1]

有权访问源代码使对安全性的分析以及应用程序的安全成为可能。但是，如果没有人真正看过代码，问题就不会被发现，即使人们积极地看代码，通常也要看很多东西。幸运的是，GitHub 拥有一个活跃的安全团队，最近，他们 [发现了已提交到多个 Git 存储库中的特洛伊木马病毒][2]，甚至仓库的所有者也偷偷溜走了。尽管我们无法控制其他人如何管理自己的存储库，但我们可以从他们的错误中吸取教训。为此，本文回顾了将文件添加到自己的存储库中的一些最佳实践。

### 了解您的仓库

![Git 存储库终端][3]

对于安全的 Git 存储库来说大概是 Rule Zero (头号规则)。作为项目维护者，无论您是从自己的开始还是采用别人的，您的工作是了解自己存储库中的内容。您可能没有代码库中关于每个文件的存储列表，但是您需要了解所管理内容的基本组成。如果几十个合并后出现一个偏离的文件，您将可以很容易地识别它，因为您不知道它的用途，并且需要刷新内存检查它。发生这种情况时，请查看文件，并确保准确了解为什么它是必要的。

### 禁止二进制大文件

![终端中 Git 的二进制检查命令][4]

Git 用于文本，无论是用纯文本编写的 C 或 Python 还是 Java 文本，亦或是 JSON，YAML，XML，Markdown，HTML 或类似的文本。Git 对于二进制文件不是很理想。

两者之间的区别是：

```
$ cat hello.txt
This is plain text.
It's readable by humans and machines alike.
Git knows how to version this.

$ git diff hello.txt
diff --git a/hello.txt b/hello.txt
index f227cc3..0d85b44 100644
\--- a/hello.txt
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

二进制文件中的数据无法以解析纯文本相同的方式进行解析，因此，如果二进制文件发生任何更改，则必须重写整个内容。一个版本与另一个版本之间的仅有地区别是快速增加的内容。

更糟糕的是，Git 存储库维护者无法合理地审计二进制数据。这违反了 Rule Zero (头号规则)：应该对存储库的内容了如指掌。

除了常用的 [POSIX(可移植性操作系统接口)][5] 工具之外，您还可以使用 `git diff` 检测二进制文件。当您尝试使用 `--numstat` 选项来比较二进制文件时，Git 返回空结果：

```
$ git diff --numstat /dev/null pixel.png | tee
\-     -   /dev/null =&gt; pixel.png
$ git diff --numstat /dev/null file.txt | tee
5788  0   /dev/null =&gt; list.txt
```

如果您正在考虑将二进制大文件提交到存储库，请停下来先思考一下。如果是二进制文件，则它是由什么生成的。 有充分的理由在构建时生成它们来代替将它们提交存储库？你决定提交二进制数据可行，请确保在 README 文件或类似文件中标识二进制文件的位置，为什么是二进制的原因以及更新它们的协议。必须谨慎执行更新，因为对于提交给二进制大文件的每次更改，该二进制大文件的存储空间实际上都会加倍。

### 保留第三方库

第三方库也不例外。尽管它是开放源代码的众多优点之一，您可以不受限制地重用和重新分发未编写的代码，但是有很多充分的理由不去覆盖存储在您自己的存储库中第三方库。首先，除非您自己检查了所有代码（以及将来的合并），否则您无法准确确定第三方库。其次，当您将第三方库复制到您的 Git 存储库中时，会将焦点从真正的上游源分离出来。从技术上仅对主库的副本有把握，而不对随机存储库的副本有把握。如果您需要锁定特定版本的库，请为开发人员提供项目所需版本的合理 URL，或者使用[Git 子模块][6]。

### 抵制盲目的 `git add`

![Git 手动添加命令终端中][7]

如果您的项目已编译，请不要使用 `git add .`（其中 `.` 是当前目录或特定文件夹的路径）作为添加任意和每一个新内容的简单方法。如果您不是手动编译项目，而是使用 IDE 为您管理项目，则这一点尤其重要。用 IDE 管理项目时，跟踪添加到存储库中的内容非常困难，因此仅添加您实际编写的内容非常重要，而不是在项目文件夹中弹出的任何新对象。

如果您使用 `git add .` 做，请在推送之前检查这一状态里的情况。如果在执行 `git status` 时在项目文件夹中看到一个陌生的对象，请在运行 `make clean` 或等效命令找出它的来源以及为什么仍然在项目的目录中。这是非常好的不会在编译期间重新生成的创建方法，因此在提交前请三思。

### 使用 Git ignore

![终端中的 `Git ignore` 命令][8]

为程序员提供的许多方便的创建众说纷纭。任何项目，程序，富有艺术性的或其他的典型项目目录中都充斥着隐藏的文件，元数据和残留的内容。您可以尝试忽略这些对象，但是 `git status` 中的提示越多，您错过某件事的可能性就越大。

您可以通过维护一个良好的 `gitignore` 文件来为您过滤掉这种噪音。因为这是使用 Git 的用户的共同要求，所以有一些入门 `gitignore` 文件可用。[Github.com/github/gitignore][9] 提供了几个专门创建 `gitignore` 的文件，您可以下载这些文件并将其放置到自己的项目中，几年前 [Gitlab.com][10] 将`gitignore` 模板集成到了存储库创建工作流程中。使用这些帮助您为项目创建适合的 `gitignore` 策略并遵守它。

### 查看合并请求

![Git 合并请求][11]

当您通过电子邮件收到合并或拉取请求或补丁文件时，请勿仅对其进行测试以确保其正常工作。您的工作是阅读新代码进入代码库的并了解其如何产生结果。如果您不同意实施，或者更糟的是，您不理解该实施，请向提交该实施的人发送消息，并要求其进行说明。询问所依赖代码要成为存储库中永久性装置具有优先权，但是这是在你同你的用户的不知道将合并什么到他们将要使用的代码中开启的约定。

### Git 责任

社区致力于开源软件良好的安全性。不要鼓励在您的存储库中使用不良的 Git 实践，也不要忽视克隆的存储库中的安全威胁。Git 功能强大，但它仍然只是一个计算机程序，因此要以人为本，确保每个人的安全。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/git-repos-best-practices

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

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
