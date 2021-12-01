[#]: subject: "Collaborate on a file using Linux diff and patch"
[#]: via: "https://opensource.com/article/21/11/linux-diff-patch"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14037-1.html"

使用 Linux 的 diff 和 patch 对文件进行协作
======

> 如果你曾经试图通过电子邮件或聊天来协作处理文件，并且发现自己试图描述需要修改的地方，那么你会喜欢 `diff` 和  `patch` 的。

![](https://img.linux.net.cn/data/attachment/album/202112/01/102607jmjbpu1jk1as61j1.jpg)

我编辑过很多文本文件。有时是代码。其他时候是角色扮演游戏（RPG）、编程书籍或一般信件的书面文字。有时候，做一个修改，而能让我的协作者把我的修改和他们原来写的东西进行比较就更好了。许多人默认使用办公套件（如 [LibreOffice][2]）的注释或更改跟踪功能。不过有时更简单的工具更有意义，为此，你可以看看像 `diff` 和 `patch` 这样的工具的编程历史，它们为跟踪和应用共享文件的变化提供了标准化的格式。

即使对于简单的文件，在同步两个文件时也有复杂性。一些项目被改变，另一些被保留，新的内容被添加，还有一些保持不变，但被移到文件的不同位置。如果接受所有的变化，并且用新文件替换旧文件，就很难复制变化。它也是整体不透明的。如果变化很多，就很难挑出到底发生了什么变化。

通过 `diff` 命令，你可以创建一个文件变化的记录，通过 `patch` 你可以在旧版本上“重放”这些变化，使其与新版本保持一致。

### 设置

假设你和我正在合作编写一个描述如何泡茶的文件。

到目前为止，文件 `tea.md` 包含原始的复制粘贴来的内容：

```
烧开水。
加热茶壶。
在茶壶中加入茶和水。
在茶壶上放置一个茶叶滤网。
浸泡 6 分钟。
将茶倒入杯中。
加入牛奶。
```

这似乎很合理，但总有一些优化可以做，所以你把文件发给我改进。为了澄清泡茶过程，我把文件复制为`tea-revision.md`，并进行编辑，最后是这样的：

```
在烤箱的抽屉中加热茶壶。
烧开水。
将茶叶放入茶叶滤网。
将滤网和水加入茶壶。
浸泡 6 分钟。用茶壶罩保温。
将茶倒入杯中。
可以选择加入温牛奶。
```

正如预期的那样，一些项目（“烧开水”和“将茶倒入杯中”）没有变化，而其他行（“加热茶壶”）则有增加。有些行是全新的，有些行是相同的，但顺序不同。

### 创建一个差异

`diff` 工具会显示两个文件之间的差异。有几种不同的方法来查看结果，但我认为最清楚的是 `—unified`（简写为 `-u`）视图，它显示哪些行被增加或减少了。以任何方式改变的行都被视为先减后增的行。默认情况下，`diff` 将其输出打印到终端。

向 `diff` 提供旧文件，然后是新文件：

```
$ diff --unified tea.md tea-revised.md 
--- tea.md      2021-11-13 10:26:25.082110219 +1300
+++ tea-revised.md      2021-11-13 10:26:32.049110664 +1300
@@ -1,7 +1,7 @@
+在烤箱的抽屉中加热茶壶。
 烧开水。
-加热茶壶。
-在茶壶中加入茶和水。
-在茶壶上放置一个茶叶滤网。
-浸泡 6 分钟。
+将茶叶放入茶叶滤网。
+将滤网和水加入茶壶。
+浸泡 6 分钟。用茶壶罩保温。
 将茶倒入杯中。
-加入牛奶。
+可以选择加入温牛奶。
```

行首的加号（`+`）表示在旧文件中增加了一些内容。行首的减号（`-`）表示被删除或改变的行。

### 用 diff 创建一个补丁

补丁文件就是将 `diff —unified` 命令的输出放到一个文件中。你可以用标准的 Bash 重定向来做这件事：

```
$ diff -u tea.md tea-revised.md > tea.patch
```

该文件的内容与输出到终端的内容完全相同。我喜欢在 [Emacs][3] 中查看补丁文件，它对每一行进行颜色编码，取决于它是被添加还是被减去。

![Emacs中的补丁文件][4]

### 用补丁应用修改

一旦我有了补丁文件，我就可以把它发给你，让你审查，并且可以选择应用到你的旧文件中。你可以用 `patch` 命令来应用一个补丁。

```
$ patch tea.md tea.patch
```

增加了一些行，减少了一些行，最后，你得到了一个与我的版本相同的文件：

```
$ cat tea.md
在烤箱的抽屉中加热茶壶。
烧开水。
将茶叶放入茶叶滤网。
将滤网和水加入茶壶。
浸泡 6 分钟。用茶壶罩保温。
将茶倒入杯中。
可以选择加入温牛奶。
```

你可以给一个文件打多少次补丁，这是没有限制的。你可以对我的修改进行迭代，生成一个新的补丁，然后发给我审核。发送修改内容而不是结果，可以让每个贡献者审查修改的内容，决定他们要保留或删除的内容，并准确地记录过程。

### 安装

在 Linux 和 macOS 上，你已经有了 `diff` 和 `patch` 命令。在 Windows 上，你可以通过 [Cygwin][6] 获得 `diff` 和 `patch`，或者使用 Chocolatey 搜索 [diffutils][7] 和 [patch][8]。

如果你曾经试图通过电子邮件或聊天来协作处理文件，并且发现自己需要 _描述_ 需要修改的地方，那么你会喜欢 `diff` 和 `patch`。一个结构严谨的文件，如代码或以行为单位的 [Markdown][9]，很容易进行差异比较、补丁和维护。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-diff-patch

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://opensource.com/article/21/9/libreoffice-tips
[3]: https://opensource.com/article/20/12/emacs
[4]: https://opensource.com/sites/default/files/uploads/emacs_0_1.jpg (A patch file in Emacs)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://cygwin.com
[7]: https://community.chocolatey.org/packages/diffutils
[8]: https://community.chocolatey.org/packages/patch
[9]: https://opensource.com/article/19/9/introduction-markdown
