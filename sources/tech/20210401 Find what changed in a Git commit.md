[#]: subject: (Find what changed in a Git commit)
[#]: via: (https://opensource.com/article/21/4/git-whatchanged)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Find what changed in a Git commit
======
Git offers several ways you can quickly see which files changed in a
commit.
![Code going into a computer.][1]

If you use Git every day, you probably make a lot of commits. If you're using Git every day in a project with other people, it's safe to assume that _everyone_ is making lots of commits. Every day. And this means you're aware of how disorienting a Git log can become, with a seemingly eternal scroll of changes and no sign of what's been changed.

So how do you find out what file changed in a specific commit? It's easier than you think.

### Find what file changed in a commit

To find out which files changed in a given commit, use the `git log --raw` command. It's the fastest and simplest way to get insight into which files a commit affects. The `git log` command is underutilized in general, largely because it has so many formatting options, and many users get overwhelmed by too many choices and, in some cases, unclear documentation.

The log mechanism in Git is surprisingly flexible, though, and the `--raw` option provides a log of commits in your current branch, plus a list of each file that had changes made to it.

Here's the output of a standard `git log`:


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

Even when the author helpfully specifies in the commit message which files changed, the log is fairly terse.

Here's the output of `git log --raw`:


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

This tells you exactly which file was added to the commit and how the file was changed (`A` for added, `M` for modified, `R` for renamed, and `D` for deleted).

### Git whatchanged

The `git whatchanged` command is a legacy command that predates the log function. Its documentation says you're not meant to use it in favor of `git log --raw` and implies it's essentially deprecated. However, I still find it a useful shortcut to (mostly) the same output (although merge commits are excluded), and I anticipate creating an alias for it should it ever be removed. If you don't need to merge commits in your log (and you probably don't, if you're only looking to see files that changed), try `git whatchanged` as an easy mnemonic.

### View changes

Not only can you see which files changed, but you can also make `git log` display exactly what changed in the files. Your Git log can produce an inline diff, a line-by-line display of all changes for each file, with the `--patch` option:


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

In this example, the one-word line "world" was removed from `hello.txt` and the new line "opensource.com" was added.

These patches can be used with common Unix utilities like [diff and patch][4], should you need to make the same changes manually elsewhere. The patches are also a good way to summarize the important parts of what new information a specific commit introduces. This is an invaluable overview when you've introduced a bug during a sprint. To find the cause of the error faster, you can ignore the parts of a file that didn't change and review just the new code.

### Simple commands for complex results

You don't have to understand refs and branches and commit hashes to view what files changed in a commit. Your Git log was designed to report Git activity to you, and if you want to format it in a specific way or extract specific information, it's often a matter of wading through many screens of documentation to put together the right command. Luckily, one of the most common requests about Git history is available with just one or two options: `--raw` and `--patch`. And if you can't remember `--raw`, just think, "Git, what changed?" and type `git whatchanged`.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-whatchanged

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: mailto:tux@example.com
[3]: mailto:Tux@example.com
[4]: https://opensource.com/article/18/8/diffs-patches
