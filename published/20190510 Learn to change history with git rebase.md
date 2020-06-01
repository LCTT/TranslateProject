[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12271-1.html)
[#]: subject: (Learn to change history with git rebase!)
[#]: via: (https://git-rebase.io/)
[#]: author: (git-rebase https://git-rebase.io/)

学习用 Git 变基来改变历史！
======

[Git][1] 核心的附加价值之一就是编辑历史记录的能力。与将历史记录视为神圣的记录的版本控制系统不同，在 Git 中，我们可以修改历史记录以适应我们的需要。这为我们提供了很多强大的工具，让我们可以像使用重构来维护良好的软件设计实践一样，编织良好的提交历史。这些工具对于新手甚至是有经验的 Git 用户来说可能会有些令人生畏，但本指南将帮助我们揭开强大的 git-rebase 的神秘面纱。

> 值得注意的是：一般建议不要修改公共分支、共享分支或稳定分支的历史记录。编辑特性分支和个人分支的历史记录是可以的，编辑还没有推送的提交也是可以的。在编辑完提交后，可以使用 `git push -f` 来强制推送你的修改到个人分支或特性分支。

尽管有这么可怕的警告，但值得一提的是，本指南中提到的一切都是非破坏性操作。实际上，在 Git 中永久丢失数据是相当困难的。本指南结尾介绍了在犯错误时进行纠正的方法。

### 设置沙盒

我们不想破坏你的任何实际的版本库，所以在整个指南中，我们将使用一个沙盒版本库。运行这些命令来开始工作。[^1]

```
git init /tmp/rebase-sandbox
cd /tmp/rebase-sandbox
git commit --allow-empty -m"Initial commit"
```

如果你遇到麻烦，只需运行 `rm -rf /tmp/rebase-sandbox`，并重新运行这些步骤即可重新开始。本指南的每一步都可以在新的沙箱上运行，所以没有必要重做每个任务。

### 修正最近的提交

让我们从简单的事情开始：修复你最近的提交。让我们向沙盒中添加一个文件，并犯个错误。

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

指定 `-a` 会自动将所有 Git 已经知道的文件进行暂存（例如 Git 添加的），而 `--amend` 会将更改的内容压扁到最近的提交中。保存并退出你的编辑器（如果需要，你现在可以修改提交信息）。你可以通过运行 `git show` 看到修复的提交。

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

### 修复较旧的提交

`--amend` 仅适用于最近的提交。如果你需要修正一个较旧的提交会怎么样？让我们从相应地设置沙盒开始：

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

现在文件看起来正确，但是我们的历史记录可以更好一点 —— 让我们使用新的提交来“修复”（`fixup`）最后一个提交。为此，我们需要引入一个新工具：交互式变基。我们将以这种方式编辑最后三个提交，因此我们将运行 `git rebase -i HEAD~3`（`-i` 代表交互式）。这样会打开文本编辑器，如下所示：

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

这是变基计划，通过编辑此文件，你可以指导 Git 如何编辑历史记录。我已经将该摘要削减为仅与变基计划这一部分相关的细节，但是你可以在文本编辑器中浏览完整的摘要。

当我们保存并关闭编辑器时，Git 将从其历史记录中删除所有这些提交，然后一次执行一行。默认情况下，它将选取（`pick`）每个提交，将其从堆中召唤出来并添加到分支中。如果我们对此文件根本没有做任何编辑，则将直接回到起点，按原样选取每个提交。现在，我们将使用我最喜欢的功能之一：修复（`fixup`）。编辑第三行，将操作从 `pick` 更改为 `fixup`，并将其立即移至我们要“修复”的提交之后：

```
pick 8d3fc77 Add greeting.txt
fixup 0b9d0bb fixup greeting.txt
pick 2a73a77 Add farewell.txt
```

> **技巧**：我们也可以只用 `f` 来缩写它，以加快下次的速度。

保存并退出编辑器，Git 将运行这些命令。我们可以检查日志以验证结果：

```
$ git log -2 --oneline
fcff6ae (HEAD -> master) Add farewell.txt
a479e94 Add greeting.txt
```

### 将多个提交压扁为一个

在工作时，当你达到较小的里程碑或修复以前的提交中的错误时，你可能会发现写很多提交很有用。但是，在将你的工作合并到 `master` 分支之前，将这些提交“压扁”（`squash`）到一起以使历史记录更清晰可能很有用。为此，我们将使用“压扁”（`squash `）操作。让我们从编写一堆提交开始，如果要加快速度，只需复制并粘贴这些：

```
git checkout -b squash
for c in H e l l o , ' ' w o r l d; do
    echo "$c" >>squash.txt
    git add squash.txt
    git commit -m"Add '$c' to squash.txt"
done
```

要制作出一个写着 “Hello，world” 的文件，要做很多事情！让我们开始另一个交互式变基，将它们压扁在一起。请注意，我们首先签出了一个分支来进行尝试。因此，因为我们使用 `git rebase -i master` 进行的分支，我们可以快速变基所有提交。结果：

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

> **技巧**：你的本地 `master` 分支独立于远程 `master` 分支而发展，并且 Git 将远程分支存储为 `origin/master`。结合这种技巧，`git rebase -i origin/master` 通常是一种非常方便的方法，可以变基所有尚未合并到上游的提交！

我们将把所有这些更改压扁到第一个提交中。为此，将第一行除外的每个“选取”（`pick`）操作都更改为“压扁”（`squash`），如下所示：

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

> **提示**：你在上一节中了解的“修复”（`fixup`）命令也可以用于此目的，但它会丢弃压扁的提交的消息。

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

除非我们实际上正在合并无关的历史记录，否则我们通常希望避免使用 `git merge`。如果你有两个不同的分支，则 `git merge` 对于记录它们合并的时间非常有用。在正常工作过程中，变基通常更为合适。

### 将一个提交拆分为多个

有时会发生相反的问题：一个提交太大了。让我们来看一看拆分它们。这次，让我们写一些实际的代码。从一个简单的 C 程序 [^2] 开始（你仍然可以将此代码段复制并粘贴到你的 shell 中以快速执行此操作）：

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

第一步是启动交互式变基。让我们用 `git rebase -i HEAD~2` 来变基这两个提交，给出的变基计划如下：

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

我们可以按照以下说明为提交*添加*新的更改，但我们可以通过运行 `git reset HEAD^` 来进行“软重置” [^3]。如果在此之后运行 `git status`，你将看到它取消了提交最新的提交，并将其更改添加到工作树中：

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

为了对此进行拆分，我们将进行*交互式提交*。这使我们能够选择性地仅提交工作树中的特定更改。运行 `git commit -p` 开始此过程，你将看到以下提示：

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

> **提示**：如果你对其他选项感到好奇，请按 `?` 汇总显示。

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

保存并关闭编辑器，然后我们进行第二次提交。我们可以执行另一次交互式提交，但是由于我们只想在此提交中包括其余更改，因此我们将执行以下操作：

```
git commit -a -m"Prompt user for their name"
git rebase --continue
```

最后一条命令告诉 Git 我们已经完成了此提交的编辑，并继续执行下一个变基命令。这样就行了！运行 `git log` 来查看你的劳动成果：

```
$ git log -3 --oneline
fe19cc3 (HEAD -> master) Prompt user for their name
659a489 Add get_name function to C program
237b246 Add C program skeleton
```

### 重新排序提交

这很简单。让我们从设置沙箱开始：

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

现在 `git log` 看起来应如下所示：

```
f03baa5 (HEAD -> master) Add inquiry.txt
a4cebf7 Add greeting.txt
90bb015 Add farewell.txt
```

显然，这都是乱序。让我们对过去的 3 个提交进行交互式变基来解决此问题。运行 `git rebase -i HEAD~3`，这个变基规划将出现：

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

现在，解决方法很简单：只需按照你希望提交出现的顺序重新排列这些行。应该看起来像这样：

```
pick a4cebf7 Add greeting.txt
pick f03baa5 Add inquiry.txt
pick 90bb015 Add farewell.txt
```

保存并关闭你的编辑器，而 Git 将为你完成其余工作。请注意，在实践中这样做可能会导致冲突，参看下面章节以获取解决冲突的帮助。

### git pull --rebase

如果你一直在由上游更新的分支 `<branch>`（比如说原始远程）上做一些提交，通常 `git pull` 会创建一个合并提交。在这方面，`git pull` 的默认行为等同于：

```
git fetch origin <branch>
git merge origin/<branch>
```

假设本地分支 `<branch>` 配置为从原始远程跟踪 `<branch>` 分支，即：

```
$ git config branch.<branch>.remote
origin
$ git config branch.<branch>.merge
refs/heads/<branch>
```
还有另一种选择，它通常更有用，并且会让历史记录更清晰：`git pull --rebase`。与合并方式不同，这基本上 [^4] 等效于以下内容：

```
git fetch origin
git rebase origin/<branch>
```

合并方式更简单易懂，但是如果你了解如何使用 `git rebase`，那么变基方式几乎可以做到你想要做的任何事情。如果愿意，可以将其设置为默认行为，如下所示：

```
git config --global pull.rebase true
```

当你执行此操作时，从技术上讲，你在应用我们在下一节中讨论的过程……因此，让我们也解释一下故意执行此操作的含义。

### 使用 git rebase 来变基

具有讽刺意味的是，我最少使用的 Git 变基功能是它以之命名的功能：变基分支。假设你有以下分支：

```
A--B--C--D--> master
   \--E--F--> feature-1
      \--G--> feature-2
```

事实证明，`feature-2` 不依赖于 `feature-1` 的任何更改，它依赖于提交 E，因此你可以将其作为基础脱离 `master`。因此，解决方法是：

```
git rebase --onto master feature-1 feature-2
```

非交互式变基对所有牵连的提交都执行默认操作（`pick`）[^5] ，它只是简单地将不在 `feature-1` 中的 `feature-2` 中提交重放到 `master` 上。你的历史记录现在看起来像这样：

```
A--B--C--D--> master
   |     \--G--> feature-2
   \--E--F--> feature-1
```

### 解决冲突

解决合并冲突的详细信息不在本指南的范围内，将来请你注意另一篇指南。假设你熟悉通常的解决冲突的方法，那么这里是专门适用于变基的部分。

有时，在进行变基时会遇到合并冲突，你可以像处理其他任何合并冲突一样处理该冲突。Git 将在受影响的文件中设置冲突标记，`git status` 将显示你需要解决的问题，并且你可以使用 `git add` 或 `git rm` 将文件标记为已解决。但是，在 `git rebase` 的上下文中，你应该注意两个选项。

首先是如何完成冲突解决。解决由于 `git merge` 引起的冲突时，与其使用 `git commit` 那样的命令，更适当的变基命令是 `git rebase --continue`。但是，还有一个可用的选项：`git rebase --skip`。 这将跳过你正在处理的提交，它不会包含在变基中。这在执行非交互性变基时最常见，这时 Git 不会意识到它从“其他”分支中提取的提交是与“我们”分支上冲突的提交的更新版本。

### 帮帮我！ 我把它弄坏了！

毫无疑问，变基有时会很难。如果你犯了一个错误，并因此而丢失了所需的提交，那么可以使用 `git reflog` 来节省下一天的时间。运行此命令将向你显示更改一个引用（即分支和标记）的每个操作。每行显示你的旧引用所指向的内容，你可对你认为丢失的 Git 提交执行 `git cherry-pick`、`git checkout`、`git show` 或任何其他操作。

[^1]: 我们添加了一个空的初始提交以简化本教程的其余部分，因为要对版本库的初始提交进行变基需要特殊的命令（即` git rebase --root`）。 
[^2]: 如果要编译此程序，请运行 `cc -o main main.c`，然后运行 `./main` 查看结果。
[^3]: 实际上，这是“混合重置”。“软重置”（使用 `git reset --soft` 完成）将暂存更改，因此你无需再次 `git add` 添加它们，并且可以一次性提交所有更改。这不是我们想要的。我们希望选择性地暂存部分更改，以拆分提交。
[^4]: 实际上，这取决于上游分支本身是否已变基或删除/压扁了某些提交。`git pull --rebase` 尝试通过在 `git rebase` 和 `git merge-base` 中使用 “<ruby>复刻点<rt>fork-point</rt></ruby>” 机制来从这种情况中恢复，以避免变基非本地提交。
[^5]: 实际上，这取决于 Git 的版本。直到 2.26.0 版，默认的非交互行为以前与交互行为稍有不同，这种方式通常并不重要。 

--------------------------------------------------------------------------------

via: https://git-rebase.io/

作者：[git-rebase][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://git-rebase.io/
[b]: https://github.com/lujun9972
[1]: https://git-scm.com/
[2]: https://git-scm.com/docs/git-rebase

