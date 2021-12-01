[#]: subject: "Collaborate on a file using Linux diff and patch"
[#]: via: "https://opensource.com/article/21/11/linux-diff-patch"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Collaborate on a file using Linux diff and patch
======
If you've ever tried to collaborate on files over email or chat, and
you've found yourself trying to describe where you need a change made,
then you'll love diff and patch.
![a checklist for a team][1]

I edit a lot of text files. Sometimes it's code. Other times it's the written word for role-playing games (RPGs), programming books, or general correspondence. Sometimes it's nice to make a change, but for my collaborator to compare my change with what they originally had written. Many people default to office suites, like [LibreOffice][2], using comments or change tracking features. Sometimes a simpler tool makes more sense, though, and for that, you can look at programming history for tools like `diff` and `patch`, which provide standardized formatting for tracking and applying changes to shared files.

Even with a simple file, there's complexity in synchronizing two documents. Some items get changed, others are left alone, new content gets added, and some stay the same but are moved to different places in the document. It's difficult to replicate changes without blissfully accepting that all changes are equally valid, and replacing the old file with the new one. It's also monolithically opaque. There are so many changes that it's difficult to pick out exactly what's changed.

With the `diff` command, you can create a record of how the file has changed, and with `patch` you can "replay" those changes over the old version to bring it up to date with the new version.

### Setup

Suppose you and I are collaborating on a file describing how to make a cup of tea.

So far, the file `tea.md` contains raw copy-paste:


```


Boil water.
Warm the teapot.
Add tea and water to the teapot.
Place a tea cosy over the teapot.
Steep for 6 minutes.
Pour tea into cup.
Add milk.

```

It seems reasonable, but there are always optimizations you can make, so you send the file to me for improvement. In an effort to clarify the tea-making process, I copy the file as `tea-revision.md` and edit it, ending up with this:


```


Warm a teapot in the proving drawer of your oven.
Boil water.
Add tea leaves to a tea strainer.
Add strainer and water to teapot.
Steep for 6 minutes. Keep it warm with a tea cosy.
Pour tea into cup.
Optionally, add warm milk.

```

As expected, some items (`Boil water` and `Pour tea into cup`) are unchanged, while other lines (`Warm the teapot`) have had additions. Some lines are completely new, and some lines are the same but in a different order.

### Create a diff

The `diff` tool displays the difference between two files. There are a few different ways to view the results, but I think the clearest one is the `--unified` (`-u` for short) view, which shows which lines got added or subtracted. A line that's changed in any way is treated as a line that got subtracted and then added. By default, `diff` prints its output to the terminal.

Provide `diff` with the old file and then the new file:


```


$ diff --unified tea.md tea-revised.md 
\--- tea.md      2021-11-13 10:26:25.082110219 +1300
+++ tea-revised.md      2021-11-13 10:26:32.049110664 +1300
@@ -1,7 +1,7 @@
+Warm a teapot in the proving drawer of your oven.
 Boil water.
-Warm the teapot.
-Add tea and water to the teapot.
-Place a tea cosy over the teapot.
-Steep for 6 minutes.
+Add tea leaves to a tea strainer.
+Add strainer and water to teapot.
+Steep for 6 minutes. Keep it warm with a tea cosy.
 Pour tea into cup.
-Add milk.
+Optionally, add warm milk.

```

A plus sign (`+`) at the beginning of a line indicates something that's gotten added to the old file. A minus sign (`-`) at the beginning of a line indicates a line that's gotten removed or changed.

### Create a patch with diff

A patch file is just the output of the `diff --unified` command placed into a file. You can do this using standard Bash redirection:


```
`$ diff -u tea.md tea-revised.md > tea.patch`
```

The contents of the file are exactly the same as what was output to the terminal. I like to view patch files in [Emacs][3], which color-codes each line depending on whether it's gotten added or subtracted.

![A patch file in Emacs][4]

(Seth Kenlon, [CC BY-SA 4.0][5])

### Applying changes with patch

Once I have a patch file, I could send it to you for you to review and, optionally, apply to your old file. You apply a patch with the `patch` command:


```
`$ patch tea.md tea.patch`
```

Lines got added, lines got subtracted, and in the end, you end up with a file identical to my version:


```


$ cat tea.md
Warm a teapot in the proving drawer of your oven.
Boil water.
Add tea leaves to a tea strainer.
Add strainer and water to teapot.
Steep for 6 minutes. Keep it warm with a tea cosy.
Pour tea into cup.
Optionally, add warm milk.

```

There's no limit to how many times you can patch a file. You could iterate on my changes, generate a new patch, and send that to me for review. Sending changes rather than results lets each contributor review what changed, decide what they want to keep or eliminate, and accurately document the process.

### Install

On Linux and macOS, you already have both the `diff` and `patch` commands. On Windows, you can obtain `diff` and `patch` through [Cygwin][6], or use Chocolatey to search for [diffutils][7] and [patch][8].

If you've ever tried to collaborate on files over email or chat, and you've found yourself trying to _describe_ where you need a change made, then you'll love `diff` and `patch`. A carefully structured file, such as code or line-delimited [Markdown][9], is easy to diff, patch, and maintain. 

Take a look at five great open source alternatives to Google Docs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-diff-patch

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
