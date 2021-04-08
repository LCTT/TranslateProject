[#]: subject: (Find what changed in a Git commit)
[#]: via: (https://opensource.com/article/21/4/git-whatchanged)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

查看 Git 提交中发生了什么变化
======
Git 提供了几种方式可以帮你快速查看提交中哪些文件被改变。
![运行在电脑中的代码][1]

如果你每天使用 Git，应该会提交不少改动。如果你每天和其他人在一个项目中使用 Git，假设 _每个人_ 每天的提交都是安全的，你会意识到 Git 日志会变得多么混乱，看似不停地滚动变化，却没有任何改变的迹象。

那么，你该怎样查看指定提交中文件发生哪些变化？这比你想的容易。

### 查看提交中文件发生的变化

为了发现指定提交中哪些文件发生变化，可以使用 `git log --raw` 命令。这是发现提交影响哪些文件的最快速、最方便的方法。`git log` 命令不常用，主要是因为它有太多的格式选项，许多用户在面对很多选择以及在一些情况下不明所以的文档时，会望而却步。

然而，Git 的日志机制非常灵活，`--raw` 选项提供了当前分支中的提交日志，以及更改的文件列表。

以下是标准的 `git log` 输出：


```
$ git log
commit fbbbe083aed75b24f2c77b1825ecab10def0953c (HEAD -&gt; dev, origin/dev)
Author: tux &lt;[tux@example.com][2]&gt;
Date:   Sun Nov 5 21:40:37 2020 +1300

    exit immediately from failed download

commit 094f9948cd995acfc331a6965032ea0d38e01f03 (origin/master, master)
Author: Tux &lt;[tux@example.com][2]&gt;
Date:   Fri Aug 5 02:05:19 2020 +1200

    export makeopts from etc/example.conf

commit 76b7b46dc53ec13316abb49cc7b37914215acd47
Author: Tux &lt;[tux@example.com][2]&gt;
Date:   Sun Jul 31 21:45:24 2020 +1200

    fix typo in help message
```

即使作者在提交消息中指定了哪些文件发生变化，日志也相当简洁。

以下是 `git log --raw` 输出：


```
$ git log --raw
commit fbbbe083aed75b24f2c77b1825ecab10def0953c (HEAD -&gt; dev, origin/dev)
Author: tux &lt;[tux@example.com][2]&gt;
Date:   Sun Nov 5 21:40:37 2020 +1300

    exit immediately from failed download

:100755 100755 cbcf1f3 4cac92f M        src/example.lua

commit 094f9948cd995acfc331a6965032ea0d38e01f03 (origin/master, master)
Author: Tux &lt;[tux@example.com][2]&gt;
Date:   Fri Aug 5 02:05:19 2020 +1200

    export makeopts from etc/example.conf
   
:100755 100755 4c815c0 cbcf1f3 M     src/example.lua
:100755 100755 71653e1 8f5d5a6 M     src/example.spec
:100644 100644 9d21a6f e33caba R100  etc/example.conf  etc/example.conf-default

commit 76b7b46dc53ec13316abb49cc7b37914215acd47
Author: Tux &lt;[tux@example.com][2]&gt;
Date:   Sun Jul 31 21:45:24 2020 +1200

    fix typo in help message

:100755 100755 e253aaf 4c815c0 M        src/example.lua
```

这会准确告诉你哪个文件被添加到提交中，哪些文件发生改变（`A` 是添加，`M` 是修改，`R` 是重命名，`D` 是删除）。

### Git whatchanged

`git whatchanged` 命令是日志功能之前的遗留命令。文档说用户不应该用该命令支持 `git log --raw`，并且暗示它本质上已经被否决了。除了合并提交，我仍然发现它的输出与 `git log --raw` 的输出大部分相同，它是一个有用的快捷方式。如果它被删除的话，我期望为他创建一个别名。如果你只想查看已更改的文件，不需要在日志中合并提交，可以尝试 `git whatchanged` 作为简单的助记符。

### 查看变化

你不仅可以看到哪些文件发生更改，还可以使用 `git log` 显示文件中发生了哪些变化。你的 Git 日志可以生成一个内联比较，用 `--patch` 选项可以逐行显示每个文件的所有更改：


```
commit 62a2daf8411eccbec0af69e4736a0fcf0a469ab1 (HEAD -&gt; master)
Author: Tux &lt;[Tux@example.com][3]&gt;
Date:   Wed Mar 10 06:46:58 2021 +1300

    commit

diff --git a/hello.txt b/hello.txt
index 65a56c3..36a0a7d 100644
\--- a/hello.txt
+++ b/hello.txt
@@ -1,2 +1,2 @@
 Hello
-world
+opensource.com
```

在这个例子中，"world" 这行字从 `hello.txt` 中删掉，"opensource.com" 这行字则添加进去。

如果你需要在其他地方手动进行相同的修改，这些<ruby>补丁<rt>patch</rt></ruby>可以与常见的 Unix 命令一起使用，例如 [diff 与 patch][4]。补丁也是一个好方法，可以总结指定提交中引入新信息的重要部分内容。当你在冲刺阶段引入一个 bug 时，你会发现这里的内容就是非常有价值的概述。为了更快地找到错误的原因，你可以忽略文件中没有更改的部分，只检查新代码。


### 得到复杂结果的简单命令

你不必理解引用、分支和提交哈希，就可以查看提交中更改了哪些文件。你的 Git 日志旨在向你报告 Git 活动，如果你想以特定方式格式化它或者提取特定的信息，通常需要费力地浏览许多文档来组合出正确的命令。幸运的是，Git 历史上最常用的请求之一只有一两个选项：`--raw` 与 `--patch`。如果你不记得 `--raw`，就想想“Git，改变什么了？”，然后输入 `git whatchanged`。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-whatchanged

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: mailto:tux@example.com
[3]: mailto:Tux@example.com
[4]: https://opensource.com/article/18/8/diffs-patches
