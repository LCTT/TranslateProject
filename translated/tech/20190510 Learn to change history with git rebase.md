[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn to change history with git rebase!)
[#]: via: (https://git-rebase.io/)
[#]: author: (git-rebase https://git-rebase.io/)

学习用 git 变基来改变历史！
======

[Git][1] 的核心的附加价值之一就是编辑历史记录的能力。不同于将历史记录视为神圣的记录的版本控制系统，在 Git 中，我们可以根据自己的需要修改历史记录。这为我们提供了很多强大的工具，让我们可以像使用重构来维护良好的软件设计实践一样，编织良好的提交历史。这些工具对于新手甚至是有经验的 Git 用户来说可能会有些生畏，但本指南将帮助我们揭秘强大的 git-rebase。

> 值得注意的是：一般建议不要修改公共分支、共享分支或稳定分支的历史记录。编辑特性分支和个人分支的历史记录是可以的，编辑还没有推送的提交也是可以的。在编辑完提交后，使用 `git push -f` 来强制推送你的修改到个人分支或特性分支。

尽管有这么可怕的警告，但值得一提的是，本指南中提到的一切都是非破坏性操作。实际上，在 Git 中永久丢失数据是相当困难的。当你犯错时的修复方法在本指南的最后会涉及到。

### 设置沙盒

我们不想破坏你的实际版本库，所以在整个指南中，我们将使用一个沙盒版本库。运行这些命令来开始工作。[^1]

```
git init /tmp/rebase-sandbox
cd /tmp/rebase-sandbox
git commit --allow-empty -m"Initial commit"
```

如果你遇到麻烦，只需运行 `rm -rf /tmp/rebase-sandbox`，然后重新运行这些步骤重新开始。本指南的每一步都可以在一个新的沙箱上运行，所以没有必要重做每个任务。

### 修正最近的提交

让我们从简单的事情开始：修复你最近的提交。让我们将一个文件添加到我们的沙盒中，并犯个错误。

```
echo "Hello wrold!" >greeting.txt
git add greeting.txt
git commit -m"Add greeting.txt"
```

修复这个错误是非常容易的。我们只需要编辑文件，然后用 `--amend` 提交就可以了，就像这样：

```
echo "Hello world!" >greeting.txt
git commit -a --amend
```

指定 `-a` 会自动将所有 Git 已经知道的文件进行暂存（即 `--amend`），而 `--amend` 会将更改的内容压制到最近的提交中。保存并退出你的编辑器（如果你愿意的话，现在你有机会修改提交信息）。你可以通过运行 `--git show` 看到修复的提交。

```
commit f5f19fbf6d35b2db37dcac3a55289ff9602e4d00 (HEAD -> master)
Author: Drew DeVault 
Date:   Sun Apr 28 11:09:47 2019 -0400

    Add greeting.txt

diff --git a/greeting.txt b/greeting.txt
new file mode 100644
index 0000000..cd08755
--- /dev/null
+++ b/greeting.txt
@@ -0,0 +1 @@
+Hello world!
```

### 修复更旧的提交

`--amend` 只对最近的提交有效。如果你需要修正一个较旧的提交，会发生什么？让我们相应地从设置沙盒开始：

```
echo "Hello!" >greeting.txt
git add greeting.txt
git commit -m"Add greeting.txt"

echo "Goodbye world!" >farewell.txt
git add farewell.txt
git commit -m"Add farewell.txt"
```

看起来 `greeting.txt ` 像是丢失了 `"world"`。让我们正常地写个提交来解决这个问题：

```
echo "Hello world!" >greeting.txt
git commit -a -m"fixup greeting.txt"
```

现在文件看起来正确，但是我们的历史记录可以会更好一点 —— 让我们使用新的提交来“修复”（`fixup`）最后一个提交。为此，我们需要引入一个新工具：交互式变基。我们将以这种方式编辑最后三个提交，因此我们将运行`git rebase -i HEAD~3`（`-i` 代表交互式）。这样会打开文本编辑器，如下所示：

```
pick 8d3fc77 Add greeting.txt
pick 2a73a77 Add farewell.txt
pick 0b9d0bb fixup greeting.txt

# Rebase f5f19fb..0b9d0bb onto f5f19fb (3 commands)
#
# Commands:
# p, pick <commit> = use commit
# f, fixup <commit> = like "squash", but discard this commit's log message
```

这是变基计划，通过编辑此文件，你可以指导 Git 如何编辑历史记录。我已经将该摘要删节为仅与变基计划这一部分相关的细节，但是你可以在文本编辑器中浏览完整的摘要。

当我们保存并关闭编辑器时，Git 将从其历史记录中删除所有这些提交，然后一次执行每一行。默认情况下，它将选取（`pick`）每个提交，将其从堆中召唤出来并将其添加到分支中。如果我们对此文件根本没有做任何编辑，则将直接回到起点，按原样选取每个提交。现在，我们将使用我最喜欢的功能之一：修复（`fixup`）。编辑第三行，将操作从 `pick` 更改为 `fixup`，并将其立即移至我们要“修复”的提交之后：

```
pick 8d3fc77 Add greeting.txt
fixup 0b9d0bb fixup greeting.txt
pick 2a73a77 Add farewell.txt
```

**技巧**：我们也可以只用 `f` 来缩写它，以加快下次的速度。

保存并退出编辑器，Git 将运行这些命令。我们可以检查日志以验证结果：

```
$ git log -2 --oneline
fcff6ae (HEAD -> master) Add farewell.txt
a479e94 Add greeting.txt
```

### 将多个提交压扁为一个

在工作时，当你达到较小的里程碑或修复以前的提交中的错误时，你可能会发现写很多提交很有用。但是，在将你的工作合并到 `master` 分支之前，将这些提交“压扁”（`squash`）在一起以使历史记录更清晰可能很有用。为此，我们将使用“压扁”（`squash `）操作。让我们从编写一堆提交开始，如果要加快速度，只需复制并粘贴这些：

```
git checkout -b squash
for c in H e l l o , ' ' w o r l d; do
    echo "$c" >>squash.txt
    git add squash.txt
    git commit -m"Add '$c' to squash.txt"
done
```

要做出一个写着 “Hello，world”的文件，要做很多事情！让我们开始另一个交互式变基，将它们压扁在一起。请注意，我们首先签出了一个分支来进行尝试。因此，因为我们使用 `git rebase -i master` 进行的分支，我们可以快速变基所有提交。结果：

```
pick 1e85199 Add 'H' to squash.txt
pick fff6631 Add 'e' to squash.txt
pick b354c74 Add 'l' to squash.txt
pick 04aaf74 Add 'l' to squash.txt
pick 9b0f720 Add 'o' to squash.txt
pick 66b114d Add ',' to squash.txt
pick dc158cd Add ' ' to squash.txt
pick dfcf9d6 Add 'w' to squash.txt
pick 7a85f34 Add 'o' to squash.txt
pick c275c27 Add 'r' to squash.txt
pick a513fd1 Add 'l' to squash.txt
pick 6b608ae Add 'd' to squash.txt

# Rebase 1af1b46..6b608ae onto 1af1b46 (12 commands)
#
# Commands:
# p, pick <commit> = use commit
# s, squash <commit> = use commit, but meld into previous commit
```

**技巧**：你的本地 `master` 分支独立于远程 `master` 分支而发展，并且 Git 将远程分支存储为 `origin/master`。结合这种技巧，`git rebase -i origin/master` 通常是一种非常方便的方法，可以变基所有尚未合并到上游的提交！

我们将把所有这些更改压扁到第一个提交中。为此，将第一行除外的每个“选取”（`pick`）操作都更改为“压扁”（`squash `），如下所示：

```
pick 1e85199 Add 'H' to squash.txt
squash fff6631 Add 'e' to squash.txt
squash b354c74 Add 'l' to squash.txt
squash 04aaf74 Add 'l' to squash.txt
squash 9b0f720 Add 'o' to squash.txt
squash 66b114d Add ',' to squash.txt
squash dc158cd Add ' ' to squash.txt
squash dfcf9d6 Add 'w' to squash.txt
squash 7a85f34 Add 'o' to squash.txt
squash c275c27 Add 'r' to squash.txt
squash a513fd1 Add 'l' to squash.txt
squash 6b608ae Add 'd' to squash.txt
```

保存并关闭编辑器时，Git 会考虑片刻，然后再次打开编辑器以修改最终的提交消息。你会看到以下内容：

```
# This is a combination of 12 commits.
# This is the 1st commit message:

Add 'H' to squash.txt

# This is the commit message #2:

Add 'e' to squash.txt

# This is the commit message #3:

Add 'l' to squash.txt

# This is the commit message #4:

Add 'l' to squash.txt

# This is the commit message #5:

Add 'o' to squash.txt

# This is the commit message #6:

Add ',' to squash.txt

# This is the commit message #7:

Add ' ' to squash.txt

# This is the commit message #8:

Add 'w' to squash.txt

# This is the commit message #9:

Add 'o' to squash.txt

# This is the commit message #10:

Add 'r' to squash.txt

# This is the commit message #11:

Add 'l' to squash.txt

# This is the commit message #12:

Add 'd' to squash.txt

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Sun Apr 28 14:21:56 2019 -0400
#
# interactive rebase in progress; onto 1af1b46
# Last commands done (12 commands done):
#    squash a513fd1 Add 'l' to squash.txt
#    squash 6b608ae Add 'd' to squash.txt
# No commands remaining.
# You are currently rebasing branch 'squash' on '1af1b46'.
#
# Changes to be committed:
#   new file:   squash.txt
#
```

默认情况下，这是所有要压扁的提交的消息的组合，但是像这样将其保留肯定不是你想要的。不过，旧的提交消息在编写新的提交消息时可能很有用，所以放在这里以供参考。

**提示**：你在上一节中了解的“修复”（`fixup`）命令也可以用于此目的，但它会丢弃压缩的提交消息。

让我们删除所有内容，并用更好的提交消息替换它，如下所示：

```
Add squash.txt with contents "Hello, world"

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Sun Apr 28 14:21:56 2019 -0400
#
# interactive rebase in progress; onto 1af1b46
# Last commands done (12 commands done):
#    squash a513fd1 Add 'l' to squash.txt
#    squash 6b608ae Add 'd' to squash.txt
# No commands remaining.
# You are currently rebasing branch 'squash' on '1af1b46'.
#
# Changes to be committed:
#   new file:   squash.txt
#
```

保存并退出编辑器，然后检查你的 Git 日志，成功！

```
commit c785f476c7dff76f21ce2cad7c51cf2af00a44b6 (HEAD -> squash)
Author: Drew DeVault
Date:   Sun Apr 28 14:21:56 2019 -0400

    Add squash.txt with contents "Hello, world"
```

在继续之前，让我们将所做的更改拉入 `master` 分支中，并摆脱掉这一草稿。我们可以像使用 `git merge` 一样使用 `git rebase`，但是它避免了创建合并提交：

```
git checkout master
git rebase squash
git branch -D squash
```

除非我们实际上正在合并无关的历史记录，否则我们通常希望避免使用 `git merge`。如果你有两个不同的分支，则 `git merge` 对于记录合并它们的时间非常有用。在正常工作过程中，变基通常更为合适。

### 将一个提交拆分为多个

有时会发生相反的问题：一个提交太大了。让我们来看一看拆分它们。这次，让我们写一些实际的代码。从一个简单的 C 程序 `program2 ` 开始（你仍然可以将此代码段复制并粘贴到你的 shell 中以快速执行此操作）：

```
cat <<EOF >main.c
int main(int argc, char *argv[]) {
    return 0;
}
EOF
```

首先提交它：

```
git add main.c
git commit -m"Add C program skeleton"
```

然后把这个程序扩展一些：

```
cat <<EOF >main.c
#include &ltstdio.h>

const char *get_name() {
    static char buf[128];
    scanf("%s", buf);
    return buf;
}

int main(int argc, char *argv[]) {
    printf("What's your name? ");
    const char *name = get_name();
    printf("Hello, %s!\n", name);
    return 0;
}
EOF
```

提交之后，我们就可以准备学习如何将其拆分：

```
git commit -a -m"Flesh out C program"
```

第一步是启动交互式变基。让我们用 `git rebase -i HEAD~2` 来变基这两个提交，变基计划如下：

```
pick 237b246 Add C program skeleton
pick b3f188b Flesh out C program

# Rebase c785f47..b3f188b onto c785f47 (2 commands)
#
# Commands:
# p, pick <commit> = use commit
# e, edit <commit> = use commit, but stop for amending
```

将第二个提交的命令从 `pick` 更改为 `edit`，然后保存并关闭编辑器。Git 会考虑一秒钟，然后向你建议：

```
Stopped at b3f188b...  Flesh out C program
You can amend the commit now, with

  git commit --amend

Once you are satisfied with your changes, run

  git rebase --continue
```

我们可以按照以下说明为提交添加新的更改，但我们可以通过运行 `git reset HEAD^` 来进行“软重置” [^3]。如果在此之后运行 `git status`，你将看到它取消提交最新的提交，并将其更改添加到工作树中：

```
Last commands done (2 commands done):
   pick 237b246 Add C program skeleton
   edit b3f188b Flesh out C program
No commands remaining.
You are currently splitting a commit while rebasing branch 'master' on 'c785f47'.
  (Once your working directory is clean, run "git rebase --continue")

Changes not staged for commit:
  (use "git add ..." to update what will be committed)
  (use "git checkout -- ..." to discard changes in working directory)

  modified:   main.c

no changes added to commit (use "git add" and/or "git commit -a")
```

为了对此进行拆分，我们将进行交互式提交。这使我们能够选择性地仅提交工作树中的特定更改。运行 `git commit -p` 开始这个过程，将出现以下提示：

```
diff --git a/main.c b/main.c
index b1d9c2c..3463610 100644
--- a/main.c
+++ b/main.c
@@ -1,3 +1,14 @@
+#include &ltstdio.h>
+
+const char *get_name() {
+    static char buf[128];
+    scanf("%s", buf);
+    return buf;
+}
+
 int main(int argc, char *argv[]) {
+    printf("What's your name? ");
+    const char *name = get_name();
+    printf("Hello, %s!\n", name);
     return 0;
 }
Stage this hunk [y,n,q,a,d,s,e,?]?
```

Git 仅向你提供了一个“大块”（即单个更改）以进行提交。不过，这太大了，让我们使用 `s` 命令将这个“大块”拆分成较小的部分。

```
Split into 2 hunks.
@@ -1 +1,9 @@
+#include <stdio.h>
+
+const char *get_name() {
+    static char buf[128];
+    scanf("%s", buf);
+    return buf;
+}
+
 int main(int argc, char *argv[]) {
Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]?
```

**提示**：如果你对其他选项感到好奇，请按 `?` 汇总显示。

这个大块看起来更好：单一、独立的更改。让我们按 `y` 来回答问题（并暂存那个“大块”），然后按 `q` 以“退出”交互式会话并继续进行提交。会弹出编辑器，要求输入合适的提交消息。

```
Add get_name function to C program

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# interactive rebase in progress; onto c785f47
# Last commands done (2 commands done):
#    pick 237b246 Add C program skeleton
#    edit b3f188b Flesh out C program
# No commands remaining.
# You are currently splitting a commit while rebasing branch 'master' on 'c785f47'.
#
# Changes to be committed:
#   modified:   main.c
#
# Changes not staged for commit:
#   modified:   main.c
#
```

保存并关闭编辑器，然后我们进行第二次提交。我们可以执行另一个交互式提交，但是由于我们只想在此提交中包括其余更改，因此我们将执行以下操作：

```
git commit -a -m"Prompt user for their name"
git rebase --continue
```

最后一条命令告诉 Git 我们已经完成了此提交的编辑，并继续执行下一个变基命令。就是这样！运行 `git log` 来查看你的劳动成果：

```
$ git log -3 --oneline
fe19cc3 (HEAD -> master) Prompt user for their name
659a489 Add get_name function to C program
237b246 Add C program skeleton
```

### Reordering commits

This one is pretty easy. Let's start by setting up our sandbox:

```
echo "Goodbye now!" >farewell.txt
git add farewell.txt
git commit -m"Add farewell.txt"

echo "Hello there!" >greeting.txt
git add greeting.txt
git commit -m"Add greeting.txt"

echo "How're you doing?" >inquiry.txt
git add inquiry.txt
git commit -m"Add inquiry.txt"
```

The git log should now look like this:

```
f03baa5 (HEAD -> master) Add inquiry.txt
a4cebf7 Add greeting.txt
90bb015 Add farewell.txt
```

Clearly, this is all out of order. Let's do an interactive rebase of the past 3 commits to resolve this. Run `git rebase -i HEAD~3` and this rebase plan will appear:

```
pick 90bb015 Add farewell.txt
pick a4cebf7 Add greeting.txt
pick f03baa5 Add inquiry.txt

# Rebase fe19cc3..f03baa5 onto fe19cc3 (3 commands)
#
# Commands:
# p, pick <commit> = use commit
#
# These lines can be re-ordered; they are executed from top to bottom.
```

The fix is now straightforward: just reorder these lines in the order you wish for the commits to appear. Should look something like this:

```
pick a4cebf7 Add greeting.txt
pick f03baa5 Add inquiry.txt
pick 90bb015 Add farewell.txt
```

Save and close your editor and git will do the rest for you. Note that it's possible to end up with conflicts when you do this in practice - click here for help resolving conflicts.

### git pull --rebase

If you've been writing some commits on a branch which has been updated upstream, normally `git pull` will create a merge commit. In this respect, `git pull`'s behavior by default is equivalent to:

```
git fetch origin
git merge origin/master
```

There's another option, which is often more useful and leads to a much cleaner history: `git pull --rebase`. Unlike the merge approach, this is equivalent to the following:

```
git fetch origin
git rebase origin/master
```

The merge approach is simpler and easier to understand, but the rebase approach is almost always what you want to do if you understand how to use git rebase. If you like, you can set it as the default behavior like so:

```
git config --global pull.rebase true
```

When you do this, technically you're applying the procedure we discuss in the next section... so let's explain what it means to do that deliberately, too.

### Using git rebase to... rebase

Ironically, the feature of git rebase that I use the least is the one it's named for: rebasing branches. Say you have the following branches:

```
o--o--o--o--> master
   \--o--o--> feature-1
      \--o--> feature-2
```

It turns out feature-2 doesn't depend on any of the changes in feature-1, so you can just base it off of master. The fix is thus:

```
git checkout feature-2
git rebase master
```

The non-interactive rebase does the default operation for all implicated commits ("pick")4, which simply rolls your history back to the last common anscestor and replays the commits from both branches. Your history now looks like this:

```
o--o--o--o--> master
   |     \--o--> feature-2
   \--o--o--> feature-1
```

### Resolving conflicts

The details on resolving merge conflicts are beyond the scope of this guide - keep your eye out for another guide for this in the future. Assuming you're familiar with resolving conflicts in general, here are the specifics that apply to rebasing.

The details on resolving merge conflicts are beyond the scope of this guide - keep your eye out for another guide for this in the future. Assuming you're familiar with resolving conflicts in general, here are the specifics that apply to rebasing.

Sometimes you'll get a merge conflict when doing a rebase, which you can handle just like any other merge conflict. Git will set up the conflict markers in the affected files, `git status` will show you what you need to resolve, and you can mark files as resolved with `git add` or `git rm`. However, in the context of a git rebase, there are two options you should be aware of.

The first is how you complete the conflict resolution. Rather than `git commit` like you'll use when addressing conflicts that arise from `git merge`, the appropriate command for rebasing is `git rebase --continue`. However, there's another option available to you: `git rebase --skip`. This will skip the commit you're working on, and it won't be included in the rebase. This is most common when doing a non-interactive rebase, when git doesn't realize that a commit it's pulled from the "other" branch is an updated version of the commit that it conflicts with on "our" branch.

### Help! I broke it!

No doubt about it - rebasing can be hard sometimes. If you've made a mistake and in so doing lost commits which you needed, then `git reflog` is here to save the day. Running this command will show you every operation which changed a ref, or reference - that is, branches and tags. Each line shows you what the old reference pointed to, and you can `git cherry-pick`, `git checkout`, `git show`, or use any other operation on git commits once thought lost.


--------------------------------------------------------------------------------

via: https://git-rebase.io/

作者：[git-rebase][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://git-rebase.io/
[b]: https://github.com/lujun9972
[1]: https://git-scm.com/
[2]: https://git-scm.com/docs/git-rebase
